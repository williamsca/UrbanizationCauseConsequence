import csv
import math

with open('UrbGDPLCU.csv', 'rb') as f:
    reader = csv.reader(f)
    dataList = list(reader)

with open('UrbGDPLCU-scaled.csv', 'w+') as f:
    writer = csv.writer(f)
    writer.writerow(dataList[0])

    code = 1000
    scale = 0
    entry = []
    for obs in dataList[1:]:
        if obs[3]:
            if obs[4] == code:
                entry  = obs[:3]
                entry.append(float(obs[3]) / math.pow(10, scale))
                entry.append(obs[4])
                entry.append(obs[3])
                writer.writerow(entry)
            else:
                code = obs[4]
                scale = math.floor(math.log10(float(obs[3])))
                entry = obs[:3]
                entry.append(float(obs[3]) / math.pow(10,scale))
                entry.append(obs[4])
                entry.append(obs[3]) # old value for comparison
                writer.writerow(entry)
            entry = []
        else:
            writer.writerow(obs)
    f.close()
