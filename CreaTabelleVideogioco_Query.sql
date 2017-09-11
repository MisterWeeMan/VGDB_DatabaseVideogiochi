/* creo tabelle per database videogioco */

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Videogioco;
DROP TABLE IF EXISTS Publisher;
DROP TABLE IF EXISTS Developer;
DROP TABLE IF EXISTS Direttore;
DROP TABLE IF EXISTS Votazione;
DROP TABLE IF EXISTS Utente;
DROP TABLE IF EXISTS Console;
DROP TABLE IF EXISTS PiattaformaDigitale;
DROP TABLE IF EXISTS FunzionaCon;
DROP TABLE IF EXISTS FunzionaPiattDig;


-- Crea la tabella dei Direttori & la riempie

CREATE TABLE Direttore (
      Id      INT                 PRIMARY KEY,
      Nome    VARCHAR(20)         NOT NULL,
      Cognome VARCHAR(20)         NOT NULL
);

INSERT INTO Direttore (Id, Nome, Cognome) 
VALUES (1,'Guillume','De Fondaumiere'),
       (2,'Guillemot','Yves'),
	   (3,'Todd','Howard'),
       (4,'Yoshimi','Yasuda'),
	   (5,'Jenova','Chen'),
	   (6,'Sam','Houser'),
	   (7,'Gabe','Newell'),
	   (8,'Kevin','Bruner'),
	   (9,'Tatsumi','Kimishima'),
	   (10,'Kenzo','Tsujimoto'),
	   (11,'David','Gardner'),
	   (12,'Alex','Garden'),
	   (13,'Matt','Webster'),
	   (14,'Hiroshi','Matsuyama'),
	   (15,'David','Adams'),
	   (16,'Bruce','Straleyy'),
	   (17,'Michael','Morhaime'),
	   (18,'Masayoshi','Tanimura'),
	   (19,'Satoshi','Oshita'),
	   (20,'Casey','Hudson'),
	   (21,'Christina', 'Hernandez'),
	   (22,'Fred', 'Dixon'),
	   (23,'Jean', 'Reid'),
	   (24,'Wayne', 'Murphy'),
	   (25,'Alan', 'Cruz'),
	   (26,'Norma', 'Hicks'),
	   (27,'Kevin', 'Harrison'),
	   (28,'Nicole', 'Day'),
	   (29,'Harold', 'Fernandez'),
	   (30,'Edward', 'Banks'),
	   (31,'Thomas', 'Tucker'),
	   (32,'Steven', 'Robinson'),
	   (33,'Kelly', 'Nichols'),
	   (34,'Larry', 'Perry'),
	   (35,'Raymond', 'Phillips'),
	   (36,'Dennis', 'Andrews'),
	   (37,'Ryan','Harold');


-- Crea la tabella dei Publisher & la riempie
	
CREATE TABLE Publisher(
     Nome                 VARCHAR(20) PRIMARY KEY,
     SedePrincipale       VARCHAR(20) NOT NULL,
     AnnoFondazione       DATE,
     Attivo               BOOLEAN
);

INSERT INTO Publisher (Nome, SedePrincipale, AnnoFondazione, Attivo) 
VALUES ('3DO', 'Redwood City', '1991-04-25', 0),
       ('Atari', 'Lione', '1972-06-27', 0),
	   ('Bandai Namco', 'Tokyo', '1955-06-01', 1),
	   ('Blizzard ENT', 'Irvine', '1991-02-08', 1),
	   ('EA', 'California', '1982-06-28', 1),
	   ('Nintendo', 'Kyoto', '1889-09-23', 1),
	   ('SEGA', 'Tokyo', '1960-06-03', 1),
	   ('Sony', 'Tokyo', '1993-11-16', 1),
	   ('Telltale', 'California', '2004-06-13', 1),
	   ('THQ', 'California', '1991-05-09', 0),
	   ('Ubisoft', 'Rennes', '1986-03-01', 1),
	   ('Activision','Santa Monica','1979-10-01', 1);

	   
-- Crea la tabella dei Developer & la riempie
	
CREATE TABLE Developer(
     Nome                  VARCHAR(20) PRIMARY KEY,
     SedePrincipale        VARCHAR(20) NOT NULL,
     CodDirettore          INT,
     AnnoFondazione        DATE DEFAULT NULL,
     Attivo                BOOLEAN,
     FOREIGN KEY (CodDirettore)  REFERENCES  Direttore(Id)
);

INSERT INTO Developer (Nome, SedePrincipale, CodDirettore, AnnoFondazione, Attivo) 
VALUES ('Atari', 'Lione', 11, '1972-06-27', 0),
       ('Bandai Namco', 'Tokyo', 19, '1955-06-01', 1),
       ('Bethesda', 'Maryland', 3, '2002-01-01', 1),
       ('Bioware', 'Edmonton', 20, '1995-02-01', 1),
       ('Blizzard ENT', 'Irvine', 17, '1991-02-08', 1),
       ('Capcom', 'Osaka', 10, '1979-05-30', 1),
       ('Criterion', 'Guildford', 13, '1993-01-01', 1),
       ('CyberConnect2', 'Fukuoka', 14, '1996-02-16', 1),
       ('From Software', 'Tokyo', 4, '1986-11-01', 1),
       ('Hal Laboratory', 'Tokyo', 18, '1980-02-24', 1),
       ('Naughty Dog', 'Santa Monica', 16, '1989-09-09', 1),
       ('Nintendo', 'Kyoto', 9, '1889-09-23', 1),
       ('Quantic Dream', 'Paris', 1, '1997-03-05', 1),
       ('Relic ENT', 'Vancouver', 12, '1997-05-01', 1),
       ('Rockstar Games', 'New York', 6, '1998-12-01', 1),
       ('Telltale', 'California', 8, '2004-06-13', 1),
       ('Thatgamecompany', 'Los Angeles', 5, '2006-05-15', 1),
       ('Ubisoft', 'Rennes', 2, '1986-03-01', 1),
       ('Valve', 'Washington', 7, '1996-08-24', 1),
       ('Vigil Games', 'Texas', 15, '2013-01-23', 0),
	   ('Bungie Studios','Washington', 37, '1991-05-01', 1);


-- Crea la tabella dei Videogiochi & la riempie
	
CREATE TABLE Videogioco(
      Id                         INT PRIMARY KEY,
      Titolo                     VARCHAR(20) NOT NULL,
      Genere                     VARCHAR(20),
      N_DLC	                     INT DEFAULT 0,
      Multiplayer                BOOLEAN NOT NULL,
      NomePublisher              VARCHAR(20),
      NomeDeveloper              VARCHAR(20),
      CodDirettore               INT,
      VotoCritica                INT DEFAULT 0,
      VotoMedioUtenti            INT DEFAULT 0,
      FOREIGN KEY (NomePublisher) REFERENCES Publisher(Nome),
      FOREIGN KEY (CodDirettore)  REFERENCES Direttore(Id),
      FOREIGN KEY (NomeDeveloper) REFERENCES Developer(Nome)
);

INSERT INTO Videogioco (Id, Titolo, Genere, N_DLC, Multiplayer, NomePublisher, NomeDeveloper, CodDirettore, VotoCritica) 
VALUES (1,'Mass Effect', 'Action', 1, 0, 'EA', 'Bioware', 20, 89),
       (11,'Burnout Paradise', 'Racing', 2, 1, 'EA', 'Criterion', 21, 87),
	   (21,'Warhammer 40000', 'Tactical', 4, 1, 'THQ', 'Relic ENT', 22, 85),
	   (31,'Darksiders 2', 'Hack & slash', 2, 0, 'THQ', 'Vigil Games', 23, 75),
	   (41,'Company of Heroes 2', 'FPS', 3, 1, 'SEGA', 'Relic ENT', 24, 84),
	   (51,'Walking Dead', 'Adventure', 5, 0, 'Telltale', 'Telltale', 25, 92),
	   (61,'Bloodborne', 'Action', 1, 1, 'Sony', 'From Software', 26, 92),
	   (71,'The last of Us', 'Adventure', 1, 1, 'Sony', 'Naughty Dog', 27, 95),
	   (81,'Overwatch', 'FPS', 0, 1, 'Blizzard ENT', 'Blizzard ENT', 28, 92),
	   (91,'Zelda', 'Adventure', 0, 0, 'Nintendo', 'Nintendo', 29, 95),
	   (101,'Super Smash Bros', 'Fighting', 10, 1, 'Nintendo', 'Hal Laboratory', 30, 92),
	   (111,'Dark Souls 3', 'Action', 0, 1, 'Bandai Namco', 'From Software', 31, 89),
	   (121,'Naruto UNS3', 'Fighting', 0, 0, 'Bandai Namco', 'Cybercoonnect2', 32, 73),
	   (131,'Tekken 5', 'Arcade', 0, 1, 'Bandai Namco', 'Bandai Namco', 33, 88),
	   (141,'Rayman 2', 'Adventure', 0, 0, 'Ubisoft', 'Ubisoft', 34, 90),
	   (151,'Pacman', 'Action', 0, 0, 'Atari', 'Atari', 35, 71),
	   (161,'Skate or Die', 'Skateboarding', 0, 0, 'EA', 'Atari', 36, 50),
	   (171,'Destiny', 'FPS', 3, 1, 'Activision', 'Bungie Studios', 37, 85);
	

-- Crea la tabella degli Utenti & la riempie

CREATE TABLE Utente(
      Email                VARCHAR(20) PRIMARY KEY,
      NickName             VARCHAR(20) NOT NULL,
      Password             VARCHAR(20) NOT NULL,
      Nome                 VARCHAR(20) NOT NULL,
      Cognome              VARCHAR(20) NOT NULL,
      DataNascita          DATE
);

DROP TRIGGER IF EXISTS check_Utenti;

DELIMITER |

CREATE TRIGGER check_Utenti
BEFORE INSERT ON utente
FOR EACH ROW
BEGIN
  		DECLARE Num INT;
		DECLARE Find INT;
        
		SELECT COUNT(*) INTO Num
		FROM utente;
 		
       	SELECT COUNT(*) INTO Find 
        FROM utente 
        WHERE NickName = NEW.NickName;
    
IF(Num >= 500 OR Find = 1)
    THEN INSERT INTO utente SELECT * FROM utente LIMIT 1;
END IF;
  
END|

DELIMITER ;

INSERT INTO Utente (Email, Nickname, Password, Nome, Cognome, DataNascita) 
VALUES ('agilbertm@princeton.', 'agilbertm', 'CN0fIx5Dw', 'Angela', 'Gilbert', '1996-01-04'),
       ('amorris1@earthlink.n', 'amorris1', 'Z3dpyHz8V', 'Andrew', 'Morris', '1993-07-16'),
	   ('apattersonx@fda.gov', 'apattersonx', 'Zb2I3woCI2', 'Alice', 'Patterson', '1995-07-28'),
	   ('bbarnes4@virginia.ed', 'bbarnes4', 'vBzG9us4V', 'Barbara', 'Barnes', '1996-10-17'),
	   ('bmarshallu@uol.com.b', 'bmarshallu', 'QWqWvXKH2Uw', 'Bruce', 'Marshall', '1985-08-31'),
	   ('bmorrisonz@marriott.', 'bmorrisonz', 'Ufn9IQ44Pk', 'Barbara', 'Morrison', '1985-09-09'),
	   ('cford2@bloglines.com', 'cford2', 'XI5a6j17v', 'Carlos', 'Ford', '1985-12-11'),
	   ('cmccoyo@indiatimes.c', 'cmccoyo', '13nJpxcff', 'Carl', 'Mccoy', '1992-09-23'),
	   ('cstewart5@constantco', 'cstewart5', 'Qt4hMObOf5', 'Carol', 'Stewart', '1995-05-30'),
	   ('dbrooksy@youtube.com', 'dbrooksy', '7uuEA2ne2', 'Donald', 'Brooks', '1994-12-02'),
	   ('dramirez3@arizona.ed', 'dramirez3', 'HKvn26Mcq3', 'Doris', 'Ramirez', '1999-01-19'),
	   ('drileye@topsy.com', 'drileye', '4TylFU6xR', 'Diana', 'Riley', '1999-01-06'),
	   ('dwoodsv@joomla.org', 'dwoodsv', 'jVrMoI7NW5Im', 'Donald', 'Woods', '1991-09-10'),
	   ('ehuntp@nyu.edu', 'ehuntp', 'JT7jPSBpnSH', 'Eric', 'Hunt', '1993-11-10'),
	   ('fdavisn@nbcnews.com', 'fdavisn', 'vh8A6Q0m8', 'Fred', 'Davis', '1995-04-11'),
	   ('flawson9@myspace.com', 'flawson9', 'nhLGO7YRtyI', 'Fred', 'Lawson', '1997-01-05'),
	   ('fsimsb@bbc.co.uk', 'fsimsb', 'Zt5uPC2n5e32', 'Fred', 'Sims', '1986-12-19'),
	   ('gweavert@istockphoto', 'gweavert', 'n2b0q9ycW', 'Gloria', 'Weaver', '1988-04-09'),
	   ('iparkera@indiatimes.', 'iparkera', 'QjDYbhPm44', 'Irene', 'Parker', '1987-11-18'),
	   ('jcampbell10@house.go', 'jcampbell10', 'r5SA0Q2Y', 'Janet', 'Campbell', '1986-12-25'),
	   ('jgibsonc@tuttocitta.', 'jgibsonc', 'fT7d9omynKpI', 'Juan', 'Gibson', '1988-12-23'),
	   ('jhenryi@seesaa.net', 'jhenryi', 'WJ3hRaEj', 'Julie', 'Henry', '1999-09-24'),
	   ('jperezj@skype.com', 'jperezj', 'sTLoco5voZA', 'Jimmy', 'Perez', '1998-09-03'),
	   ('jreynoldsl@cyberchim', 'jreynoldsl', 'nLpUpmqv66em', 'Janet', 'Reynolds', '1998-02-12'),
	   ('kweaverg@dot.gov', 'kweaverg', 'Mg9ZxAoZV', 'Katherine', 'Weaver', '2000-10-25'),
	   ('kweavers@pagesperso-', 'kweavers', 'EiSjLTR5hvDP', 'Kevin', 'Weaver', '1988-09-06'),
	   ('lcunninghamk@tinypic', 'lcunninghamk', '3eyXB4cF', 'Lawrence', 'Cunningham', '1993-02-10'),
	   ('lfosterw@weebly.com', 'lfosterw', 'wH0LimT8M', 'Lisa', 'Foster', '1990-01-09'),
	   ('loliver13@webmd.com', 'loliver13', 'KXhm6RbBQrwF', 'Louise', 'Oliver', '1988-10-11'),
	   ('lromero15@ox.ac.uk', 'lromero15', 'nR6YkSzApVi0', 'Lawrence', 'Romero', '1999-01-12'),
	   ('mcarrollr@symantec.c', 'mcarrollr', 'Sbl1M0KKEa', 'Martin', 'Carroll', '1992-05-08'),
	   ('mhunt12@gravatar.com', 'mhunt12', 'VmF4ANfv0U', 'Martin', 'Hunt', '1999-09-06'),
	   ('rhicks11@example.com', 'rhicks11', 'WQB5uKeX', 'Rose', 'Hicks', '1992-05-22'),
	   ('rryanh@usa.gov', 'rryanh', 'Ngy1hujx', 'Robert', 'Ryan', '1997-09-28'),
	   ('scookd@washington.ed', 'scookd', 'tyj8KDVyJM', 'Sarah', 'Cook', '2000-09-04'),
	   ('shenry7@businessweek', 'shenry7', 'ObTC98fes', 'Sara', 'Henry', '1997-09-14'),
	   ('smartinez14@mozilla.', 'smartinez14', 'KAgrI9jz', 'Sharon', 'Martinez', '1992-02-08'),
	   ('staylor16@squidoo.co', 'staylor16', 'Kp68wBELR', 'Steven', 'Taylor', '1999-09-26'),
	   ('swagner8@bloglines.c', 'swagner8', '5kIaVK0E7vQ', 'Samuel', 'Wagner', '1991-08-10'),
	   ('tortizf@shinystat.co', 'tortizf', 'QLiOk1Cg3', 'Thomas', 'Ortiz', '1987-05-25'),
	   ('wreynolds0@weibo.com', 'wreynolds0', 'CzS21wrgY', 'Walter', 'Reynolds', '1992-12-02'),
	   ('wrobertson6@g.co', 'wrobertson6', '70ys1RdzzEx', 'Wayne', 'Robertson', '1999-02-13'),
	   ('wromeroq@wikia.com', 'wromeroq', 'bMSN5lLg3', 'Wayne', 'Romero', '1994-05-23');


-- Crea la tabella con i voti, crea il trigger per aggiornare i voti
-- & la riempie

CREATE TABLE Votazione(
      MailUtente                 VARCHAR(20),
      IdGioco                    INT,
      Voto                       INT DEFAULT 0,
      PRIMARY KEY (MailUtente, IdGioco),
      FOREIGN KEY (MailUtente) REFERENCES Utente(Email) ON DELETE CASCADE,
      FOREIGN KEY (IdGioco) REFERENCES Videogioco(Id) ON DELETE CASCADE
);

DROP TRIGGER IF EXISTS update_voto_medio;

DELIMITER |
 
CREATE TRIGGER update_voto_medio
AFTER INSERT ON Votazione
FOR EACH ROW
BEGIN
   	UPDATE Videogioco
  	SET   VotoMedioUtenti = ( SELECT AVG(Voto)
                           	  FROM Votazione
                   	          WHERE Votazione.IdGioco = NEW.IdGioco)
    WHERE Id = NEW.IdGioco;
END |

DELIMITER ;

DROP TRIGGER IF EXISTS restore_voto_medio;

DELIMITER |
 
CREATE TRIGGER restore_voto_medio
AFTER DELETE ON Votazione
FOR EACH ROW
BEGIN
          	UPDATE Videogioco
          	SET   VotoMedioUtenti = ( SELECT AVG ( Voto )
                                      FROM Votazione
                                      WHERE Votazione.IdGioco = old.IdGioco )
            WHERE Id = old.IdGioco;
END |

DELIMITER ;

INSERT INTO Votazione (MailUtente, IdGioco, Voto) 
VALUES ('agilbertm@princeton.', 1, 92),
       ('agilbertm@princeton.', 21, 84),
	   ('agilbertm@princeton.', 31, 77),
	   ('agilbertm@princeton.', 41, 79),
	   ('agilbertm@princeton.', 51, 90),
	   ('agilbertm@princeton.', 61, 89),
	   ('agilbertm@princeton.', 71, 88),
	   ('agilbertm@princeton.', 91, 94),
	   ('agilbertm@princeton.', 121, 70),
	   ('agilbertm@princeton.', 141, 87),
	   ('agilbertm@princeton.', 161, 24),
	   ('amorris1@earthlink.n', 1, 40),
	   ('amorris1@earthlink.n', 21, 81),
	   ('apattersonx@fda.gov', 31, 77),
	   ('apattersonx@fda.gov', 41, 85),
	   ('apattersonx@fda.gov', 51, 89),
	   ('bbarnes4@virginia.ed', 71, 86),
	   ('bbarnes4@virginia.ed', 91, 84),
	   ('cford2@bloglines.com', 1, 87),
	   ('cford2@bloglines.com', 11, 92),
	   ('cford2@bloglines.com', 21, 86),
	   ('cford2@bloglines.com', 31, 70),
	   ('cford2@bloglines.com', 41, 90),
	   ('cford2@bloglines.com', 51, 95),
	   ('cford2@bloglines.com', 61, 98),
	   ('cford2@bloglines.com', 71, 99),
	   ('cford2@bloglines.com', 81, 91),
	   ('cford2@bloglines.com', 91, 96),
	   ('cford2@bloglines.com', 101, 86),
	   ('cford2@bloglines.com', 111, 82),
	   ('cford2@bloglines.com', 121, 69),
	   ('cford2@bloglines.com', 131, 89),
	   ('cford2@bloglines.com', 141, 91),
	   ('cford2@bloglines.com', 151, 65),
	   ('cford2@bloglines.com', 161, 35),
	   ('cmccoyo@indiatimes.c', 1, 93),
	   ('fdavisn@nbcnews.com', 61, 87),
	   ('jcampbell10@house.go', 91, 89),
	   ('jcampbell10@house.go', 101, 90),
	   ('jgibsonc@tuttocitta', 151, 70),
	   ('jgibsonc@tuttocitta', 161, 66),
	   ('jperezj@skype.com', 1, 95),
	   ('jperezj@skype.com', 101, 94),
	   ('jperezj@skype.com', 151, 98),
	   ('jperezj@skype.com', 161, 44),
	   ('jreynoldsl@cyberchim', 21, 92),
	   ('jreynoldsl@cyberchim', 41, 78),
	   ('lfosterw@weebly.com', 1, 92),
	   ('loliver13@webmd.com', 1, 93),
	   ('loliver13@webmd.com', 41, 80),
	   ('loliver13@webmd.com', 71, 95),
	   ('loliver13@webmd.com', 81, 90),
	   ('lromero15@ox.ac.uk', 1, 90),
	   ('lromero15@ox.ac.uk', 31, 75),
	   ('lromero15@ox.ac.uk', 61, 79),
	   ('lromero15@ox.ac.uk', 91, 96),
	   ('mcarrollr@symantec.c', 111, 86),
	   ('mhunt12@gravatar.com', 121, 88),
	   ('mhunt12@gravatar.com', 131, 79),
	   ('mhunt12@gravatar.com', 141, 90),
	   ('rryanh@usa.gov', 1, 89),
	   ('rryanh@usa.gov', 11, 86),
	   ('rryanh@usa.gov', 21, 80),
	   ('rryanh@usa.gov', 61, 86),
	   ('rryanh@usa.gov', 91, 93),
	   ('rryanh@usa.gov', 131, 85),
	   ('rryanh@usa.gov', 161, 62),
	   ('swagner8@bloglines.c', 11, 90),
	   ('swagner8@bloglines.c', 31, 72),
	   ('swagner8@bloglines.c', 91, 85),
	   ('wrobertson6@g.co', 1, 87),
	   ('wrobertson6@g.co', 11, 89),
	   ('wromeroq@wikia.com', 61, 87);


-- Crea la tabella delle Console & la riempie
	
CREATE TABLE Console(
      Nome                 VARCHAR(20) PRIMARY KEY,
      Tipo                 ENUM('Portable', 'Home') NOT NULL,
      AnnoNascita          DATE NOT NULL,
      NomePublisher        VARCHAR(20),
      FOREIGN KEY (NomePublisher) REFERENCES Publisher(Nome)
);

INSERT INTO Console (Nome, Tipo, AnnoNascita, NomePublisher) 
VALUES ('Atari 2600','Home','1977-09-11','Atari'), 
       ('GameCube','Home','2001-09-14','Nintendo'),
       ('Xbox360','Home','2005-11-22','Microsoft'), 
	   ('XboxOne','Home','2013-11-22','Microsoft'),
	   ('PS3','Home','2006-11-11','Sony'),
	   ('PS4','Home','2013-11-15','Sony'),
	   ('PSP','Portable','2004-12-12','Sony'),
	   ('3DS','Portable','2011-02-23','Nintendo'),
	   ('Wii U','Home','2012-11-18','Nintendo');

	   
-- Crea la tabella PC & la riempie
	
CREATE TABLE PiattaformaDigitale(
      Nome                 VARCHAR(20) PRIMARY KEY
);
	  
INSERT INTO PiattaformaDigitale (Nome) 
VALUES ('Steam'),
       ('Origin'),
	   ('BattleNet');


-- Crea la tabella FunzionaCon & la riempie
	
CREATE TABLE FunzionaCon(
      NomeConsole          VARCHAR(20),
      CodGioco             INT,
      AnnoPubblicazione    DATE DEFAULT NULL,
      PRIMARY KEY (NomeConsole, CodGioco),
      FOREIGN KEY (NomeConsole) REFERENCES Console(Nome),
      FOREIGN KEY (CodGioco) REFERENCES Videogioco(Id) ON DELETE CASCADE
);

INSERT INTO FunzionaCon (NomeConsole, CodGioco, AnnoPubblicazione) 
VALUES ('3DS', 51, '2014-12-11'),
       ('3DS', 91, '2015-08-17'),
	   ('3DS', 101, '2015-09-04'),
	   ('Atari 2600', 141, '1980-04-12'),
	   ('Atari 2600', 151, '1979-04-12'),
	   ('Atari 2600', 161, '1980-04-12'),
	   ('GameCube', 91, '2005-02-24'),
	   ('GameCube', 141, '2005-04-12'),
	   ('PS3', 1, '2008-02-08'),
	   ('PS3', 11, '2008-01-03'),
	   ('PS3', 31, '2012-08-14'),
	   ('PS3', 51, '2014-12-11'),
	   ('PS3', 71, '2013-06-14'),
	   ('PS3', 131, '2005-03-11'),
	   ('PS3', 141, '2007-01-12'),
	   ('PS4', 31, '2015-10-30'),
	   ('PS4', 51, '2014-12-11'),
	   ('PS4', 61, '2016-05-17'),
	   ('PS4', 71, '2016-06-01'),
	   ('PS4', 81, '2016-03-24'),
	   ('PS4', 111, '2016-04-12'),
	   ('PS4', 141, '2016-04-12'),
	   ('PSP', 11, '2008-01-03'),
	   ('PSP', 31, '2014-10-30'),
	   ('PSP', 51, '2014-12-11'),
	   ('PSP', 121, '2013-04-12'),
	   ('Wii U', 31, '2013-08-14'),
	   ('Wii U', 51, '2014-12-11'),
	   ('Wii U', 91, '2015-12-02'),
	   ('Wii U', 101, '2015-09-04'),
	   ('Wii U', 141, '2016-04-12'),
	   ('Xbox360', 1, '2007-05-01'),
	   ('Xbox360', 11, '2008-01-03'),
	   ('Xbox360', 31, '2012-08-14'),
	   ('Xbox360', 51, '2014-12-11'),
	   ('Xbox360', 141, '2007-01-12'),
	   ('XboxOne', 31, '2015-10-30'),
	   ('XboxOne', 51, '2014-12-11'),
	   ('XboxOne', 81, '2016-03-24'),
	   ('XboxOne', 111, '2016-04-12'),
	   ('XboxOne', 121, '2016-06-12'),
	   ('Xboxone', 141, '2016-04-12');


-- Crea la tabella FunzionaPiatt & la riempie
	
CREATE TABLE FunzionaPiattDig(
      NomePiattDig            VARCHAR(20),
      CodGioco             INT,
      AnnoPubblicazione    DATE,
      PRIMARY KEY (NomePiattDig, CodGioco),
      FOREIGN KEY (NomePiattDig) REFERENCES PiattaformaDigitale(Nome),
      FOREIGN KEY (CodGioco) REFERENCES Videogioco(Id) ON DELETE CASCADE
);

INSERT INTO FunzionaPiattDig (NomePiattDig, CodGioco, AnnoPubblicazione) 
VALUES ('BattleNet', 81, '2016-03-24'),
       ('BattleNet', 141, '2014-04-12'),
	   ('Orgin', 141, '2014-04-12'),
	   ('Origin', 1, '2008-05-28'),
	   ('Origin', 11, '2009-02-05'),
	   ('Steam', 11, '2009-02-05'),
	   ('Steam', 21, '2009-02-18'),
	   ('Steam', 31, '2012-08-14'),
	   ('Steam', 41, '2013-06-25'),
	   ('Steam', 51, '2014-12-11'),
	   ('Steam', 111, '2016-04-12'),
	   ('Steam', 141, '2014-04-12');
	   
SET FOREIGN_KEY_CHECKS = 1;	


-- Query sotto forma di viste

-- 1°

DROP VIEW IF EXISTS Query1;

CREATE VIEW Query1 AS
SELECT  Cognome, Nome, DataNascita, TIMESTAMPDIFF ( YEAR, DataNascita, CURDATE() ) AS Eta 
FROM    utente 
WHERE   ( TIMESTAMPDIFF ( YEAR, DataNascita, CURDATE())) > 17  AND Email IN
                        ( SELECT V.MailUtente 
                          FROM   votazione V JOIN votazione V2 ON V.MailUtente = V2.MailUtente 
                          WHERE  V.MailUtente = V2.MailUtente AND V.IdGioco <> V2.IdGioco )
ORDER BY Eta;


-- 2°

DROP VIEW IF EXISTS Query2;

CREATE VIEW Query2 AS
SELECT v.Titolo, v.VotoCritica
FROM   videogioco v
WHERE  v.Id NOT IN 
              ( SELECT IdGioco
                FROM votazione );
				

-- 3°

DROP VIEW IF EXISTS ConsoleLastGen;
DROP VIEW IF EXISTS Query3;

CREATE VIEW ConsoleLastGen AS
SELECT Nome
FROM console
WHERE Nome IN ( 'Wii U', 'PS4', 'XboxOne' );

CREATE VIEW Query3 AS
SELECT DISTINCT   VG.Titolo, FC.NomeConsole, FC.AnnoPubblicazione 
FROM              Videogioco VG JOIN funzionacon FC ON VG.Id = FC.CodGioco
WHERE             VG.Id NOT IN 
                     ( SELECT  FP.CodGioco 
                       FROM funzionapiattdig FP ) 
                  AND  FC.NomeConsole IN ( SELECT *
				                           FROM ConsoleLastGen )
                  AND YEAR ( FC.AnnoPubblicazione ) = YEAR ( CURDATE() );

				  
-- 4°

DROP VIEW IF EXISTS Query4;

CREATE VIEW Query4 AS
SELECT  Nome, AnnoFondazione
FROM    publisher 
WHERE   Nome IN 
              ( SELECT Nome
                FROM   developer )
	    AND YEAR ( AnnoFondazione ) < 1990;

		
-- 5°				  

DROP VIEW IF EXISTS Votanti;
DROP VIEW IF EXISTS Query5;

CREATE VIEW Votanti AS
SELECT     v.Titolo, COUNT( v1.MailUtente ) AS N_Vot
FROM       videogioco v JOIN votazione v1 ON ( v.Id = v1.IdGioco )
GROUP BY   v1.IdGioco;
   
CREATE VIEW Query5 AS   
SELECT     v.Titolo, v.VotoMedioUtenti
FROM       Videogioco v JOIN Developer d ON v.NomeDeveloper = d.Nome 
           JOIN Votanti v1 ON v.Titolo = v1.Titolo
WHERE      v.Genere = 'Action' 
		   AND v.Multiplayer = 1 
	       AND v.VotoMedioUtenti > 85 
		   AND v1.N_Vot > 5;


-- 6°

DROP VIEW IF EXISTS Query6;

CREATE VIEW Query6 AS
SELECT   Email, Nickname
FROM     utente 
WHERE    Email NOT IN 
                 ( SELECT DISTINCT  MailUtente
                   FROM             votazione )
UNION			
SELECT DISTINCT   u.Email, u.Nickname
FROM              utente u JOIN votazione v ON u.Email = v.MailUtente
                  JOIN videogioco v1 ON v.IdGioco = v1.Id
		          JOIN funzionacon f ON v1.Id = f.CodGioco
WHERE             f.NomeConsole = 'PS4'
ORDER BY          Nickname;


-- 7°

DROP VIEW IF EXISTS Query7;

CREATE VIEW Query7 AS
SELECT     NomeConsole, COUNT( CodGioco ) AS N_Giochi
FROM       funzionacon
GROUP BY   NomeConsole;





















