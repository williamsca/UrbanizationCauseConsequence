// Year coding
gen server = 0

replace server = 1 if region == "BR" & Year >= 2013
replace server = 1 if region == "EUNE" & Year >= 2010
replace server = 1 if region == "EUW" & Year >= 2010
replace server = 1 if region == "LAN" & Year >= 2013
replace server = 1 if region == "LAS" & Year >= 2013
replace server = 1 if region == "NA" & Year >= 2010
replace server = 1 if region == "OCE" & Year >= 2013
replace server = 1 if region == "RU" & Year >= 2013
replace server = 1 if region == "TR" & Year >= 2013
replace server = 1 if region == "JP" & Year >= 2016
replace server = 1 if region == "SEA" & Year >= 2010
replace server = 1 if region == "KR" & Year >= 2011
replace server = 1 if region == "CN" & Year >= 2011
