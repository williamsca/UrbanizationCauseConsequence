use "/Users/caw6/Desktop/UrbanizationCauseConsequence/LaborForce/LForcePanel.dta", clear

collapse (sum) lforcetotal lforcepartymilototal lforcepartyfilototal, by(region year)
drop if region == ""
drop if year < 2005
gen lforcepartymilo = lforcepartymilototal / lforcetotal
gen lforcepartyfilo = lforcepartyfilototal / lforcetotal

encode region, gen(rgn)
xtset rgn year

save "/Users/caw6/Desktop/UrbanizationCauseConsequence/LaborForce/LForcePanel_collapsed.dta", replace
