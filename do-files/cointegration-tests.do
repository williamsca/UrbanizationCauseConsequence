clear
set more off

//use "/Users/caw6/Desktop/UrbanizationCauseConsequence/data/WDIUrbanDev-clean.dta"
use "C:\Users\Colin\Desktop\UrbanizationCauseConsequence\data\WDIUrbanDev-WGI.dta", clear

gen byte cointegrated = 0

// N = 25, no trend: -3.635   ; with trend: -4.258
// N = 45, no trend: −3.475	  ; with trend: −3.998
scalar criticalValue = -4.2
local testSpec "trend"
local column "B"
local indVar "cum_Govt" // GDPRealUSD, GDPRealLCU, GDPPerCapRealUSD, GDPPerCapRealLCU
local depVar "PctPopUrban" // PctPopUrban, PctPopMillUrb

levels(Country), local(countries)
//putexcel set "/Users/caw6/Desktop/UrbanizationCauseConsequence/test-results/Cointegration/WGICointegration_results_fixed.xlsx", modify sheet(`indVar'`depVar')

/*
putexcel A1 = "Country"
local i "2"
foreach country of local countries {
	putexcel A`i' = ("`country'")
	local ++i
}*/

// Engle-Granger
// Non-stationary residuals -> no cointegration
gen residuals = .
//putexcel `column'1 = "`testSpec'"
local row "2"
foreach country of local countries {
	quietly capture regress `depVar' `indVar' if Country == "`country'"
	
	capture predict temp if Country == "`country'", res
	capture replace residuals = temp if temp ~= .
	capture drop temp
	
	// di "Country: `country'"
	// Null: variable contains a unit root
	// Alternative: residuals are stationary -> cointegration
	capture dfuller residuals if Country == "`country'" & residuals != ., `testSpec'
	
	/*
	if (_rc == 0) {
		putexcel `column'`row' = (r(Zt))
	} 
	else {
		putexcel `column'`row' = "N/A"
	}*/
	
	replace cointegrated = 1 if r(Zt) <= criticalValue & Country == "`country'"
	local ++row
}
tab Country if cointegrated == 1

// A panel cointegration test indicates  cointegration:
xtpedroni `depVar' `indVar' if cointegrated == 1
// xtpedroni `depVar' `indVar' if cointegrated == 1, trend

/*
// Single case with graphs
local country "Korea, Dem. People’s Rep."

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
