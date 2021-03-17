CREATE TABLE PAYS(
	id varchar(7),
	nompays varchar(15)
);

INSERT INTO pays values('PYS001','Madagascar');
INSERT INTO pays values('PSY002','Canada');
INSERT INTO pays values('PSY003','Bresil');
INSERT INTO pays values('PSY004','Ukraine');



CREATE TABLE VOLS(
	id varchar(7) PRIMARY KEY,
	iddepart varchar(15),
	idarrive varchar(15),
	datedepart date,
	tarif int
);

INSERT INTO vols values('VOL005','PSY001','PSY002',TO_DATE('15/12/2017','DD/MM/YYYY'),2000);
INSERT INTO vols values('VOL002','PSY001','PSY003',TO_DATE('17/12/2017','DD/MM/YYYY'),3000);
INSERT INTO vols values('VOL003','PSY002','PSY004',TO_DATE('14/12/2017','DD/MM/YYYY'),4200);
INSERT INTO vols values('VOL004','PSY003','PSY001',TO_DATE('15/12/2017','DD/MM/YYYY'),4100);
INSERT INTO vols values('VOL005','PSY004','PSY001',TO_DATE('16/12/2017','DD/MM/YYYY'),4000);

CREATE TABLE CATEGORIE(
	id varchar(7) PRIMARY KEY,
	nom varchar(10)
);

INSERT INTO categorie values('CTG001','Economique');
INSERT INTO categorie values('CTG002','Business');
INSERT INTO categorie values('CTG003','VIP');

CREATE TABLE AVION(
	idAvion varchar(7) PRIMARY KEY,
	nomAvion varchar(10),	
	idVol varchar(7),
	Foreign key(idVol)
	references Vols(id)	
);

INSERT INTO avion values('AVN001','BG727','VOL001');
INSERT INTO avion values('AVN002','BG737','VOL002');
INSERT INTO avion values('AVN003','BG747','VOL003');
INSERT INTO avion values('AVN004','BG757','VOL004');
INSERT INTO avion values('AVN005','BG787','VOL005');


CREATE TABLE PLACE(
	nom varchar(2),
	ligne int,
	colonne int ,
	idAvion varchar(7),
	idcat varchar(7),
	libre varchar(1),
	Foreign key(idAvion) 
	references avion(idAvion),
	Foreign key(idcat) 
	references categorie(id)	
);

INSERT INTO place values('A1',1,1,'AVN001','CTG001','y');
INSERT INTO place values('A2',1,2,'AVN001','CTG001','y');
INSERT INTO place values('A3',1,3,'AVN001','CTG001','y');
INSERT INTO place values('A4',1,4,'AVN001','CTG001','y');
INSERT INTO place values('A5',1,5,'AVN001','CTG001','y');
INSERT INTO place values('A6',1,6,'AVN001','CTG001','y');
INSERT INTO place values('A7',1,7,'AVN001','CTG001','y');
INSERT INTO place values('A8',1,8,'AVN001','CTG001','y');
INSERT INTO place values('A9',1,9,'AVN001','CTG001','y');


INSERT INTO place values('B1',2,1,'AVN001','CTG001','y');
INSERT INTO place values('B2',2,2,'AVN001','CTG001','y');
INSERT INTO place values('B3',2,3,'AVN001','CTG001','y');
INSERT INTO place values('B4',2,4,'AVN001','CTG001','y');
INSERT INTO place values('B5',2,5,'AVN001','CTG001','y');
INSERT INTO place values('B6',2,6,'AVN001','CTG001','y');
INSERT INTO place values('B7',2,7,'AVN001','CTG001','y');
INSERT INTO place values('B8',2,8,'AVN001','CTG001','y');
INSERT INTO place values('B9',2,9,'AVN001','CTG001','y');


INSERT INTO place values('C1',1,1,'AVN001','CTG002','y');
INSERT INTO place values('C2',1,2,'AVN001','CTG002','y');
INSERT INTO place values('C3',1,3,'AVN001','CTG002','y');
INSERT INTO place values('C4',1,4,'AVN001','CTG002','y');
INSERT INTO place values('C5',1,5,'AVN001','CTG002','y');
INSERT INTO place values('C6',1,6,'AVN001','CTG002','y');
INSERT INTO place values('C7',1,7,'AVN001','CTG002','y');
INSERT INTO place values('C8',1,8,'AVN001','CTG002','y');
INSERT INTO place values('C9',1,9,'AVN001','CTG002','y');

INSERT INTO place values('D1',2,1,'AVN001','CTG002','y');
INSERT INTO place values('D2',2,2,'AVN001','CTG002','y');
INSERT INTO place values('D3',2,3,'AVN001','CTG002','y');
INSERT INTO place values('D4',2,4,'AVN001','CTG002','y');
INSERT INTO place values('D5',2,5,'AVN001','CTG002','y');
INSERT INTO place values('D6',2,6,'AVN001','CTG002','y');
INSERT INTO place values('D7',2,7,'AVN001','CTG002','y');
INSERT INTO place values('D8',2,8,'AVN001','CTG002','y');
INSERT INTO place values('D9',2,9,'AVN001','CTG002','y');

INSERT INTO place values('E1',1,1,'AVN001','CTG003','y');
INSERT INTO place values('E2',1,2,'AVN001','CTG003','y');
INSERT INTO place values('E3',1,3,'AVN001','CTG003','y');
INSERT INTO place values('E4',1,4,'AVN001','CTG003','y');
INSERT INTO place values('E5',1,5,'AVN001','CTG003','y');
INSERT INTO place values('E6',1,6,'AVN001','CTG003','y');
INSERT INTO place values('E7',1,7,'AVN001','CTG003','y');
INSERT INTO place values('E8',1,8,'AVN001','CTG003','y');
INSERT INTO place values('E9',1,9,'AVN001','CTG003','y');
-------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO place values('A1',1,1,'AVN002','CTG001','y');
INSERT INTO place values('A2',1,2,'AVN002','CTG001','y');
INSERT INTO place values('A3',1,3,'AVN002','CTG001','y');
INSERT INTO place values('A4',1,4,'AVN002','CTG001','y');
INSERT INTO place values('A5',1,5,'AVN002','CTG001','y');
INSERT INTO place values('A6',1,6,'AVN002','CTG001','y');
INSERT INTO place values('A7',1,7,'AVN002','CTG001','y');
INSERT INTO place values('A8',1,8,'AVN002','CTG001','y');
INSERT INTO place values('A9',1,9,'AVN002','CTG001','y');


INSERT INTO place values('B1',2,1,'AVN002','CTG001','y');
INSERT INTO place values('B2',2,2,'AVN002','CTG001','y');
INSERT INTO place values('B3',2,3,'AVN002','CTG001','y');
INSERT INTO place values('B4',2,4,'AVN002','CTG001','y');
INSERT INTO place values('B5',2,5,'AVN002','CTG001','y');
INSERT INTO place values('B6',2,6,'AVN002','CTG001','y');
INSERT INTO place values('B7',2,7,'AVN002','CTG001','y');
INSERT INTO place values('B8',2,8,'AVN002','CTG001','y');
INSERT INTO place values('B9',2,9,'AVN002','CTG001','y');


INSERT INTO place values('D1',2,1,'AVN002','CTG002','y');
INSERT INTO place values('D2',2,2,'AVN002','CTG002','y');
INSERT INTO place values('D3',2,3,'AVN002','CTG002','y');
INSERT INTO place values('D4',2,4,'AVN002','CTG002','y');
INSERT INTO place values('D5',2,5,'AVN002','CTG002','y');
INSERT INTO place values('D6',2,6,'AVN002','CTG002','y');
INSERT INTO place values('D7',2,7,'AVN002','CTG002','y');
INSERT INTO place values('D8',2,8,'AVN002','CTG002','y');
INSERT INTO place values('D9',2,9,'AVN002','CTG002','y');

INSERT INTO place values('E1',1,1,'AVN002','CTG003','y');
INSERT INTO place values('E2',1,2,'AVN002','CTG003','y');
INSERT INTO place values('E3',1,3,'AVN002','CTG003','y');
INSERT INTO place values('E4',1,4,'AVN002','CTG003','y');
INSERT INTO place values('E5',1,5,'AVN002','CTG003','y');
INSERT INTO place values('E6',1,6,'AVN002','CTG003','y');
INSERT INTO place values('E7',1,7,'AVN002','CTG003','y');
INSERT INTO place values('E8',1,8,'AVN002','CTG003','y');
INSERT INTO place values('E9',1,9,'AVN002','CTG003','y');
-------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO place values('A1',1,1,'AVN003','CTG001','y');
INSERT INTO place values('A2',1,2,'AVN003','CTG001','y');
INSERT INTO place values('A3',1,3,'AVN003','CTG001','y');
INSERT INTO place values('A4',1,4,'AVN003','CTG001','y');
INSERT INTO place values('A5',1,5,'AVN003','CTG001','y');
INSERT INTO place values('A6',1,6,'AVN003','CTG001','y');
INSERT INTO place values('A7',1,7,'AVN003','CTG001','y');
INSERT INTO place values('A8',1,8,'AVN003','CTG001','y');
INSERT INTO place values('A9',1,9,'AVN003','CTG001','y');


INSERT INTO place values('B1',2,1,'AVN003','CTG001','y');
INSERT INTO place values('B2',2,2,'AVN003','CTG001','y');
INSERT INTO place values('B3',2,3,'AVN003','CTG001','y');
INSERT INTO place values('B4',2,4,'AVN003','CTG001','y');
INSERT INTO place values('B5',2,5,'AVN003','CTG001','y');
INSERT INTO place values('B6',2,6,'AVN003','CTG001','y');
INSERT INTO place values('B7',2,7,'AVN003','CTG001','y');
INSERT INTO place values('B8',2,8,'AVN003','CTG001','y');
INSERT INTO place values('B9',2,9,'AVN003','CTG001','y');

INSERT INTO place values('B1',3,1,'AVN003','CTG001','y');
INSERT INTO place values('B2',3,2,'AVN003','CTG001','y');
INSERT INTO place values('B3',3,3,'AVN003','CTG001','y');
INSERT INTO place values('B4',3,4,'AVN003','CTG001','y');
INSERT INTO place values('B5',3,5,'AVN003','CTG001','y');
INSERT INTO place values('B6',3,6,'AVN003','CTG001','y');
INSERT INTO place values('B7',3,7,'AVN003','CTG001','y');
INSERT INTO place values('B8',3,8,'AVN003','CTG001','y');
INSERT INTO place values('B9',3,9,'AVN003','CTG001','y');

INSERT INTO place values('C1',1,1,'AVN003','CTG002','y');
INSERT INTO place values('C2',1,2,'AVN003','CTG002','y');
INSERT INTO place values('C3',1,3,'AVN003','CTG002','y');
INSERT INTO place values('C4',1,4,'AVN003','CTG002','y');
INSERT INTO place values('C5',1,5,'AVN003','CTG002','y');
INSERT INTO place values('C6',1,6,'AVN003','CTG002','y');
INSERT INTO place values('C7',1,7,'AVN003','CTG002','y');
INSERT INTO place values('C8',1,8,'AVN003','CTG002','y');
INSERT INTO place values('C9',1,9,'AVN003','CTG002','y');

-------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO place values('A1',1,1,'AVN004','CTG001','y');
INSERT INTO place values('A2',1,2,'AVN004','CTG001','y');
INSERT INTO place values('A3',1,3,'AVN004','CTG001','y');
INSERT INTO place values('A4',1,4,'AVN004','CTG001','y');
INSERT INTO place values('A5',1,5,'AVN004','CTG001','y');
INSERT INTO place values('A6',1,6,'AVN004','CTG001','y');
INSERT INTO place values('A7',1,7,'AVN004','CTG001','y');
INSERT INTO place values('A8',1,8,'AVN004','CTG001','y');
INSERT INTO place values('A9',1,9,'AVN004','CTG001','y');


INSERT INTO place values('C1',1,1,'AVN004','CTG002','y');
INSERT INTO place values('C2',1,2,'AVN004','CTG002','y');
INSERT INTO place values('C3',1,3,'AVN004','CTG002','y');
INSERT INTO place values('C4',1,4,'AVN004','CTG002','y');
INSERT INTO place values('C5',1,5,'AVN004','CTG002','y');
INSERT INTO place values('C6',1,6,'AVN004','CTG002','y');
INSERT INTO place values('C7',1,7,'AVN004','CTG002','y');
INSERT INTO place values('C8',1,8,'AVN004','CTG002','y');
INSERT INTO place values('C9',1,9,'AVN004','CTG002','y');

INSERT INTO place values('D1',2,1,'AVN004','CTG002','y');
INSERT INTO place values('D2',2,2,'AVN004','CTG002','y');
INSERT INTO place values('D3',2,3,'AVN004','CTG002','y');
INSERT INTO place values('D4',2,4,'AVN004','CTG002','y');
INSERT INTO place values('D5',2,5,'AVN004','CTG002','y');
INSERT INTO place values('D6',2,6,'AVN004','CTG002','y');
INSERT INTO place values('D7',2,7,'AVN004','CTG002','y');
INSERT INTO place values('D8',2,8,'AVN004','CTG002','y');
INSERT INTO place values('D9',2,9,'AVN004','CTG002','y');

INSERT INTO place values('E1',1,1,'AVN004','CTG003','y');
INSERT INTO place values('E2',1,2,'AVN004','CTG003','y');
INSERT INTO place values('E3',1,3,'AVN004','CTG003','y');
INSERT INTO place values('E4',1,4,'AVN004','CTG003','y');
INSERT INTO place values('E5',1,5,'AVN004','CTG003','y');
INSERT INTO place values('E6',1,6,'AVN004','CTG003','y');
INSERT INTO place values('E7',1,7,'AVN004','CTG003','y');
INSERT INTO place values('E8',1,8,'AVN004','CTG003','y');
INSERT INTO place values('E9',1,9,'AVN004','CTG003','y');
-------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO place values('A1',1,1,'AVN005','CTG001','y');
INSERT INTO place values('A2',1,2,'AVN005','CTG001','y');
INSERT INTO place values('A3',1,3,'AVN005','CTG001','y');
INSERT INTO place values('A4',1,4,'AVN005','CTG001','y');
INSERT INTO place values('A5',1,5,'AVN005','CTG001','y');
INSERT INTO place values('A6',1,6,'AVN005','CTG001','y');
INSERT INTO place values('A7',1,7,'AVN005','CTG001','y');
INSERT INTO place values('A8',1,8,'AVN005','CTG001','y');
INSERT INTO place values('A9',1,9,'AVN005','CTG001','y');


INSERT INTO place values('B1',2,1,'AVN005','CTG001','y');
INSERT INTO place values('B2',2,2,'AVN005','CTG001','y');
INSERT INTO place values('B3',2,3,'AVN005','CTG001','y');
INSERT INTO place values('B4',2,4,'AVN005','CTG001','y');
INSERT INTO place values('B5',2,5,'AVN005','CTG001','y');
INSERT INTO place values('B6',2,6,'AVN005','CTG001','y');
INSERT INTO place values('B7',2,7,'AVN005','CTG001','y');
INSERT INTO place values('B8',2,8,'AVN005','CTG001','y');
INSERT INTO place values('B9',2,9,'AVN005','CTG001','y');

INSERT INTO place values('B1',3,1,'AVN005','CTG001','y');
INSERT INTO place values('B2',3,2,'AVN005','CTG001','y');
INSERT INTO place values('B3',3,3,'AVN005','CTG001','y');
INSERT INTO place values('B4',3,4,'AVN005','CTG001','y');
INSERT INTO place values('B5',3,5,'AVN005','CTG001','y');
INSERT INTO place values('B6',3,6,'AVN005','CTG001','y');
INSERT INTO place values('B7',3,7,'AVN005','CTG001','y');
INSERT INTO place values('B8',3,8,'AVN005','CTG001','y');
INSERT INTO place values('B9',3,9,'AVN005','CTG001','y');

INSERT INTO place values('C1',1,1,'AVN005','CTG002','y');
INSERT INTO place values('C2',1,2,'AVN005','CTG002','y');
INSERT INTO place values('C3',1,3,'AVN005','CTG002','y');
INSERT INTO place values('C4',1,4,'AVN005','CTG002','y');
INSERT INTO place values('C5',1,5,'AVN005','CTG002','y');
INSERT INTO place values('C6',1,6,'AVN005','CTG002','y');
INSERT INTO place values('C7',1,7,'AVN005','CTG002','y');
INSERT INTO place values('C8',1,8,'AVN005','CTG002','y');
INSERT INTO place values('C9',1,9,'AVN005','CTG002','y');

INSERT INTO place values('D1',2,1,'AVN005','CTG002','y');
INSERT INTO place values('D2',2,2,'AVN005','CTG002','y');
INSERT INTO place values('D3',2,3,'AVN005','CTG002','y');
INSERT INTO place values('D4',2,4,'AVN005','CTG002','y');
INSERT INTO place values('D5',2,5,'AVN005','CTG002','y');
INSERT INTO place values('D6',2,6,'AVN005','CTG002','y');
INSERT INTO place values('D7',2,7,'AVN005','CTG002','y');
INSERT INTO place values('D8',2,8,'AVN005','CTG002','y');
INSERT INTO place values('D9',2,9,'AVN005','CTG002','y');

INSERT INTO place values('E1',3,1,'AVN005','CTG002','y');
INSERT INTO place values('E2',3,2,'AVN005','CTG002','y');
INSERT INTO place values('E3',3,3,'AVN005','CTG002','y');
INSERT INTO place values('E4',3,4,'AVN005','CTG002','y');
INSERT INTO place values('E5',3,5,'AVN005','CTG002','y');
INSERT INTO place values('E6',3,6,'AVN005','CTG002','y');
INSERT INTO place values('E7',3,7,'AVN005','CTG002','y');
INSERT INTO place values('E8',3,8,'AVN005','CTG002','y');
INSERT INTO place values('E9',3,9,'AVN005','CTG002','y');
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TABLES(
	id varchar(7),
	NOM varchar(15)
);

INSERT INTO tables values('01','Test01');
INSERT INTO tables values('02','Test02');
INSERT INTO tables values('03','Test03');
INSERT INTO tables values('04','Test04');
INSERT INTO tables values('05','Test05');