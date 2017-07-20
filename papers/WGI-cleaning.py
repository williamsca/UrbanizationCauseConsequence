import csv
var = 'RuleOfLaw'

with open('data/WGI/' + var + '.csv', 'rb') as f:
    reader = csv.reader(f)
    dataList = list(reader)

with open('data/WGI/' + var + '-transformed.csv', 'a+') as g:
    writer = csv.writer(g)

    for country in dataList[2:]:
        for i in range(2, len(dataList[0]), 6):
            obs = []
            curYear = dataList[0][i]
            obs.append(curYear)
            obs.append(country[0])
            obs.append(country[1])
            for j in range(i, i+6):
                obs.append(country[j])
            writer.writerow(obs)
