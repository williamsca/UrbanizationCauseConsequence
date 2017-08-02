set more off

// use "/Users/caw6/Desktop/UrbanizationCauseConsequence/data/unitrootsVA.dta", clear

//drop if missing(estimateVA)
//drop if Year < 2002
local depVar "cum_RuleLaw"
local indVar "PctUrb"

levels(Country), local(countries)
foreach country of local countries {
	// drop if Country == "`country'" & missing(Year)
	// di "`country'"
	 //xtpedroni `depvar' `indVar' if Country != "`country'" & cointegrated, trend
	if 1 {
		di "`country'"
		//xtpedroni `depVar' `indVar' if Country != "`country'" & cointegrated, trend
		xtpedroni `depVar' `indVar' if Country != "`country'"
	}
	// xtwest `depVar' `indVar' if Country == "`country'", trend constant lags(1 2)
}

// Paraguay, Botswana, Zambia, Guinea-Bissau
// Azerbaijan
