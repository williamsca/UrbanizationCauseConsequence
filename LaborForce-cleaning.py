import csv

with open('long.csv', 'r') as f:
    reader = csv.reader(f)
    dataList = list(reader)

with open('long-transformed.csv', 'a+', newline = '') as g:
    writer = csv.writer(g)

    names = ['Year', 'CountryCode', 'Country']
    for entry in dataList[1:]:
        if entry[2] not in names:
            names.append(entry[2])
    writer.writerow(names)

    countries = {}
    for entry in dataList[1:]:
        if entry[5] and entry[5] not in countries.keys():
            countries[entry[5]] = entry[4]

    obs = []
    for i in range(1996, 2017):
        for code, country in countries.items():
            obs.append(str(i))
            obs.append(code)
            obs.append(country)
            for entry in dataList[1:]:
                if (entry[1] == str(i)) and (entry[5] == code):
                    obs.append(entry[6])
            writer.writerow(obs)
            obs = []
