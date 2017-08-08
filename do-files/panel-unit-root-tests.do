// clear
set more off

// cointegratedGovt, cointegratedRegQual
// use "/Users/caw6/Desktop/UrbanizationCauseConsequence/data/cointegratedRegQual.dta"
local testVar "estimateVA"

levels(Country), local(countries)
foreach country of local countries {
	di "`country'"
	//xtunitroot ips estimateRegQual if Country == "`country'"
	//xtunitroot ips `testVar' if Country = "`country'", trend
	xtunitroot ips `testVar' if Country != "`country'"
}

// Malaysia, Belgium, Benin, Suriname, Italy, Austria, Dominican Republic
// El Salvador, Burkina Faso, Finland, Netherlands, Saudi Arabia, Slovenia,
// Estonia, 
