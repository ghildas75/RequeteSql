
/*==============================================================*/
/* Table: CLIENT  insertion de 10 client                                               */
/*==============================================================*/
Insert into CLIENT VALUES 
(1,"TREMBLAY","patrik","514-230-1123",25),
(2,"benoit","sylvie","450-232-1235",29),
(3,"jean","paul","819-320-4151",35),
(4,"brad","jack","418-230-9214",28),
(5,"alfred","sonia","581-320-9569",20),
(6,"sand","marie","514-701-2351",16),
(7,"mousse","sefax","438-234-1249",18),
(8,"reeal","celine","514-270-5234",22),
(9,"spring","melissa","438-910-5412",23),
(10,"cat","florence","514-430-1244",15),
(17,"gravel","clement","705-430-1244",19);

select * from client;

/*==============================================================*/
/* Table: Acteur    insertion  de 10 acteur                                           */
/*==============================================================*/
insert into ACTEUR VALUES
(1,"brad","julio"),
(2,"kevin","julie"),
(3,"rad","sonia"),
(5,"seb","rayan"),
(6,"hod","kylian"),
(7,"eden","adonis"),
(8,"sad","massi"),
(9,"chad","dia"),
(10,"noel","johons"),
 (11,"gaell","maurice");

 select * from acteur;
 /*==============================================================*/
/* Table: CATEGORIE                                             */
/*==============================================================*/
 Insert into  categorie values 
(1,"drame"),
(2,"comedie"),
(3,"action"),
(4,"suspense"),
(5,"horreur"),
(6,"international"),
(7,"enfant"),
(8,"adulte"),
(9,"spectacle"),
(10,"biographie"),
(11,"serie");

select *from categorie;
/*==============================================================*/
/* Table: Classfication film                                             */
/*==============================================================*/
insert into classefilm values
(001,"general"),
(002,"13 ans e plus"),
(003,"16"),
(004,"18 ans et plus");
  
  select * from classefilm;
/*==============================================================*/
/* Table: DISTRIBUTEUR                                          */
/*==============================================================*/
insert into  DISTRIBUTEUR  values 
(1,"BEST GAME PROD"),
(2,"PROJEUX"),
(3,"MODERN JEUX"),
(4, "CINEMA ATLAS"),
(5, "LES PLUS BEAUX FILM"),
(6,"QUEBEC CULTURE");


select * from distributeur;
/*==============================================================*/
/* Table: FORMATFILM                                            */
/*==============================================================*/
insert into formatfilm values 
(20,"DVD"),
(30,"BLUE-RAY");

select * from formatfilm;
/*==============================================================*/
/* Table: FORMATJEUX                                          */
/*==============================================================*/
insert into formatjeux values 
(100,"PS3"),
(200,"WII"),
(300,"XBOX"),
(400,"PC");

select * from formatjeux;
/*==============================================================*/
/* Table: LANGUE                                                */
/*==============================================================*/
INSERT INTO LANGUE VALUES
(50,"FANCAIS"),
(60,"ANGLAIS"),
(70, "ESPAGNOL");

select * from langue;
/*==============================================================*/
/* Table: NOUVEAU REGULIER   PRIX                                         */
/*==============================================================*/
INSERT INTO NOUVEAUREGULIER VALUES 
(1,3.99),
(2,5.99);
select * from NOUVEAUREGULIER;
/*==============================================================*/
/* Table: JEUX                                              */
/*==============================================================*/
insert into jeux values
(11,"sokodo",100,1,1),
(12,"fifa",300,2,2),
(16,"soccer",400,2,3),
(18,"skate",300,1,1),
(22,"mot cache",200,2,3),
(42,"mot fliche",100,2,2),
(52,"game over",300,1,1),
(65,"race ",200,2,2),
(70,"speed car",400,1,2),
(14,"tennis",100,2,1);

SELECT * FROM JEUX;
/*==============================================================*/
/* Table: PRODUCTEUR                                             */
/*==============================================================*/
INSERT INTO  PRODUCTEUR VALUES 
(80,"NET FLEIX"),
(90,"SKY CINEMA"),
(95,"RADIO CANADA");
SELECT * from  PRODUCTEUR;
/*==============================================================*/
/* Table: FILM INSERTION DES DONNEES                            */
 /*==============================================================*/
insert into film values (1,"MEMOIRE PERDUE",95,6,20,50,001,1,1);
insert into film values(2,"titanic",95,6,30,50,001,1,2);
insert into film values(3,"game of throne",90,4,30,60,002,11,2);
insert into film values(4,"arme fatal",80,4,20,60,003,3,2);
insert into film values(5,"film coeur",90,6,30,50,004,8,1);
insert into film values(6,"bataille alger",95,5,20,50,003,6,1);
insert into film values(7,"sex in the city",90,4,20,60,003,8,2);
insert into film values(8,"amour brutal",80,5,20,50,004,8,2);
insert into film values(9,"tom et olive",95,6,20,50,001,7,1);
insert into film values (10,"ILES PERDU",80,4,30,60,002,5,2);
insert into film values(11,"LES EVADES",90,5,20,50,003,1,1);

select * from film;
/*==============================================================*/
/* Table: SERIE                                          */
/*==============================================================*/
insert into serie values
(1,"ILES PERDU",3,1,10),
(2,"GAME OF THRONE",1,5,3),
(3,"prison break",1,6,null);

select * from serie;
//*==============================================================*/
/*==                                                                             */
/* Table: EXEMPLAIRE  ============================================================*/
/*==============================================================*/
   

INSERT INTO EXEMPLAIRE VALUES (100,8,1,NULL,"2016-01-01","2016-03-01","2016-03-25",25,25);
INSERT INTO EXEMPLAIRE VALUES (200,NULL,2,11,"2016-03-01","2016-03-10","2016-04-01",50,70);
INSERT INTO EXEMPLAIRE VALUES(300,8,17,11,"2016-01-01","2016-03-01","2016-03-25", 25,50);
INSERT INTO EXEMPLAIRE VALUES(400,4,5,null,"2016-01-01","2016-03-01","2016-03-26",70,100);
INSERT INTO EXEMPLAIRE VALUES(500,8,6,11,"2016-01-01","2016-02-01","2016-03-25", 15,30);
INSERT INTO EXEMPLAIRE VALUES(600,null,5,22,"2015-01-01","2016-03-01","2016-03-25",10,15);
INSERT INTO EXEMPLAIRE VALUES(700,5,1,null,"2016-01-01","2016-03-01","2016-03-25", 25,25);
INSERT INTO EXEMPLAIRE VALUES (800,8,7,null,"2016-01-01","2016-03-01","2016-03-25",25,20);
INSERT INTO EXEMPLAIRE VALUES(900,8,17,null,"2016-01-01","2016-03-01","2016-03-25",25,20);
INSERT INTO EXEMPLAIRE VALUES(1000,null,5,11,"2016-01-01","2016-03-01","2016-03-25", 25,20);
INSERT INTO EXEMPLAIRE VALUES(1100,7,17,null,"2016-01-01","2016-03-01","2016-03-25", 25,20);
 
 update exemplaire set idfilm="1" where id=100;


/*==============================================================*/
/* Table: LOCATION                                         */
/*==============================================================*//
insert into location values(20,100,1,"2016-03-30",null,"2016-04-01",0,3.99);
insert into location values(21,200,2,"2016-03-30",null,"2016-04-04",2.5,3.99);
insert into location values(22,300,17,"2016-03-10",null,"2016-03-13",0,5.99);
insert into location values(23,400,6,"2016-03-19","2016-03-30","2016-03-30",0,5.99);
insert into location values(24,500,6,"2016-03-30",null,"2016-04-02",0,3.99);
insert into location values(25,600,5,"2016-04-01",null,"2016-04-03",0,5.99);
insert into location values(26,700,1,"2016-03-15",null,"2016-03-20",2.0,3.99);
insert into location values(27,800,7,"2016-03-03",null,"2016-03-04",0,3.99);
insert into location values (28,900,17,"2016-03-15",null,"2016-03-19",1.5,5.99);
insert into location values(29,1000,5,"2016-03-17",null,"2016-03-19",0,3.99);
insert into location values(30,1100,17,"2016-04-01",null,"2016-04-02",0,5.99);



update location set retard=2.5 where id=700;
/*==============================================================*/
select * from exemplaire;
/*============================================================*/
/* Table:  INSERTION DES DONNESFACTURE                               */
/*==============================================================*/
INSERT INTO FACTURE VALUES 
(10000,100,"2016-04-05"), 
(10001,200,"2016-04-05"),
(10002,300,"2016-04-05"),
(10003,400,"2016-04-05"),
(10004,500,"2016-04-05"),
(10005,600,"2016-04-05"),
(0006,700,"2016-04-05"),
(10007,800,"2016-04-05"),
(10008,900,"2016-04-05"),
(10009,1000,"2016-04-05"),
(100010,1100,"2016-04-05");

