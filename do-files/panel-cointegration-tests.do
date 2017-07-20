clear
set more off

use "/Users/caw6/Desktop/UrbanizationCauseConsequence/data/unitrootsVA.dta"

// One potential panel
// keep if Year >= 1968
// keep if Country == "Egypt, Arab Rep." | Country == "Australia" | Country == "Sri Lanka" | Country == "Suriname" | Country == "Sweden" | Country == "Canada" | Country == "Cambodia" | Country == "Djibouti" | Country == "France" | Country == "Kazakhstan" | Country == "Norway" | Country == "Saudi Arabia" 
// keep if Country == "Egypt, Arab Rep." | Country == "Australia" | Country == "Sri Lanka" | Country == "Sweden" | Country == "Canada" | Country == "France" | Country == "Norway"

//drop if missing(estimateVA)
//drop if Year < 2002
//xtpedroni PctPopUrban estimateVA, trend
local depVar "PctPopUrban"
local indVar "cum_RegQual"

levels(Country), local(countries)
foreach country of local countries {
	// drop if Country == "`country'" & missing(Year)
	di "`country'"
	xtpedroni PctPopUrban estimateVA if Country == "`country'" & cointegrated, trend
	xtpedroni PctPopUrban 
	xtwest PctPopUrban estimateVA if Country == "`country'", trend constant lags(1 2)
}


