local indVar "PctPopUrban"
local depVar "GDPRealLCU"

xtpedroni `indVar' `depVar' if cointegrated == 1, trend
//xtpedroni `indVar' `depVar' if cointegrated == 1
xtunitroot ips `indVar' if cointegrated == 1, trend
//xtunitroot ips `indVar' if cointegrated == 1
xtunitroot ips `depVar' if cointegrated == 1, trend
//xtunitroot ips `depVar' if cointegrated == 1
