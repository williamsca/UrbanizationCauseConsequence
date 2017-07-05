clear
set more off

use "/Users/caw6/Desktop/UrbanizationCauseConsequence/data/cointegratedVA.dta"

<<<<<<< HEAD
replace cointegrated = 0

// No trend:	 -3.635118
// With trend: 	 -4.257586
scalar criticalValue = -10
local testSpec "trend lags(2)"
//local column "B"
local indVar "PctPopUrban" // GDPRealUSD, GDPRealLCU, GDPPerCapRealUSD
local depVar "estimateVA" // PctPopUrban, PctPopMillUrb

levels(Country), local(countries)
//putexcel set "/Users/caw6/Desktop/UrbanizationCauseConsequence/test-results/Cointegration/Coint_with_unit_roots.xlsx", modify sheet(`indVar'`depVar')
=======
gen byte cointegrated = 0

// No trend:	 -3.635118
// With trend: 	 -4.257586
scalar criticalValue = -4.257586
local testSpec "trend"
local column "J"
local indVar "PctPopUrban" // GDPRealUSD, GDPRealLCU, GDPPerCapRealUSD
local depVar "estimateGovt" // PctPopUrban, PctPopMillUrb

levels(Country), local(countries)
putexcel set "/Users/caw6/Desktop/UrbanizationCauseConsequence/test-results/Cointegration/WGICointegration_results.xlsx", modify sheet(`indVar'`depVar')
>>>>>>> 1bb7e2cf2e07f70e9bbb2e5abe3aa01f5f1b0795

/*
putexcel A1 = "Country"
local i "2"
foreach country of local countries {
	putexcel A`i' = ("`country'")
	local ++i
}*/

<<<<<<< HEAD

replace residuals = 0
//putexcel `column'1 = "`testSpec'"
=======
// Engle-Granger
// Non-stationary residuals -> no cointegration
gen residuals = .
putexcel `column'1 = "`testSpec'"
>>>>>>> 1bb7e2cf2e07f70e9bbb2e5abe3aa01f5f1b0795
local row "2"
foreach country of local countries {

	// Engle-Granger
	// Non-stationary residuals -> no cointegration
	quietly capture regress `indVar' `depVar' if Country == "`country'"
	
	capture predict temp if Country == "`country'", res
	capture replace residuals = temp if temp ~= .
	capture drop temp
	
	// Null: variable contains a unit root
	// Alternative: residuals are stationary -> cointegration
<<<<<<< HEAD
	 dfuller residual if Country == "`country'" & residuals != 0, `testSpec'
=======
	capture dfuller residuals if Country == "`country'" & residuals != ., `testSpec'
>>>>>>> 1bb7e2cf2e07f70e9bbb2e5abe3aa01f5f1b0795
	
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
xtpedroni PctPopUrban estimateVA if cointegrated == 1, trend


// A panel cointegration test indicates  cointegration:
xtpedroni `indVar' `depVar' if cointegrated == 1, trend

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
