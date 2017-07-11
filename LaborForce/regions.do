/*
replace region = "BR" if country == "Brazil"

replace region = "EUNE" if country == "Sweden" | country == "Finland" | ///
country == "Norway" | country == "Estonia" | country == "Latvia" | ///
country == "Lithuania" | country == "Belarus" | country == "Ukraine" | ///
country == "Moldova" | country == "Romania" | country == "Bulgaria" | ///
country == "Greece" | country == "Macedonia, FYR" | country == "Albania" | ///
country == "Serbia" | country == "Montenegro" | country == "Bosnia and Herzegovina" | ///
country == "Croatia" | country == "Slovenia" | ///
country == "Poland" | country == "Czech Republic" | country == "Denmark"

replace region = "EUW" if country == "United Kingdom" | country == "Ireland" | ///
country == "Portugal" | country == "Spain" | country == "France" | ///
country == "Italy" | country == "Belgium" | country == "Netherlands" | ///
country == "Germany" | country == "Luxembourg" | country == "Switzerland" | ///
country == "Austria" | country == "Andorra"

// Missed a few here
replace region = "LAN" if country == "Mexico" | country == "Guatemala" | ///
country == "Honduras" | country == "Belize" | country == "El Salvador" | ///
country == "Nicaragua" | country == "Costa Rica" | country == "Panama" | ///
country == "Peru" | country == "Ecuador" | country == "Colombia" | ///
country == "Venezuela" | country == "Grenada" | country == "Barbados" | ///
country == "St. Lucia" | country == "Dominica" | country == "Montserrat" | ///
country == "Antigua and Barbuda" | country == "St. Kitts and Nevis" | ///
country == "Anguilla" | country == "Virgin Islands (U.S.)" | ///
country == "British Virgin Islands" | country == "Puerto Rico" | ///
country == "Dominican Republic" | country == "Haiti" | country == "Jamaica" | ///
country == "Cuba" | country == "Turks and Caicos Islands" | country == "Bahamas, The" | ///
country == "Aruba" | country == "Curacao"

replace region = "LAS" if country == "Argentina" | country == "Chile" | ///
country == "Uruguay" | country == "Paraguay" | country == "Bolivia"

replace region = "NA" if country == "Canada" | country == "United States"

replace region = "OCE" if country == "Australia" | country == "New Zealand"

replace region = "RU" if countrycode == "RUS" | countrycode == "KAZ" | ///
country == "Uzbekistan" | country == "Turkmenistan" | country == "Georgia" | ///
country == "Azerbaijan"
/*| country == "Ukraine" | ///
country == "Belarus" | country == "Lithuania" | country == "Latvia" | ///
country == "Estonia" 
*/


replace region = "TR" if country == "Turkey"
replace region = "JP" if country == "Japan"

replace region = "KR" if country == "Korea, Rep."
replace region = "SEA" if country == "Singapore" | country == "Malaysia" | ///
country == "Philippines" | country == "Taiwan" | country == "Vietnam" | ///
country == "Thailand" | country == "Indonesia"
replace region = "CN" if country == "China"
*/
