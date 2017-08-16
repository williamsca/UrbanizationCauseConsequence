local country "China"
//scatter eiu_va gcs_va normVA Year if Country == "`country'", ///
//	title("`country'") saving("`country'", replace) legend(off) ylabel(0(.2)1)

gr combine Australia.gph Chile.gph Croatia.gph Uganda.gph, title("Government Effectiveness")
