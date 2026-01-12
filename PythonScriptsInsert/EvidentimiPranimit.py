# DorezimiVeturesNgaKlienti
# Replace these with your actual data from the PagesaQerasVetures and Vetura tables
klienti_data = [
    ('DL12345983'), 
    ('DL12345677'), 
    ('DL12345985'), 
    ('DL12345986'), 
    ('DL12345672'), 
    ('DL12345983'), 
    ('DL12345679'), 
    ('DL12345674'), 
    ('DL12345672'),
    ('DL12345985'),
    ('DL12345981'),
    ('DL12345985'),
    ('DL12345987'),
    ('DL12345979'),
    ('DL12345675'),
    ('DL12345985'),
    ('DL12345985'),
    ('DL12345677'),
    ('DL12345986'),
    ('DL12345673'),
    ('DL12345986'),
    ('DL12345679'),
    ('DL12345675'),
    ('DL12345985'),
    ('DL12345982'),
    ('DL12345672'),
    ('DL12345983'),
    ('DL12345675'),
    ('DL12345675'),
    ('DL12345982'),
    ('DL12345981'),
    ('DL12345982'),
    ('DL12345673'),
    ('DL12345677'),
    ('DL12345679'),
    ('DL12345983'),
    ('DL12345983'),
    ('DL12345987'),
    ('DL12345981'),
    ('DL12345679'),
    ('DL12345677'),
    ('DL12345986'),
    ('DL12345985'),
    ('DL12345672'),
    ('DL12345676'),
    ('DL12345979'),
    ('DL12345677'),
    ('DL12345982'),
    ('DL12345984'),
    ('DL12345676'),
    ('DL12345983'),
    ('DL12345982'),
    ('DL12345672'),
    ('DL12345674'),
    ('DL12345987'),
    ('DL12345982'),
    ('DL12345979'),
    ('DL12345979'),
    ('DL12345675'),
    ('DL12345981'),
    ('DL12345986'),
    ('DL12345979'),
    ('DL12345981'),
    ('DL12345986'),
    ('DL12345679'),
    ('DL12345679'),
    ('DL12345986'),
    ('DL12345680'),
    ('DL12345984'),
    ('DL12345680')
]

# Generate the INSERT INTO statements
statements = []
for i, (id_klienti) in enumerate(klienti_data):
    # Select a random row from the Vetura data

    # Generate an INSERT INTO statement

    statement = f"INSERT INTO EvidentimiPranimit (idPranimit,nrPatentSHF) VALUES ({i+1}, '{id_klienti}')"
    statements.append(statement)

# Print the generated statements
print('\n'.join(statements))
