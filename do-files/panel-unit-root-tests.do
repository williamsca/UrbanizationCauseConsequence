clear
set more off

use "/Users/caw6/Desktop/UrbanizationCauseConsequence/data/cointegratedGDPPerCapLCU.dta"

levels(Country), local(countries)
foreach country of local countries {
	di "`country'"
	xtunitroot ips PctPopUrban if Country == "`country'"
	xtunitroot llc PctPopUrban if Country == "`country'"
}
