//bysort Country (Year): var PctPopUrban GDPPerCapRealLCU 
//use "/Users/caw6/Desktop/UrbanizationCauseConsequence/data/Panels/PanelGovt.dta", clear
set more off

local depVar "cum_Govt"
local indVar "cum_PctUrb"

//putexcel set "/Users/caw6/Desktop/UrbanizationCauseConsequence/test-results/Vargranger_results.xlsx", modify sheet("cum_Ctrl")
putexcel set "/Users/Colin/Desktop/UrbanizationCauseConsequence/test-results/Vargranger_results.xlsx", modify sheet("cum_Govt")


levels(Country), local(countries)
putexcel A1 = "Country"
putexcel B1 = "cum_Govt -> PctUrb chi2"
putexcel C1 = "Prob > chi2"
putexcel D1 = "PctUrb -> cum_Govt chi2"
putexcel E1 = "Prob > chi2"

local i "2"
foreach country of local countries {
	putexcel A`i' = ("`country'")
	local ++i
}

local row "2"
foreach country of local countries {
	quietly var `depVar' `indVar' if Country == "`country'"
	vargranger 
	
	mat results = r(gstats)
	putexcel B`row' = results[1,1]
	putexcel C`row' = results[1,3]
	putexcel D`row' = results[3,1]
	putexcel E`row' = results[3,3]
	local ++row
	
}
/*
var `depVar' `indVar' if Country == "Australia"
vargranger

var `depVar' `indVar' if Country == "Myanmar"
vargranger
*/
