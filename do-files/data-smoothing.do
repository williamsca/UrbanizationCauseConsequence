// data smoothing
bysort Country Year: replace eiu_va = (eiu_va[_n-1]+eiu_va[_n+1]) / 2 if eiu_va == 2
