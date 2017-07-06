clear
set more off

use "/Users/caw6/Desktop/UrbanizationCauseConsequence/data/toy.dta"

local res "0"
replace residuals = `res'
local indVar "PctPopUrban"
local depVar "PerCapGDP"
local country "Argentina"
local testSpec ""

/*
rename  GDPPerCapRealUSD PerCapGDP
keep if Country == "`country'"
drop estimate*
drop PctPopMillUrb
drop TotalPop
drop TotalLand
drop GDP*
drop Country
drop Gini*
drop Total*
drop Churb
drop Urb*
drop Region
drop Income
drop RegionNum
drop IncomeNum
*/

quietly regress `indVar' `depVar'

predict temp, res
replace residuals = temp if temp ~= .
drop temp

dfuller residuals if residuals != `res', `testSpec'
