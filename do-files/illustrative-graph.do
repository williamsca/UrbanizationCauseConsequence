gen ChGDP_PC = 0
bysort Country (Year): replace ChGDP_PC = ///
	(GDPPerCapRealLCU[56] - GDPPerCapRealLCU[1]) / GDPPerCapRealLCU[1]

twoway (lfit Churb ChGDP_PC) (scatter Churb ChGDP_PC), ///
	title("Percent changes in real per capita GDP against urbanization") ///
	ytitle("% change in urbanization")
