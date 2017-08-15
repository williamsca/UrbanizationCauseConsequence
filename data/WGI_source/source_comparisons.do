local country "United States"
scatter eiu_govt gcs_govt estimateGovt Year if Country == "`country'", title("`country'") saving(`"country"') legend(off)
