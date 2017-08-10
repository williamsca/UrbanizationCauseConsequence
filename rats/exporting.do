encode(Country), gen(Code)
replace Code = Code + 1000
drop CountryCode
gen Order = [_n]

