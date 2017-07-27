local var "cum_Govt"

levels(CountryCode), local(countries)

//TODO: make graphs scale to 40
foreach country of local countries {
	twoway (scatter cum_PctUrb Year, yaxis(1)) (scatter cum_Govt Year, yaxis(2)) ///
		if CountryCode == "`country'", title("`country'") ///
		saving("`country'", replace) yscale(range(-30 0) axis(2)) ///
		ylabel(-30(10)0, axis(2)) yscale(range(0 1000) axis(1)) ///
		ylabel(0(250)1000, axis(1))
}

//gr combine DEU.gph KOR.gph EST.gph CZE.gph
gr combine LBR.gph MLI.gph NER.gph AFG.gph
