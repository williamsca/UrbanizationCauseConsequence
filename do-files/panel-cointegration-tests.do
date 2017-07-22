set more off

// use "/Users/caw6/Desktop/UrbanizationCauseConsequence/data/unitrootsVA.dta", clear

//drop if missing(estimateVA)
//drop if Year < 2002
local depVar "PctPopUrban"
local indVar "cum_Govt"

levels(Country), local(countries)
foreach country of local countries {
	// drop if Country == "`country'" & missing(Year)
	// di "`country'"
	 //xtpedroni `depvar' `indVar' if Country != "`country'" & cointegrated, trend
	if "`country'" != "United States" & "`country'" != "Finland" & "`country'" != "Malaysia" {
		di "`country'"
		xtpedroni `depVar' `indVar' if Country != "`country'" & cointegrated
	}
	// xtwest `depVar' `indVar' if Country == "`country'", trend constant lags(1 2)
}

// USA, Switzerland, UK, Australia, France, Finland, Belgium, 
// Finland
// Panama (2.5), Malaysia (1.3), 
