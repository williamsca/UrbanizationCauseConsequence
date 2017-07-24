set more off

// use "/Users/caw6/Desktop/UrbanizationCauseConsequence/data/unitrootsVA.dta", clear

//drop if missing(estimateVA)
//drop if Year < 2002
local depVar "PctPopUrban"
local indVar "lgGDPLCU"

levels(Country), local(countries)
foreach country of local countries {
	// drop if Country == "`country'" & missing(Year)
	// di "`country'"
	 //xtpedroni `depvar' `indVar' if Country != "`country'" & cointegrated, trend
	if 1 {
		di "`country'"
		xtpedroni `depVar' `indVar' if Country != "`country'" & cointegrated, trend
		xtpedroni `depVar' `indVar' if Country != "`country'" & cointegrated
	}
	// xtwest `depVar' `indVar' if Country == "`country'", trend constant lags(1 2)
}
 // Russia  adf |    .01641     -1.696 

