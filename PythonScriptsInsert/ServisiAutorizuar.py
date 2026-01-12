

# DorezimiVeturesNgaKlienti
# Replace these with your actual data from the PagesaQerasVetures and Vetura tables
DorezimiVeturesNgaKlienti = [
    (1, 'TOYOTA', 2,'D012', 2),
    (2, 'KIA', 3,'D002', 2)	 ,
    (3, 'VW', 2, 'D006', 2)	 ,
    (4, 'TOYOTA', 6, 'D012', 2) ,
    (5, 'AUDI', 3, 'D010', 1)	 ,
    (6, 'HONDA', 2,'D002', 2)	 ,
    (7, 'TOYOTA', 2,'D012', 2) ,
    (8, 'AUDI', 3,'D010', 1)	 ,
    (9, 'FORD', 1, 'D001', 2)	 ,
    (10, 'MAZDA', 1, 'D001', 2) ,
    (11, 'NISSAN', 3, 'D007', 2),
    (12, 'MAZDA', 2, 'D002', 2) ,
    (13, 'BMW', 2, 'D011', 1)	 ,
    (14, 'MINI', 3, 'D012', 2)	 ,
    (15, 'BMW', 3,'D010', 1)	 ,
    (16, 'HONDA', 2,'D002', 2) ,
    (17, 'FORD', 2,'D002', 2)	 ,
    (18, 'MINI', 5,'D013', 2)	 ,
    (19, 'FORD', 2,'D002', 2)	 ,
    (20, 'TOYOTA', 5, 'D009', 2),
    (21, 'MINI', 3, 'D012', 2)	 ,
    (22, 'BENZ', 2, 'D001', 2)	 ,
    (23, 'TOYOTA', 6, 'D012', 2),
    (24, 'MINI', 5,'D013', 2)	 ,
    (25, 'JAGUAR', 1, 'D006', 2),
    (26, 'BMW', 2, 'D011', 1)	 ,
    (27, 'MINI', 2,'D002', 2)	 ,
    (28, 'BMW', 2, 'D011', 1)	 ,
    (29, 'TOYOTA', 6, 'D012', 2),
    (30, 'TOYOTA', 6, 'D012', 2),
    (31, 'JAGUAR', 2, 'D007', 2),
    (32, 'BENZ', 2, 'D001', 2)	 ,
    (33, 'FORD', 3,'D001', 2)	 ,
    (34, 'MAZDA', 2, 'D002', 2) ,
    (35, 'VW', 1,'D006', 2)	 ,
    (36, 'NISSAN', 3, 'D007', 2),
    (37, 'FORD', 2,'D002', 2)	 ,
    (38, 'NISSAN', 2, 'D006', 2),
    (39, 'JAGUAR', 3, 'D008', 2),
    (40, 'MINI', 5,'D013', 2)	 ,
    (41, 'VW', 2, 'D006', 2)	 ,
    (42, 'FORD', 2,'D002', 2)	 ,
    (43, 'VW', 5, 'D004', 2)	 ,
    (44, 'FORD', 3,'D001', 2)	 ,
    (45, 'VW', 4, 'D005', 2)	 ,
    (46, 'LEXUS', 2, 'D012', 2) ,
    (47, 'LEXUS', 2, 'D012', 2) ,
    (48, 'BMW', 3,'D010', 1)	 ,
    (49, 'MINI', 4, 'D003', 2)	 ,
    (50, 'FORD', 3,'D001', 2)	 ,
    (51, 'HONDA', 1,'D002', 2) ,
    (52, 'NISSAN', 1, 'D005', 2),
    (53, 'HONDA', 1,'D002', 2) ,
    (54, 'VW', 4, 'D005', 2)	 ,
    (55, 'LEXUS', 1, 'D013', 2),
    (56, 'HYUNDAI', 1, 'D004', 2),
    (57, 'FORD', 2,'D002', 2)	  ,
    (58, 'FORD', 2,'D002', 2)	  ,
    (59, 'MAZDA', 2, 'D002', 2)  ,
    (60, 'TOYOTA', 3, 'D003', 2) ,
    (61, 'VW', 1,'D006', 2) ,
    (62, 'MINI', 2,'D002', 2),
    (63, 'MAZDA', 1, 'D001', 2),
    (64, 'MINI', 5,'D013', 2),
    (65, 'FORD', 3,'D001', 2),
    (66, 'TOYOTA', 1,'D003', 2),
    (67, 'HONDA', 1,'D002', 2),
    (68, 'LEXUS', 3,'D013', 2),
    (69, 'MINI', 5,'D013', 2),
    (70, 'KIA', 2,'D012', 2)
]

# Generate the INSERT INTO statements
statements = []
for i,(nrDorezimit, kodiMarkes, idVetura, idDega, idStafi) in enumerate(DorezimiVeturesNgaKlienti):

    # Generate an INSERT INTO statement
    statement = f"INSERT INTO ServisiAutorizuar (nrEgzaminimit,nrDorezimit,kodiMarkes,idVetura,idDega,idStafi) VALUES ({i+1},{nrDorezimit},'{kodiMarkes}',{idVetura},'{idDega}',{idStafi})"
    statements.append(statement)

# Print the generated statements
print('\n'.join(statements))

