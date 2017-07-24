// gen cumulative WGI variables
local var "PctPopUrban"
sort Country Year
by Country: replace cum_PctUrb = sum(`var')
replace cum_PctUrb = . if cum_PctUrb == 0

// Year smoothing
/*
levels(Country), local(countries)
foreach country of local countries {
	replace `var' = (`var'[_n-1] + `var'[_n+1]) / 2 if ///
	Country == "`country'" & (Year == 1997 | Year == 1999 | Year == 2001)
}*/
