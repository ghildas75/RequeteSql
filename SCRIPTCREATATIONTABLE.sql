/*==============================================================*/
/* SCRIPT BASE DE DONNEES LOCATION ET VENTE DE FILM ET JEUX                         */
/*==============================================================*/
CREATE DATABASE LOCATIONVENTE;
USE LOCATIONVENTE;


/*==============================================================*/
/* Table: ACTEUR                                                */
/*==============================================================*/
create table ACTEUR 
(
   IDACTEUR             int                            not null,
   NOM                  varchar(30)                    not null,
   PRENOM               varchar(30)                            ,
   constraint PK_ACTEUR primary key (IDACTEUR)
);

/*==============================================================*/
/* Table: CATEGORIE                                             */
/*==============================================================*/
create table CATEGORIE 
(
   IDCATF               int                            not null,
   DESCRITPTION         varchar(50)                    not null,
   constraint PK_CATEGORIE primary key (IDCATF)
);

/*==============================================================*/
/* Table: CLASSEFILM                                            */
/*==============================================================*/
create table CLASSEFILM 
(
   IDCLASSF             int                             not null,
   CONSOLE              varchar(30)                     not null,
   constraint PK_CLASSEFILM primary key (IDCLASSF)
);

/*==============================================================*/
/* Table: CLIENT                                                */
/*==============================================================*/
create table CLIENT 
(
   NUMCLI               int                            not null,
   NOM                  varchar(30)                    not null,
   PRENOM               varchar(30)                           ,
   TEL                  char(14)                           not null,
   AGE                  int                                    ,
   constraint PK_CLIENT primary key (NUMCLI)
);

/*==============================================================*/
/* Table: DISTRIBUTEUR                                          */
/*==============================================================*/
create table DISTRIBUTEUR 
(
   IDDSITRUB              int                            not null,
   NOMDISTRUB           varchar (50)                         not null,
   constraint PK_DISTRIBUTEUR primary key (IDDSITRUB)
);

/*==============================================================*/
/* Table: EXEMPLAIRE                                            */
/*==============================================================*/
create table EXEMPLAIRE 
(
   ID                   int                            not null,
   IDFILM               Int                            ,
   NUMCLI               int                            ,
   IDJEUX               int                            ,
   DATE_SORTIE          date                           not null,
   DATE_ACHAT           date                           not null,
   DATEDEVENTE          date                            ,
   PRIXVENTE           decimal(5,2)                 check(PRIXVENTE>0),
   PRIXACHAT           decimal(5.2)                check(PRIXACHAT>0),
   constraint PK_EXEMPLAIRE primary key (ID)
);

/*==============================================================*/
/* Table: FACTURE                                               */
/*==============================================================*/
create table FACTURE 
(
   NUMEROFACT           int                            not null,
   ID                   int                                    ,
   DATEFACTURE          date                           not null,
   
   constraint CHK_DATEFACTURE check(DATEFACTURE>CURDATE()),
   constraint PK_FACTURE primary key (NUMEROFACT)
);

/*==============================================================*/
/* Table: FILM                                                  */
/*==============================================================*/
create table FILM 
(
   IDFILM               Int                            not null,
   TITRE                varchar(50)                    not null,
   IDPROD               int                            ,
   IDDSITRUB            int                            ,
   IDFO                 int                            ,
   IDLANGUE             int                            ,
   IDCLASSF             int                            ,
   IDCATF               int                            ,
   CODEPRIX             int                            ,
  
   constraint PK_FILM primary key (IDFILM)
);

/*==============================================================*/
/* Table: FORMATJEUX                                                */
/*==============================================================*/
create table FORMATJEUX
(
   NFORMAT              int                            not null,
   CONSOLE             char(5)                         not null,
   
   constraint CHK_CONSOLE CHECK(CONSOLE IN ("PS3","XBOX","WII","PC")),
   constraint PK_FORMATJEUX primary key (NFORMAT)
);

/*==============================================================*/
/* Table: FORMATFILM                                            */
/*==============================================================*/
create table FORMATFILM 
(
   IDFO                 int                            not null,
   SUPPORT              char(10)                    not null,
    constraint CHK_SUPPORT CHECK(SUPPORT IN ('DVD','BLUE-RAY')),
   constraint PK_FORMATFILM primary key (IDFO)
);

/*==============================================================*/
/* Table:LOCATION                                  */
/*==============================================================*/
create table LOCATION 
(
   NUMEROLOCATION       int                            not null,
   ID                   int                            ,
   NUMCLI               int                            not null,
   DLOCATION            date                           not null,
   DLIMITE              date                           ,
   DRETOUR              date                           not null,
   RETARD               decimal(5,2)                  not null,
   PRIX_CHARGE          decimal(5,2)                   ,
   constraint PK_LOCATION primary key (NUMEROLOCATION),
   constraint CK_DLOCATION check (dlocation<dretour)
);

/*==============================================================*/
/* Table: JEUX                                                  */
/*==============================================================*/
create table JEUX 
(
   IDJEUX               int                            not null,
   NOM                  varchar(30)                    not null,
   NFORMAT              int                            ,
   CODEPRIX             int                            ,
   IDDSITRUB            int                            ,
  
   constraint PK_JEUX primary key (IDJEUX)
);

/*==============================================================*/
/* Table: LANGUE                                                */
/*==============================================================*/
create table LANGUE 
(
   IDLANGUE             int                       not null,
   NOM                  varchar(30)                    ,
   constraint PK_LANGUE primary key (IDLANGUE)
);

/*==============================================================*/
/* Table: NOUV_REGULIER                                         */
/*==============================================================*/
create table NOUVEAUREGULIER 
(
   CODEPRIX             int                            not null,
   PRIXCHARGE           decimal(5,2)                   not null,
   constraint PK_NOUVREGULIER primary key (CODEPRIX)
);

/*==============================================================*/
/* Table: PRODUCTEUR                                            */
/*==============================================================*/
create table PRODUCTEUR 
(
   IDPROD               integer                        not null,
   NOM                  varchar(30)                    not null,
   constraint PK_PRODUCTEUR primary key (IDPROD)
);

/*==============================================================*/
/* Table: ROLE                                                  */
/*==============================================================*/
create table ROLE 
(
   IDACTEUR             Int                            not null,
   IDFILM               Int                            ,
   PERSONNAGE           varchar(50)                    ,
   constraint PK_ROLE primary key (IDACTEUR, IDFILM)
);

/*==============================================================*/
/* Table: SERIE                                                 */
/*==============================================================*/
create table SERIE 
(
   IDSERIE              int                           not null,
   NOMSERIE             varchar(50)                    not null,
   IDFILM               Int                            ,
   SAISON               int                             not null,
   EPISODE              int                        ,
   constraint PK_SERIE primary key (IDSERIE)
);

/*==============================================================*/
/*CONTRAINTE SUR LA TABLE EXEMMPLAIRE          */
/*==============================================================*/

alter table EXEMPLAIRE
   add constraint FK_EXEMPLAIRE_CLIENT foreign key (NUMCLI)
      references CLIENT (NUMCLI);
      
alter table EXEMPLAIRE
   add constraint FK_EXEMPLAIRE_JEUX foreign key (IDJEUX)
      references JEUX (IDJEUX);
      
alter table EXEMPLAIRE
   add constraint FK_EXEMPLAIRE_FILM foreign key (IDFILM)
      references FILM (IDFILM);
      
/*==============================================================*/
/*CONTRAINTE SUR LA TABLE FACTURE         */
/*==============================================================*/
alter table FACTURE
   add constraint FK_FACTURE_EXEMPLAIRE foreign key (ID)
      references EXEMPLAIRE (ID);
      
/*==============================================================*/
/*CONTRAINTE SUR LA TABLE FILM         */
/*==============================================================*/
alter table FILM
   add constraint FK_FILM_NOUVREGULIER foreign key (CODEPRIX)
      references NOUVEAUREGULIER (CODEPRIX);
      
alter table FILM
   add constraint FK_FILM_FORMATFILM foreign key (IDFO)
      references FORMATFILM (IDFO);
      
alter table FILM
   add constraint FK_FILM_CATEGORIE foreign key (IDCATF)
      references CATEGORIE (IDCATF);
      
alter table FILM
   add constraint FK_FILM_CLASSIFILM foreign key (IDCLASSF)
      references CLASSEFILM (IDCLASSF);
      
alter table FILM
   add constraint FK_FILM_DISTRIBUER foreign key (IDDSITRUB)
      references DISTRIBUTEUR (IDDSITRUB);
      
alter table FILM
   add constraint FK_FILM_LANGUE foreign key (IDLANGUE)
      references LANGUE (IDLANGUE);
      
alter table FILM
   add constraint FK_FILM_PRODUCTEUR foreign key (IDPROD)
      references PRODUCTEUR (IDPROD);
    /*==============================================================*/
/*CONTRAINTE SUR LA TABLE LOCATION         */
/*==============================================================*/  

alter table LOCATION
   add constraint FK_LOCATION_CLIENT foreign key (NUMCLI)
      references CLIENT (NUMCLI);
      
alter table LOCATION
   add constraint FK_LOCATION_EXEMPLAIRE foreign key (ID)
      references EXEMPLAIRE (ID);
      
 /*==============================================================*/
/*CONTRAINTE SUR LA TABLE JEUX        */
/*==============================================================*/  
alter table JEUX
   add constraint FK_JEUX_NOUVEAUREGULIER foreign key (CODEPRIX)
      references NOUVEAUREGULIER (CODEPRIX);
      

alter table JEUX
   add constraint FK_JEUX_DISTRIBUTEUR foreign key (IDDSITRUB)
      references DISTRIBUTEUR (IDDSITRUB);
      

alter table JEUX
   add constraint FK_JEUX_FORMATJEUX foreign key (NFORMAT)
      references FORMATJEUX (NFORMAT);
	  
   /*==============================================================*/
/*CONTRAINTE SUR LA TABLE ROLE        */
/*==============================================================*/     

alter table ROLE
   add constraint FK_ROLE_FILM foreign key (IDFILM)
      references FILM (IDFILM);
      

alter table ROLE
   add constraint FK_ROLE_ACTEUR foreign key (IDACTEUR)
      references ACTEUR (IDACTEUR);
      
/*==============================================================*/
/*CONTRAINTE SUR LA TABLE SERIE        */
/*==============================================================*/  
alter table SERIE
   add constraint FK_SERIE_FILM foreign key (IDFILM)
      references FILM (IDFILM);
      

