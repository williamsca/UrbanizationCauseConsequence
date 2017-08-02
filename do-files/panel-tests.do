local indVar "PctUrb"
// estimateGovt, estimateRegQual
local depVar "cum_Ctrl"

/*
//xtpedroni `indVar' `depVar' if cointegrated
xtpedroni `depVar' `indVar' /*if Country != "China" & Country != "India" & Country != "Brazil"*/, trend
xtpedroni `depVar' `indVar' /*if Country != "China" & Country != "India" & Country != "Brazil"*/
*/

xtunitroot ips `indVar'
xtunitroot ips `indVar', trend

xtunitroot ips `depVar'
xtunitroot ips `depVar'

