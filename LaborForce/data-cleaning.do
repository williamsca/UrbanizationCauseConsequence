use "/Users/caw6/Desktop/UrbanizationCauseConsequence/LaborForce/LForcePanel.dta", clear

collapse (sum) lforcetotal lforcepartymiloweight lforcepartyfiloweight, by(region year)
drop if region == ""
gen lforcepartymilo = lforcepartymilototal / lforcetotal

encode region, gen(rgn)
xtset rgn year

save "/Users/caw6/Desktop/UrbanizationCauseConsequence/LaborForce/LForcePanel_collapsed.dta", replace
