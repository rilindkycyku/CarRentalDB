import random
import datetime

kodiMarkes = "VW"
idReg = 54
tabelatEVet = ""
dataFillReg = ""
dataMbarReg = ""
emriKompanisReg = ""
kaKartonGjelb = ""

for idVetura in range(1, 7):
    # Generate tabelatEVet
    firstTwoNumbers = str(random.randint(1, 8)).zfill(2)
    nextThreeNumbers = str(random.randint(100, 1000)).zfill(3)
    lastTwoLetters = random.choice([chr(i) for i in range(65, 91) if chr(i) != "W"]) + random.choice([chr(i) for i in range(65, 91) if chr(i) != "W"])
    tabelatEVet = firstTwoNumbers + "-" + nextThreeNumbers + "-" + lastTwoLetters

    # Generate dataFillReg
    year = random.randint(2021, 2022)
    month = random.randint(1, 12)
    day = random.randint(1, 28)
    dataFillReg = datetime.date(year, month, day).strftime("%m/%d/%Y")

    # Generate dataMbarReg
    numDays = 364
    dataMbarReg = (datetime.datetime.strptime(dataFillReg, "%m/%d/%Y") + datetime.timedelta(days=numDays)).strftime("%m/%d/%Y")

    # Generate emriKompanisReg
    emriKompanisReg = random.choice(["Sigal", "Scardian", "Dukagjini", "ELSIG", "SIGKOS", "EuroSig"])

    # Generate kaKartonGjelb
    kaKartonGjelb = random.choice(["Po", "Jo"])

    # Generate and print INSERT query
    query = f"INSERT INTO RegjistrimiVet(kodiMarkes, idVetura, idReg, tabelatEVet, dataFillReg, dataMbarReg, emriKompanisReg, kaKartonGjelb) VALUES ('{kodiMarkes}', {idVetura}, {idReg}, '{tabelatEVet}', '{dataFillReg}', '{dataMbarReg}', '{emriKompanisReg}', '{kaKartonGjelb}')"
    print(query)

    idReg += 1
