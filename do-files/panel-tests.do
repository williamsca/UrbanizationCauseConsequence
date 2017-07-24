local indVar "PctPopUrban"
// estimateGovt, estimateRegQual
local depVar "GDPPerCapRealLCU"


//xtpedroni `indVar' `depVar' if cointegrated
xtpedroni `indVar' `depVar' /*if Country != "China" & Country != "India" & Country != "Brazil"*/, trend
xtpedroni `indVar' `depVar' /*if Country != "China" & Country != "India" & Country != "Brazil"*/

/*
xtunitroot ips `indVar' if cointegrated == 1
xtunitroot ips `indVar' if cointegrated == 1, trend

xtunitroot ips `depVar' if cointegrated == 1
xtunitroot ips `depVar' if cointegrated == 1, trend
*/
