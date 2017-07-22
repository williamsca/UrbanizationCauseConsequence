local var "GDPPerCapRealLCU"

drop if missing(`var')
drop CountryNum
encode(CountryCode), generate(CountryNum)
xtset CountryNum Year

gen indx`var' = .
gen byte first = 0
bysort CountryNum (Year): replace first = 1 if _n == 1
egen firstVar = min(`var' / (first == 1)), by(CountryNum) 
replace indx`var' = `var' / firstVar * 100

xtline indx`var', overlay title("GDP Per Capita in Real Local Currency") ///
subtitle("Index, First Observation = 100") ytitle("GDP") xtitle("Year") ///
legend(off) ytick(100) note("") ///

//graph export `var'"_2".pdf
drop first*
//drop indx*
/*
Country
France
Belgium
Iceland
Australia
Germany
United Kingdom
Switzerland
*/
