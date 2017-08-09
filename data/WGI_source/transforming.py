import csv
source = "EIU"

with open(source + '.csv', 'r', encoding='cp1252') as f:
    reader = csv.reader(f)
    dataList = list(reader)

with open(source + "-fixed.csv", "w+", newline = '') as f:
    writer = csv.writer(f)

    variables = ['Country', 'CountryCode', 'Year', 'EUI_VA', 'EUI_Govt']
    writer.writerow(variables)

    obs = []
    for entry in dataList[2:]:
        i = 2
        for year in range(2015, 2001, -1):
            obs.append(entry[0])
            obs.append(entry[1])
            obs.append(year)
            obs.append(entry[i])
            obs.append(entry[i+1])
            writer.writerow(obs)
            obs = []
            i += 2

        for year in range(2000, 1995, -2):
            obs.append(entry[0])
            obs.append(entry[1])
            obs.append(year)
            obs.append(entry[i])
            obs.append(entry[i+1])
            writer.writerow(obs)
            obs = []
            i += 2
f.close()
