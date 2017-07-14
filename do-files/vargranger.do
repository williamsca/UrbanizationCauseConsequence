//bysort Country (Year): var PctPopUrban GDPPerCapRealLCU 

levels(Country), local(countries)
foreach country of local countries {
	quietly var PctPopUrban GDPPerCapRealLCU if Country == "`country'"
	vargranger 
}
