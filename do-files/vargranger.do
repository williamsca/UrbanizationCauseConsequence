//bysort Country (Year): var PctPopUrban GDPPerCapRealLCU 
use "/Users/caw6/Desktop/UrbanizationCauseConsequence/data/Panels/Panel2.dta", clear
set more off

local depVar "PctPopUrban"
local indVar "GDPPerCapRealLCU"

// putexcel set "/Users/caw6/Desktop/UrbanizationCauseConsequence/test-results/Vargranger_results.xlsx", modify sheet("GDPRealLCU")

levels(Country), local(countries)

/*
putexcel A1 = "Country"
putexcel B1 = "GDPPerCap -> PctUrb chi2"
putexcel C1 = "Prob > chi2"
putexcel D1 = "PctUrb -> GDPPerCap chi2"
putexcel E1 = "Prob > chi2"
local i "2"

foreach country of local countries {
	putexcel A`i' = ("`country'")
	local ++i
}*/

local row "2"
foreach country of local countries {
	quietly var PctPopUrban GDPPerCapRealUSD if Country == "`country'" & cointegrated
	vargranger 
	/*
	mat results = r(gstats)
	putexcel B`row' = results[1,1]
	putexcel C`row' = results[1,3]
	putexcel D`row' = results[3,1]
	putexcel E`row' = results[3,3]
	local ++row
	*/
}
/*
var `depVar' `indVar' if Country == "Australia"
vargranger

var `depVar' `indVar' if Country == "Myanmar"
vargranger
*/
