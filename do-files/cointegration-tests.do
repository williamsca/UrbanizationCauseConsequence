clear
set more off

use "/Users/caw6/Desktop/UrbanizationCauseConsequence/data/WDIUrbanDev-clean.dta"

/*
// Drop countries for which GDP per capita does not have a unit root
drop if Country == "Burundi"
drop if Country == "United Arab Emirates"
drop if Country == "Madagascar"
drop if Country == "Zimbabwe"
drop if Country = "Eritrea" 
drop if Country == "Bosnia and Herzegovina"
*/

gen byte cointegrated = 0

// No trend:	 -3.635118
// With trend: 	 -4.257586
// TODO: calculate nocons critical value?
scalar criticalValue = -4.257586
local testSpec "trend lags(3)"
local column "O"
local indVar "PctPopUrban" // GDPRealUSD, GDPRealLCU, GDPPerCapRealUSD
local depVar "GDPPerCapRealUSD" // PctPopUrban, PctPopMillUrb

levels(Country), local(countries)
putexcel set "/Users/caw6/Desktop/UrbanizationCauseConsequence/test-results/Cointegration/Cointegration_results_2.xlsx", modify sheet(`indVar'`depVar')

/*
putexcel A1 = "Country"
local i "2"
foreach country of local countries {
	putexcel A`i' = ("`country'")
	local ++i
}*/

// Engle-Granger
// Non-stationary residuals -> no cointegration
gen residuals = 0
putexcel `column'1 = "`testSpec'"
local row "2"
foreach country of local countries {
	quietly capture regress `indVar' `depVar' if Country == "`country'"
	
	capture predict temp if Country == "`country'", res
	capture replace residuals = temp if temp ~= .
	capture drop temp
	
	// di "Country: `country'"
	// Null: variable contains a unit root
	// Alternative: residuals are stationary -> cointegration
	capture dfuller residual if Country == "`country'" & residuals != 0, `testSpec'
	
	if (_rc == 0) {
		putexcel `column'`row' = (r(Zt))
	} 
	else {
		putexcel `column'`row' = "N/A"
	}
	replace cointegrated = 1 if r(Zt) <= criticalValue & Country == "`country'"
	local ++row
}
tab Country if cointegrated == 1


// But then a panel cointegration test indicates no cointegration:
// xtwest GDPRealUSD PctPopUrban if cointegrated == 1, constant lags(1 4)

/*
// Single case with graphs
local country "Belize"

regress `indVar' `depVar' if Country == "`country'"
predict residual if Country == "`country'", res

// Null: 		the residuals are nonstationary -> no cointegration between GDP and Urban
// Alternative: the residuals ARE stationary 	-> cointegration
dfuller residual if Country == "`country'", `testSpec'

twoway (scatter `indVar' `depVar') (lfit `indVar' `depVar') if Country == "`country'"
// line residual Year if Country == "`country'", title(`country': Residuals vs. year)
// twoway (scatter residual L.residual) (lfit residual L.residual) if Country == "`country'", title(`country': ///
//	Residuals vs. Lagged Residuals)
*/
