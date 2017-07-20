local indVar "cum_Govt"
// estimateGovt, estimateRegQual
local depVar "PctPopUrban"


//xtpedroni `indVar' `depVar' if cointegrated
xtpedroni `indVar' `depVar' if coint_Govt, trend
xtpedroni `indVar' `depVar' if coint_Govt

/*
xtunitroot ips `indVar' if cointegrated == 1
xtunitroot ips `indVar' if cointegrated == 1, trend

xtunitroot ips `depVar' if cointegrated == 1
xtunitroot ips `depVar' if cointegrated == 1, trend
*/
