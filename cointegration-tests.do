clear
set more off

use "/Users/caw6/Desktop/UrbanizationCauseConsequence/unitroots.dta"

gen byte cointegrated = 0

/*
regress GDPRealUSD PctPopUrban if Country == "Armenia"
predict residual if Country == "Armenia", res

// Null: 		the residuals are nonstationary -> no cointegration between GDP and Urban
// Alternative: the residuals ARE stationary 	-> cointegration
dfuller residual if Country == "Armenia", nocons lags(2)

line residual Year if Country == "Armenia", title(Armenia: Residuals vs. year)
twoway (scatter residual L.residual) (lfit residual L.residual) if Country == "Armenia", title(Armenia: ///
	Residuals vs. Lagged Residuals)
*/
	
// Do all at once
levels(Country), local(countries)
gen residuals = 0

foreach country of local countries {
	quietly regress GDPRealUSD PctPopUrban if Country == "`country'"
	
	predict temp if Country == "`country'", res
	replace residuals = temp if temp ~= .
	drop temp
	
	dfuller residual if Country == "`country'" & residuals != 0, trend lags(2)
	replace cointegrated = 1 if r(Zt) <= -7.3 & Country == "`country'"
	
	di ""
	di "*******************************************************************************"
	di "*******************************************************************************"
}



