//bysort Country (Year): var PctPopUrban GDPPerCapRealLCU 
local varOne "PctPopUrban"
local varTwo "GDPPerCapRealLCU"

putexcel set "/Users/caw6/Desktop/UrbanizationCauseConsequence/test-results/Vargranger_results_fixed.xlsx", modify sheet(`varTwo')
/*
putexcel A1 = "Country"
local i "2"
foreach country of local countries {
	putexcel A`i' = ("`country'")
	local ++i
}*/

/*
use "/Users/caw6/Desktop/UrbanizationCauseConsequence/test-results/Panel1.dta"
levels(Country), local(countries)
foreach country of local countries {
	quietly var PctPopUrban GDPPerCapRealLCU if Country == "`country'"
	vargranger 
}
*/

var `depVar' `indVar' if Country == "Armenia"
vargranger

