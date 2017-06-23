clear
set more off

use "/Users/caw6/Desktop/UrbanizationCauseConsequence/unitroots.dta"
gen byte cointegrated = 0

// No trend:	 -3.635118
// With trend: 	 -4.257586
scalar criticalValue = -4.257586
local testSpec "trend lags(4)"

/*
local country "Italy"

regress GDPRealUSD PctPopUrban if Country == "`country'"
predict residual if Country == "`country'", res

// Null: 		the residuals are nonstationary -> no cointegration between GDP and Urban
// Alternative: the residuals ARE stationary 	-> cointegration
dfuller residual if Country == "`country'"

line residual Year if Country == "`country'", title(`country': Residuals vs. year)
twoway (scatter residual L.residual) (lfit residual L.residual) if Country == "`country'", title(`country': ///
	Residuals vs. Lagged Residuals)
*/
	
	
// Engle-Granger
// Non-stationary residuals -> no cointegration
levels(Country), local(countries)
gen residuals = 0

foreach country of local countries {
	quietly regress GDPRealUSD PctPopUrban if Country == "`country'"
	
	predict temp if Country == "`country'", res
	replace residuals = temp if temp ~= .
	drop temp
	
	di "Country: `country'"
	// Null: variable contains a unit root
	// Alternative: residuals are stationary -> cointegration
	dfuller residual if Country == "`country'" & residuals != 0, `testSpec'
	replace cointegrated = 1 if r(Zt) <= criticalValue & Country == "`country'"
	
	
	di "*******************************************************************************"
	di "*******************************************************************************"
}

tab Country if cointegrated == 1

// But then a panel cointegration test indicates no cointegration:
xtwest GDPRealUSD PctPopUrban if cointegrated == 1, constant lags(1 4)


