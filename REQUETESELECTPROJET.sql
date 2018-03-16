


/*==============================================================*/
/*   QUESTION A: AFFICHER LES CLIENTS QUI ONT DES FRAIS DE RETARD
 LE TITRE DE FILM ET DE JEUX                                   */
/*==============================================================*/
SELECT c.numcli,c.NOM,c.PRENOM,f.TITRE, j.NOM as NomJEUX
FROM exemplaire e inner  JOIN client c ON e.NUMCLI = c.NUMCLI
INNER JOIN location l ON l.NUMCLI = c.NUMCLI
AND l.ID = e.ID left JOIN film f ON e.IDFILM =f.IDFILM
LEFT  JOIN jeux j ON e.IDJEUX = j.IDJEUX
where l.RETARD <>0 ;
 
 
    
+--------+----------+---------+--------------+---------+
| numcli | NOM      | PRENOM  | TITRE        | NomJEUX |
+--------+----------+---------+--------------+---------+
|      2 | benoit   | sylvie  | titanic      | sokodo  |
|      1 | TREMBLAY | patrik  | film coeur   | NULL    |
|     17 | gravel   | clement | amour brutal | NULL    |
+--------+----------+---------+--------------+---------+
3 rows in set (0.00 sec)
3 rows in set (0.00 sec)

 

/*   QUESTION B: AFFICHER LES FILMS QUI SONT DES SERIE*/
/*==============================================================*/
SELECT F.IDFILM,F.TITRE FROM FILM F,SERIE S WHERE S.IDFILM=F.IDFILM GROUP BY F.IDFILM;


+--------+----------------+
| IDFILM | TITRE          |
+--------+----------------+
|      1 | MEMOIRE PERDUE |
|      3 | game of throne |
+--------+----------------+
2 rows in set (0.00 sec)
2 rows in set (0.00 sec)

/*==============================================================*/
/*   QUESTION C: AFFICHER LES CLIENTS QUI ONT LOUE DES FILMS QUI SONT serie/
/*==============================================================*/
 /*update exemplaire set idfilm="1" where id=100;*/
SELECT  c.numcli,c.PRENOM, c.NOM
FROM serie s INNER JOIN film f ON s.IDFILM = f.IDFILM
LEFT  JOIN exemplaire e ON e.IDFILM = f.IDFILM
INNER JOIN location l ON l.ID = e.ID
INNER JOIN client  C ON l.NUMCLI = c.NUMCLI
AND e.NUMCLI = c.NUMCLI group by c.numcli;
+--------+--------+----------+
| numcli | PRENOM | NOM      |
+--------+--------+----------+
|      1 | patrik | TREMBLAY |
+--------+--------+----------+
1 row in set (0.00 sec)
1 row in set (0.00 sec)
/*==============================================================*/
/*   QUESTION D: AFFICHER LES CLIENTS QUI ONT COMMANDE DES FILMS ET DE JEUX
/*==============================================================*/
SELECT C.NUMCLI,c.NOM,c.PRENOM,f.TITRE AS TITREFILM, j.NOM as NomJEUX
FROM exemplaire e inner  JOIN client c ON e.NUMCLI = c.NUMCLI
INNER JOIN location l ON l.NUMCLI = c.NUMCLI
AND l.ID = e.ID left JOIN film f ON e.IDFILM = f.IDFILM
LEFT  JOIN jeux j ON e.IDJEUX = j.IDJEUX ORDER BY C.NOM;

+--------+----------+---------+-----------------+-----------+
| NUMCLI | NOM      | PRENOM  | TITREFILM       | NomJEUX   |
+--------+----------+---------+-----------------+-----------+
|      5 | alfred   | sonia   | NULL            | sokodo    |
|      5 | alfred   | sonia   | NULL            | mot cache |
|      2 | benoit   | sylvie  | titanic         | sokodo    |
|     17 | gravel   | clement | sex in the city | NULL      |
|     17 | gravel   | clement | amour brutal    | sokodo    |
|     17 | gravel   | clement | amour brutal    | NULL      |
|      7 | mousse   | sefax   | amour brutal    | NULL      |
|      6 | sand     | marie   | amour brutal    | sokodo    |
|      1 | TREMBLAY | patrik  | MEMOIRE PERDUE  | NULL      |
|      1 | TREMBLAY | patrik  | film coeur      | NULL      |
+--------+----------+---------+-----------------+-----------+
10 rows in set (0.00 sec)
SELECT C.NUMCLI,c.NOM,c.PRENOM,f.TITRE AS TITREFILM, j.NOM as NomJEUX
FROM exemplaire e inner  JOIN client c ON e.NUMCLI = c.NUMCLI
INNER JOIN location l ON l.NUMCLI = c.NUMCLI
AND l.ID = e.ID left JOIN film f ON e.IDFILM = f.IDFILM
LEFT  JOIN jeux j ON e.IDJEUX = j.IDJEUX  GROUP BY C.NUMCLI ORDER BY C.NOM;
M;
+--------+----------+---------+----------------+-----------+
| NUMCLI | NOM      | PRENOM  | TITREFILM      | NomJEUX   |
+--------+----------+---------+----------------+-----------+
|      5 | alfred   | sonia   | NULL           | mot cache |
|      2 | benoit   | sylvie  | titanic        | sokodo    |
|     17 | gravel   | clement | amour brutal   | sokodo    |
|      7 | mousse   | sefax   | amour brutal   | NULL      |
|      6 | sand     | marie   | amour brutal   | sokodo    |
|      1 | TREMBLAY | patrik  | MEMOIRE PERDUE | NULL      |
+--------+----------+---------+----------------+-----------+
6 rows in set (0.00 sec)


/*==============================================================         */
/*   QUESTION E: AFFICHER TOUS LES FILMS ET LE NOMBRE DE FOIS 
 QUI A ETE EMPRUNTE
/*==============================================================*/
SELECT f.IDfilm, F.TITRE,COUNT(NUMEROLOCATION) AS NbreFoisLoue
FROM exemplaire e INNER JOIN film  f
ON e.IDFILM = f.IDFILM
INNER JOIN location l
ON l.ID = e.ID
GROUP BY f.IDFILM;

+--------+-----------------+--------------+
| IDfilm | TITRE           | NbreFoisLoue |
+--------+-----------------+--------------+
|      1 | MEMOIRE PERDUE  |            1 |
|      2 | titanic         |            1 |
|      4 | arme fatal      |            1 |
|      5 | film coeur      |            1 |
|      7 | sex in the city |            1 |
|      8 | amour brutal    |            4 |
+--------+-----------------+--------------+
6 rows in set (0.00 sec)


/*==============================================================         */
/*   QUESTION f: AFFICHER TOUS LES  JEUX ET LE NOMBRE DE FOIS 
 QUI A ETE EMPRUNTE
/*==============================================================*/
SELECT J.IDJEUX, J.NOM,COUNT(NUMEROLOCATION) AS NbreFoisLoueJeux
FROM exemplaire e INNER JOIN jeux  j
ON e.IDJEUX= J.IDJEUX
INNER JOIN location l
ON l.ID = e.ID
GROUP BY J.IDJEUX;
 
+--------+-----------+------------------+
| IDJEUX | NOM       | NbreFoisLoueJeux |
+--------+-----------+------------------+
|     11 | sokodo    |                4 |
|     22 | mot cache |                1 |
+--------+-----------+------------------+
2 rows in set (0.00 sec)
/*==============================================================  */      
/*   QUESTION g: AFFICHER TOUS LES CLIENT QUI N'ONT PAS EU  DES 
FRAIS  DE RETARD
/*==============================================================*/
SELECT c.NUMCLI,c.NOM,c.prenom
FROM location l,client c
where l.NUMCLI = c.NUMCLI
group by c.numcli 
HAVING SUM(l.RETARD)=0;

+--------+--------+--------+
| NUMCLI | NOM    | prenom |
+--------+--------+--------+
|      5 | alfred | sonia  |
|      6 | sand   | marie  |
|      7 | mousse | sefax  |
+--------+--------+--------+
3 rows in set (0.00 sec)
/*==============================================================  */      
/*   QUESTION H: AFFICHER LE TOTAL DES FRAIS DE RETARD POUR CHAQUE CLIENT
/*==============================================================*/

SELECT c.numcli,c.nom,c.prenom,SUM(RETARD) as TotalFraisRetard from client c, location l 
where c.numcli=l.numcli  group by c.numcli order by c.nom;
+--------+----------+---------+------------------+
| numcli | nom      | prenom  | TotalFraisRetard |
+--------+----------+---------+------------------+
|      5 | alfred   | sonia   |             0.00 |
|      2 | benoit   | sylvie  |             2.50 |
|     17 | gravel   | clement |             1.50 |
|      7 | mousse   | sefax   |             0.00 |
|      6 | sand     | marie   |             0.00 |
|      1 | TREMBLAY | patrik  |             2.50 |
+--------+----------+---------+------------------+
6 rows in set (0.00 sec)
/*pour eviter sont qui n'ont pas eu des frais de retard ajout de clause having*/
SELECT c.numcli,c.nom,c.prenom,SUM(RETARD) as TotalFraisRetard from client c, location l 
where c.numcli=l.numcli group by c.numcli HAVING SUM(l.RETARD)<>0;

+--------+----------+---------+------------------+
| numcli | nom      | prenom  | TotalFraisRetard |
+--------+----------+---------+------------------+
|      1 | TREMBLAY | patrik  |             2.50 |
|      2 | benoit   | sylvie  |             2.50 |
|     17 | gravel   | clement |             1.50 |
+--------+----------+---------+------------------+
3 rows in set (0.00 sec)

/*==============================================================  */      
/* QUESTION i) AFFICHER TOUS les client qui n'ont jamais loue des jeux
/*==============================================================*/
SELECT C.NUMCLI,c.NOM,c.PRENOM
FROM exemplaire e inner JOIN client c ON e.NUMCLI = c.NUMCLI
INNER JOIN location l ON l.NUMCLI = c.NUMCLI
AND l.ID = e.ID LEFT  JOIN jeux j ON e.IDJEUX = j.IDJEUX and isnull(j.IDJEUX)
GROUP BY C.NUMCLI ORDER BY C.NOM;

+--------+----------+---------+
| NUMCLI | NOM      | PRENOM  |
+--------+----------+---------+
|      5 | alfred   | sonia   |
|      2 | benoit   | sylvie  |
|     17 | gravel   | clement |
|      7 | mousse   | sefax   |
|      6 | sand     | marie   |
|      1 | TREMBLAY | patrik  |
+--------+----------+---------+
6 rows in set (0.00 sec)

/*==============================================================  */      
/* QUESTION J) AFFICHER TOUS LES le client ET LE NBRE de jeux LOUE
/*==============================================================*/

SELECT c.NUMCLI,c.NOM,C.PRENOM,COUNT(NUMEROLOCATION) as NombreFoisJeuxLoue 
FROM exemplaire e INNER JOIN jeux j ON e.IDJEUX = j.IDJEUX
INNER JOIN location l ON l.ID = e.ID
INNER JOIN client  c ON l.NUMCLI = c.NUMCLI
AND e.NUMCLI = c.NUMCLI group by c.numcli order by c.nom;
	+--------+--------+---------+--------------------+
+--------+--------+---------+--------------------+
| NUMCLI | NOM    | PRENOM  | NombreFoisJeuxLoue |
+--------+--------+---------+--------------------+
|      5 | alfred | sonia   |                  2 |
|      2 | benoit | sylvie  |                  1 |
|     17 | gravel | clement |                  1 |
|      6 | sand   | marie   |                  1 |
+--------+--------+---------+--------------------+
4 rows in set (0.00 sec)