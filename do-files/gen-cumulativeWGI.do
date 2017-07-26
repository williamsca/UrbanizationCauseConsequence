// gen cumulative WGI variables
local var ""
sort Country Year
by Country: replace cum_`var' = sum(estimate`var')
//replace cum_`var' = . if cum_`var' == 0

/*
// Year smoothing
levels(Country), local(countries)
foreach country of local countries {
	replace `var' = (`var'[_n-1] + `var'[_n+1]) / 2 if ///
	Country == "`country'" & (Year == 1997 | Year == 1999 | Year == 2001)
}
*/
