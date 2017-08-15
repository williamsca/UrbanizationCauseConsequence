// The program assumes that the data are in panel form and that the panel
// variable is named "Country"

set more off

local testVar "RsrcRnts"
local test "ips" // ips allows for unbalanced panels
local testSpec "" // may want to include a trend

// This will need to be changed depending on the test you are running
// Use 'tds' for LLC and 'zttildebar' for IPS
local testStat "zttildebar"

// We fail to reject the null that all panels contain a unit root with 
// this level of confidence
scalar confidenceLevel = .8 

////////////////////////////////////////////////////////////////////////////
scalar maxZtTilde = -50
scalar maxP = 0
scalar noUnitRoot = ""
levels(Country), local(countries)

// Repeated unit root tests
while maxP < confidenceLevel {
	foreach country of local countries {
		// di "`country'"
		xtunitroot `test' `testVar' if Country != "`country'"
		if r(`testStat') > maxZtTilde {
			scalar maxZtTilde = r(`testStat')
			scalar noUnitRoot = "`country'"
			scalar maxP = r(p_`testStat')
		}
	}
	drop if Country == noUnitRoot
}


