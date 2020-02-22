-- creation
create table avion(numav integer primary key not null,
    capacite integer,
    type varchar(30),
    entrepot varchar(30));


 create table pilote(
 matricule integer primary key not null,
 nom varchar(30),
 ville varchar(30),
 age integer,
 salaire integer
 );

 create table vol(
  numvol varchar(30) primary key not null,
  heure_depart timestamp with local time zone,
  heure_arrivee timestamp with local time zone,
  ville_depart varchar(30),
  ville_arrivee varchar(30)
  );
  
-- Insertion
insert into avion values(14, 25, 'A400', 'Garches');
insert into avion values(345, 75, 'B200', 'Lille');

insert into pilote values (1, 'Durant', 'Cannes', 45, 28004);
insert into pilote values (2, 'Dupont', 'Touquet', 25, 11758);

insert into vol values ('AL12', '05/12/2019 08:18:00,00', '05/12/2019 09:12:00,00', 'Paris', 'Lille');
 insert into vol values ('AF8', '05/12/2019 11:20:00,00', '05/12/2019 23:54:00,00', 'Paris', 'Rio');
