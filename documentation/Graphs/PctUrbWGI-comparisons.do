local year "2015"
local depVar "PctPopUrban"
local indVar "Ctrl"

regress PctPopUrban GDPPerCapRealLCU
predict residual, res

twoway (scatter `depVar' estimate`indVar' if Year == `year', legend(label(1 "2015 PctPopUrban"))) ///
	   (lfit `depVar' estimate`indVar' if Year == `year', legend(label(2 "2015 Fitted Value"))) ///
	   (scatter `depVar' estimate`indVar' if Year == 1996, legend(label(3 "1996 PctPopUrban")) color(green)) ///
	   (lfit `depVar' estimate`indVar' if Year == 1996, legend(label(4 "1996 Fitted Value")) color(brown)), ///
	   title(`depVar') /*saving(`indVar', replace) yscale(range(0 100))*/
	   
drop res
	   
//gr combine
