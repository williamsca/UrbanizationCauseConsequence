// scale var to be between 1 and 100
local var "GDPPerCapRealLCU"
levels(Country), local(countries)
gen scaled_`var' = .
foreach country of local countries { 
	su `var' if Country == "`country'", meanonly 
	replace scaled_`var' = (`var' - r(min))/(r(max) - r(min)) 
}
