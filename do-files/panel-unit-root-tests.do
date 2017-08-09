set more off

// use "/Users/caw6/Desktop/UrbanizationCauseConsequence/data/cointegratedRegQual.dta", clear
local testVar "RsrcRnts"

scalar maxZtTilde = -50
scalar maxP = 0
scalar noUnitRoot = ""
levels(Country), local(countries)

while maxP < .80 {
	foreach country of local countries {
		//di "`country'"
		xtunitroot ips `testVar' if Country != "`country'"
		if r(zttildebar) > maxZtTilde {
			scalar maxZtTilde = r(zttildebar)
			scalar noUnitRoot = "`country'"
			scalar maxP = r(p_zttildebar)
		}
	}
	
	drop if Country == noUnitRoot
}
/*

foreach country of local countries {
	di "`country'"
	//xtunitroot ips estimateRegQual if Country == "`country'"
	//xtunitroot ips `testVar' if Country = "`country'", trend
	xtunitroot ips `testVar' if Country != "`country'"
	if r(zttildebar) > maxZtTilde {
		scalar maxZtTilde = r(zttildebar)
		scalar noUnitRoot = "`country'"
		display noUnitRoot
		display maxZtTilde
	}
}
drop if Country == noUnitRoot
*/

// Malaysia, Belgium, Benin, Suriname, Italy, Austria, Dominican Republic
// El Salvador, Burkina Faso, Finland, Netherlands, Saudi Arabia, Slovenia,
// Estonia, 


// xtunitroot ips `testVar' if Region == "Sub-Saharan Africa"
// xtpedroni RsrcRnts PctPopUrban

