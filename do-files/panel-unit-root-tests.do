clear
set more off

use "/Users/caw6/Desktop/UrbanizationCauseConsequence/data/cointegratedGDPRealLCU.dta"

levels(Country), local(countries)
foreach country of local countries {
	di "`country'"
	xtunitroot ips PctPopUrban if Country == "`country'"
	xtunitroot ips PctPopUrban if Country == "`country'", trend
	//xtunitroot llc PctPopUrban if Country == "`country'"
}

// Kyrgyz Republic*, Egpyt*, 
// Chile* 
