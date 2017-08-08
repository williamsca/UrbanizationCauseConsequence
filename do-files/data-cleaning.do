clear
set more off

use "/Users/caw6/Desktop/UrbanizationCauseConsequence/data/WDIUrbanDev.dta"
//use "C:\Users\Colin\Desktop\UrbanizationCauseConsequence\data\WDIUrbanDev.dta", clear


// Drop countries with fewer than ten years of GDPRealUSD data
levels(Country), local(countries)
foreach country of local countries {
	quietly sum GDPRealUSD if Country == "`country'"
	drop if r(N) < 10 & Country == "`country'"
}

drop stderr*
drop numsrc*
drop rank*
drop lower*
drop upper*

sort Country Year

/*
// Strong balancing (must have GDPRealUSD for 1990 - 2015)
keep if Year >= 1990
keep if !missing(GDPRealUSD)
bysort Country: gen nyear = [_N]
keep if nyear == 26
drop nyear
*/

save "/Users/caw6/Desktop/UrbanizationCauseConsequence/data/WDIUrbanDev-clean.dta", replace
