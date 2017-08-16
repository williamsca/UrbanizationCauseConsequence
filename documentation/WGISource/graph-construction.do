local country "Finland"
scatter eiu_govt gcs_govt estimateGovt Year if Country == "`country'", ///
	title("`country'") saving("`country'", replace) legend(off) ylabel(0.5(0.5)2.5)

gr combine Australia.gph Finland.gph Belgium.gph Germany.gph, title("Government effectiveness source data")
