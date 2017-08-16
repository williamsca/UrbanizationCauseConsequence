// Analysis of Labor Force Participation Data
set more off

xtreg lforcepartymilo server /*pctPopInternet*/ c.Year##c.Year c.Year#i.rgn unempymilo if Year >= 2005
