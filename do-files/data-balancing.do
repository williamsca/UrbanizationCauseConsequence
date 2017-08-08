set more off

/*
levels(Region), local(regions)
foreach region of local regions {	
	di "`region'"
	// tab Year if !missing(RsrcRnts) & Region == "`region'"	
}
*/

/*
drop if missing(RsrcRnts)
bysort Country: drop if _N < 46
*/
