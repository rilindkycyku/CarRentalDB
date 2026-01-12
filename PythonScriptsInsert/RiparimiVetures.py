import random
import datetime

# DorezimiVeturesNgaKlienti
# Replace these with your actual data from the PagesaQerasVetures and Vetura tables
DorezimiVeturesNgaKlienti = [
    (1, 1, '01/14/2021'), 
    (2, 20,'06/09/2022'), 
    (3, 21,'06/12/2022'), 
    (4, 25,'06/23/2022'), 
    (5, 26,'06/26/2022'), 
    (6, 31,'07/17/2022'), 
    (7, 34,'08/05/2022'), 
    (8, 42,'08/26/2022'), 
    (9, 44,'09/15/2022'), 
    (10, 45, '09/18/2022'), 
    (11, 48, '09/29/2022'), 
    (12, 49, '10/10/2022'), 
    (13, 50, '10/10/2022'), 
    (14, 52, '10/16/2022'), 
    (15, 55, '10/28/2022'), 
    (16, 58, '11/01/2022'), 
    (17, 59, '11/08/2022'), 
    (18, 62, '01/05/2023'),
    (19, 63, '01/05/2023'), 
    (20, 65, '01/08/2023'), 
    (21, 67, '01/21/2023'), 
    (22, 68, '01/28/2023') 
]

RaportetEgzaminuseLista = [
    'The battery in the car was changed.',
    'The oil level in the car was filled and the oil filter was cleaned.',
    'The spare tire in the car was replaced.',
    'The front and rear of the car were repaired, the frame straightened, and the airbags replaced.',
    'The tire pressure on the car was adjusted and the tires replaced.',
    'The fuel pump in the car was replaced.',
    'The brakes on the car were repaired, the brake fluid replaced, and the pads replaced.',
    'The brakes on the car were repaired, the brake pads replaced, and the brake lines flushed.',
    'The air conditioning system in the car was repaired.',
    'The transmission fluid in the car was drained and refilled with fresh fluid.',
    'The fuel pump in the car was replaced.',
    'The tire pressure on the car was adjusted and the tires replaced.',
    'The battery in the car was changed.',
    'The battery in the car was changed.',
    'The front and rear of the car were repaired, the frame straightened, and the airbags replaced.',
    'The battery in the car was changed.',
    'The radiator in the car was repaired or replaced.',
    'The transmission fluid in the car was drained and refilled with fresh fluid.',
    'The battery in the car was changed.',
    'The transmission fluid in the car was drained and refilled with fresh fluid.',
    'The radiator in the car was repaired or replaced.',
    'The spare tire in the car was replaced.'
]

# Generate the INSERT INTO statements
statements = []
for i, (idPagesa, nrRaportit, dataPageses) in enumerate(DorezimiVeturesNgaKlienti):
    # Select a random row from the Vetura data

    # Generate dataMbarReg
    ditetNeServis = random.randint(3,7)
    dataRiparimit = (datetime.datetime.strptime(dataPageses, "%m/%d/%Y") + datetime.timedelta(days=ditetNeServis)).strftime("%m/%d/%Y")

    raportiEgzaminimit = RaportetEgzaminuseLista[i]

    # Generate an INSERT INTO statement


    statement = f"INSERT INTO RiparimiVetures (nrRiparimit, idPagesa, nrRaportit, dataRiparimit, pershkrimiRiparimit) VALUES ({i+1}, {idPagesa}, {nrRaportit}, '{dataRiparimit}','{raportiEgzaminimit}')"
    statements.append(statement)

# Print the generated statements
print('\n'.join(statements))

