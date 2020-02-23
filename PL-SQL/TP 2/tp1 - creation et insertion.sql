select * from tr_nov;
INSERT INTO tr_nov VALUES(
6,
2,
3,
4);

INSERT INTO trajet VALUES(
6,
'RABAT',
'KENITRA',
'10/12/2019',
80);

INSERT INTO v_ch VALUES(
4,
4,
2530);

INSERT INTO voiture VALUES(
4,
'NISSAN',
100,
4);

CREATE TABLE tr_nov(
        notraj INTEGER NOT NULL,
        nov INTEGER NOT NULL,
        nch INTEGER NOT NULL,
        nbperstr INTEGER,
        FOREIGN KEY (nov) REFERENCES voiture(Nov),
        FOREIGN KEY (notraj) REFERENCES trajet(notraj),
        FOREIGN KEY (nch) REFERENCES ch(nch)
);

 CREATE TABLE reparation(
    norep INTEGER PRIMARY KEY NOT NULL,
    nov INTEGER REFERENCES voiture(nov),
    nog INTEGER,
    typerep VARCHAR(30),
    px INTEGER,
    kmcpt INTEGER
);

CREATE TABLE Trajet(
        notraj INTEGER PRIMARY KEY NOT NULL,
        villearr VARCHAR(20),
        Villedep VARCHAR(20),
        datetrajet DATE,
        nbkm INTEGER
        );

CREATE TABLE ch(
    nch INTEGER PRIMARY KEY NOT NULL,
    chauffeur VARCHAR(30)
);

CREATE TABLE v_ch(
    nov INTEGER REFERENCES voiture(nov),
    nch INTEGER REFERENCES ch(nch),
    nkm INTEGER,
    PRIMARY KEY (nov, nch)
);