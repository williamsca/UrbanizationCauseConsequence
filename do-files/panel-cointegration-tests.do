clear
set more off

use "/Users/caw6/Desktop/UrbanizationCauseConsequence/data/unitrootsVA.dta"

drop if missing(estimateVA)
drop if Year < 2002
//xtpedroni PctPopUrban estimateVA, trend


levels(Country), local(countries)
foreach country of local countries {
	// drop if Country == "`country'" & missing(Year)
	di "`country'"
	xtpedroni PctPopUrban estimateVA if Country == "`country'", trend
	xtwest PctPopUrban estimateVA if Country == "`country'", trend constant lags(1 2)
}


