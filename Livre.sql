CREATE TABLE Emprunt(
    Personne varchar(7),
    Livre varchar(7),
    DateEmprunt timestamp,
    Dateretourprevue timestamp,
    dateretoureffective timestamp,
    primary key(Personne,Livre,DateEmprunt)
);

CREATE TABLE Retard(
    Personne varchar(7),
    Livre varchar(7),
    DateEmprunt timestamp,
    PenaliteRetard int,
    foreign key(Personne,Livre,DateEmprunt) references Emprunt(Personne,Livre,DateEmprunt)
);

INSERT INTO Emprunt values('PRS003','LVR001',timestamp'2018-01-02 09:00:00',timestamp'2018-01-04 09:00:00',timestamp'2018-01-04 09:00:00');
INSERT INTO Emprunt values('PRS002','LVR001',timestamp'2018-01-03 09:00:00',timestamp'2018-01-05 09:00:00',timestamp'2018-01-05 09:00:00');
INSERT INTO Emprunt values('PRS002','LVR003',timestamp'2018-01-04 09:00:00',timestamp'2018-01-06 09:00:00',timestamp'2018-01-07 09:00:00');
INSERT INTO Emprunt values('PRS002','LVR002',timestamp'2018-01-05 09:00:00',timestamp'2018-01-07 09:00:00',timestamp'2018-01-08 09:00:00');
INSERT INTO Emprunt values('PRS001','LVR003',timestamp'2018-01-06 09:00:00',timestamp'2018-01-08 09:00:00',timestamp'2018-01-09 09:00:00');

INSERT INTO Retard values('PRS002','LVR003',timestamp'2018-01-04 09:00:00',3200);
INSERT INTO Retard values('PRS002','LVR002',timestamp'2018-01-05 09:00:00',400);
INSERT INTO Retard values('PRS001','LVR003',timestamp'2018-01-06 09:00:00',3300);

1//select personne from emprunt where livre='LVR001';


2//Select personne from emprunt where personne not in (select personne from retard);
2//Select personne from emprunt minus (select personne from retard);

3//SELECT t.Personne FROM Emprunt t WHERE NOT EXISTS ( SELECT * FROM Emprunt u WHERE NOT EXISTS ( SELECT * FROM Emprunt v WHERE v.Personne=t.Personne AND v.Livre=u.Livre )); 



5//SELECT t.Personne FROM Emprunt t WHERE NOT EXISTS (SELECT * FROM Emprunt u WHERE u.Personne=t.Personne AND NOT EXISTS (SELECT * FROM Retard v WHERE v.Personne=u.Personne AND v.Livre=u.Livre ) );