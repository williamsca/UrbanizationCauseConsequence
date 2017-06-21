clear
set more off

use "/Users/caw6/Desktop/UrbanizationCauseConsequence/WDIUrbanDev.dta"

// Drop countries with fewer than ten years of GDPRealUSD data
levels(Country), local(countries)
foreach country of local countries {
	// di "`country'"
	quietly sum GDPRealUSD if Country == "`country'"
	di "`country'"
	drop if r(N) < 10 & Country == "`country'"
}

/*
// Strong balancing (must have GDPRealUSD for 1990 - 2015)
keep if Year >= 1990
keep if !missing(GDPRealUSD)
bysort Country: gen nyear = [_N]
keep if nyear == 26
drop nyear
*/

// replace "/Users/caw6/Desktop/UrbanizationCauseConsequence/WDIUrbanDev-clean.dta"
