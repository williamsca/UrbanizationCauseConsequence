clear
set more off

// cointegratedGovt, cointegratedRegQual
use "/Users/caw6/Desktop/UrbanizationCauseConsequence/data/cointegratedVA.dta"

levels(Country), local(countries)
foreach country of local countries {
	di "`country'"
	//xtunitroot ips estimateRegQual if Country == "`country'"
	xtunitroot ips estimateVA if Country == "`country'", trend
	xtunitroot ips estimateVA if Country == "`country'"
}

// United Arab Emirates, Morocco, Uganda*, Kenya, Burkina Faso*
