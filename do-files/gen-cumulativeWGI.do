// gen cumulative WGI variables
local var "RuleLaw"
sort Country
by Country: gen cum_`var' = sum(estimate`var'  + 3)
replace cum_`var' = . if cum_`var' == 0
