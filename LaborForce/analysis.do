// Analysis of Labor Force Participation Data
set more off

xtreg lforcepartymilo server pctPopInternet c.Year##c.Year##c.Year c.Year#i.rgn unempymilo gdpgrowth if Year >= 2004

predict residuals, ue
//twoway scatter lforcepartymilo Year if region == "NA"
twoway (scatter res Year) (lfit res Year if server) (lfit res Year if !server) ///
	if region == "NA"

drop residual
