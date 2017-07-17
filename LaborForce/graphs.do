//gen diff = lforcepartymilo - lforcepartyfilo

xtline diff if region == "NA" | region == "LAN" | region == "LAS" | region == "BR", overlay

