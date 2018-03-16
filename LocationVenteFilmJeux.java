

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;



public class LocationVenteFilmJeux {
	
	private static final String IDLANGUE = null;
	static Connection cn=null;
	static Statement st;
	static ResultSet res;
	
	
	public static void main(String[] args) {
	
	
		//Menu D'AFFICHAGE 
		
	 String     MENU="1)LOCATION DE FILM.\n\n";
		        MENU+="2)LOCATION DE JEUX.\n\n";
		        MENU+="3)VENTE FILM ET JEUX.\n\n";
		        MENU+="4)CLIENTS QUI ONT DES FRAIS DE REATARD.\n\n";
		        MENU+="5)LES FILMS QUI SONT DES SERIES.\n\n";
		        MENU+="6)CLIENTS QUI ONT LOUES DES SERIES.\n\n";
		        MENU+="7)CLEINTS LISTE FILMS ETJEUX LOUES.\n\n";
		        MENU+="8)FILMS ETNOMBRE FOIS LOUES.\n\n";
		        MENU+="9) JEUX ET NOMBRE FOIS LOUES.\n\n";
		        MENU+="10)CLIENTS SANS FRAIS DE FRAIS RETARD.\n\n";
		        MENU+="11)TOTAL DES FRAIS RETARD.\n\n";
		        MENU+="12)CLIENTS QUI N'ONT PAS LOUES DE JEUX.\n\n";
		        MENU+="13)CLIENTS ET LE NOMBRE DE JEUX LOUES.\n\n";
		        MENU+="14)SORTIR DU PROGRAMME.";
		        int choix;
		       
		      choix=Integer.parseInt(JOptionPane.showInputDialog(MENU)) ;
		 do    {
		switch  (choix){
		case 1:
			AjouterFilm();
			choix=Integer.parseInt(JOptionPane.showInputDialog(MENU)) ;
			//AjouterFilm(37,"input",90,5,20,50,003,1,2);
			///AjouterFilm(25,"Amour fatal",90,5,20,50,003,1,2)	
			break;
		case 2:
			AjouterJeux();
			//AjouterJEUX(45,"boba",100,2,3);
			//AjouterJEUX(47,"boba",100,2,3);
			choix=Integer.parseInt(JOptionPane.showInputDialog(MENU)) ;
			
		case 3:
			
			AjouterExemplaire();
			choix=Integer.parseInt(JOptionPane.showInputDialog(MENU)) ;
			     
			break;
		
		case 4 :
			Affichage4();
			choix=Integer.parseInt(JOptionPane.showInputDialog(MENU)) ;
           break;

		case 5 :
			Affichage5();
			choix=Integer.parseInt(JOptionPane.showInputDialog(MENU)) ;
			break;
		case 6:
			Affichage6();
			choix=Integer.parseInt(JOptionPane.showInputDialog(MENU)) ;
			break;
		case 7 :
			Affichage7();
			choix=Integer.parseInt(JOptionPane.showInputDialog(MENU)) ;
			break;
		case 8 :
			Affichage8();
			choix=Integer.parseInt(JOptionPane.showInputDialog(MENU)) ;
			break;
		case 9:
			Affichage9();
			choix=Integer.parseInt(JOptionPane.showInputDialog(MENU)) ;
			break;
		case 10 :
			Affichage10();
			choix=Integer.parseInt(JOptionPane.showInputDialog(MENU)) ;
			break;
		case 11 :
			Affichage11();
			choix=Integer.parseInt(JOptionPane.showInputDialog(MENU)) ;
			break;
	
		    case 12 :
			 Affichage12();
			 choix=Integer.parseInt(JOptionPane.showInputDialog(MENU)) ;
		           break;
		    case 13:
			 Affichage13();
			 choix=Integer.parseInt(JOptionPane.showInputDialog(MENU)) ;
			break;
		case 14: 
		JOptionPane.showMessageDialog(null,"fin de programme");
		      break;
		default:
		JOptionPane.showMessageDialog(null, "mauvais choix");
		     }
		}while(choix!=14);
	}
	//Declaration des Méthodes;
	
	//Méthode pour tester la connection
	
	public static Connection  connecterDB(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver oki");
            String url="jdbc:mysql://localhost/locationvente?" +"user=root&password=p@ssword2017" ;
           Connection cn=DriverManager.getConnection(url);
           System.out.println("Connexion bien établié");
            return cn;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
	//Méthode POUR INSERER LES DONNEES DANS LA TABLE FILM

    public static void AjouterFilm(){
        try{
        	
        	 cn=connecterDB();
            st=cn.createStatement();
            //IDENTFIANT FILM, ET LE TITRE DE FILM
           int id = Integer.parseInt((JOptionPane.showInputDialog("Entrer identifiant du film idfilm svp ?")));
    		String titre = JOptionPane.showInputDialog("Entrer le titre du fillm svp?");
    	      
    		// MENU POUR INSERER LA CLES ETRANGERE CORRESPONDANT A LA TABLE PRODUCTEUR
    		
    		String menuprod="Selectionner un producteur de film svp?.\n\n";
    		       menuprod+= "80)NET FLEIX.\n\n";
    		       menuprod+="90)SKY CIEMA.\n\n";
    		       menuprod+="95)RADIO CANADA.\n\n";
    		       int IDPROD=Integer.parseInt(JOptionPane.showInputDialog(menuprod));
    		      
    		       // MENU POUR INSERER LA CLES ETRANGERE CORRESPONDANT A LA TABLE DISTRIBUTEUR
    		       String   menudist="selectionner un distributeur de film svp?\n\n";
    		                menudist+="4)CINEMA ATLAS.\n\n";
    		                menudist+="5)LES PLUS BEAUX FILMS.\n\n";
    		                menudist+= "6)QuEBEC CULTURE.\n\n";
    		       int IDSITRUB=Integer.parseInt(JOptionPane.showInputDialog(menudist));
    		       
    		       // MENU FORMAT FILM
    		    String menuFormat="Selectionner le format de film svp?\n\n\n";
    		       menuFormat+= "20)DVD.\n\n\n";
    		       menuFormat+="30)BLUE-RAY";
    		        int IdFormat=Integer.parseInt(JOptionPane.showInputDialog(menuFormat));
    		      
    		        //MENU LANGUE DE FILM
    		        String   menulang="Choisirla langue de film svp?.\n\n";
     		       menulang+= "50)FRANCAIS.\n\n";
     		       menulang+="60)ANGLAIS.\n\n";
     		       menulang+="70)ESPAGNOL.";
     		      int IDLANGUE=Integer.parseInt(JOptionPane.showInputDialog(menulang));
     		       
     		       // CLASSE FILM
     		       String menuClass="Choisir la classe de film svp?.\n\n";
    		              menuClass+= "1)General.\n\n";
    		              menuClass+="2)13 ans et plus.\n\n";
    		              menuClass+="3)16 ans et plus.\n\n";
    		              menuClass+= "6)18 ans et plus.\n\n";
              
    		              int IdClassF=Integer.parseInt(JOptionPane.showInputDialog(menuClass));
    		              
    		     // MENU CATEGORIE  
    		              String menuCat="Choisirla la categorie de film svp.?\n\n";
    		              menuCat+= "1)Drame.\n\n";
    		              menuCat+="2)Comedie.\n\n";
    		              menuCat+="3)Action.\n\n";
    		              menuCat+= "4)Suspens.\n\n";
    		              menuCat+= "5)Horreur.\n\n";
    		              menuCat+="6)International.\n\n";
    		              menuCat+="7)Enfant.\n\n";
    		              menuCat+= "8)Adulte.\n\n";
    		              menuCat+="9)Spectale.\n\n";
    		              menuCat+="10)Biographie.\n\n";
    		              menuCat+= "11)Serie.";
    		              
    		              int IdCat=Integer.parseInt(JOptionPane.showInputDialog(menuCat));
    		              // menu code de prix
    		              
    		              String menuCodePrix="Choisirla le code prix svp?.\n\n\n";
    		              menuCodePrix+= "1) Code prix  jeux usager.\n\n\n";
    		              menuCodePrix+="2)  Code prix  jeux les nouveautés.";
       
    		              int CodePrix=Integer.parseInt(JOptionPane.showInputDialog(menuCodePrix));
     		    		 
        	String query="INSERT INTO film VALUES("+id+",'"+titre+"',"+IDPROD+","+IDSITRUB+","+IdFormat+","+IDLANGUE+","+IdClassF+","+IdCat+","+CodePrix+")";
          st.executeUpdate(query);
          st.close();
            
          JOptionPane.showMessageDialog(null,"film ajouter");
                 
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
        
        
    } 

   // MÉTHODE POUR INSRER DES VALEUR A LA TABLES JEUX, La cles primaire not auto incremented a saisir svp
    
    
    public static void AjouterJeux() 
    		{
        try{
        	int idJeux = Integer.parseInt((JOptionPane.showInputDialog("identifiant du jeux svp:")));
    		String titre = JOptionPane.showInputDialog("Entrer nom du jeux"); 
    		
    		// MENU FORMAT DU JEUX
    		String menuFormat="SELECTION LA CONSOLE DU JEUX svp?\n\n";
		       menuFormat+= "100)PS3.\n\n";
		       menuFormat+="200)WII.\n\n";
		       menuFormat+="300)XBOX.\n\n";
		       menuFormat+="400)PC.";
		       int IdFormat=Integer.parseInt(JOptionPane.showInputDialog(menuFormat));
		    // menu code de prix
	              
	              String menuCodePrix="Choisirla le code prix svp?.\n\n";
	              menuCodePrix+= "1)prix  film usager.\n\n";
	              menuCodePrix+="2) prix pour les nouveaute.\n\n";

	              int CodePrix=Integer.parseInt(JOptionPane.showInputDialog(menuCodePrix));
	              
	              String   menudist="Selectionner un distributeur de film svp?.\n\n";
    		      
   		       menudist+="1)BEST GAME PROD.\n\n";
   		       menudist+="2)PRO JEUX.\n\n";
   		       menudist+= "6)MODERN JEUX.\n\n";
   		       
   		    
   		       int IDSITRUB=Integer.parseInt(JOptionPane.showInputDialog(menudist));
        	cn=connecterDB();
        	String query="INSERT INTO JEUX VALUES("+idJeux+",'"+titre+"',"+IdFormat+","+CodePrix+","+IDSITRUB+")";
            
            st=cn.createStatement();
            st.executeUpdate(query);
            JOptionPane.showMessageDialog(null, "jeux ajoute");
            st.close();
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
        
        
    }
    
  public static void AjouterExemplaire()
   {
                 try{
                	 cn=connecterDB();	 
            int id = Integer.parseInt((JOptionPane.showInputDialog("Identifiant de l'exemplaire svp?:")));
            int idfilm = Integer.parseInt((JOptionPane.showInputDialog("Identifiant de film svp:?")));
            int num= Integer.parseInt((JOptionPane.showInputDialog("Identifiant du client svp:?")));
            int idjeux = Integer.parseInt((JOptionPane.showInputDialog("Identifiant du jeux svp:?")));
            String Dsortie= JOptionPane.showInputDialog("Date de sortire svp:?");
            String Dachat= JOptionPane.showInputDialog("Date achat svp:?");
            String DVente= JOptionPane.showInputDialog("Date vent svp:?");
            double Prixvente= Double.parseDouble((JOptionPane.showInputDialog("PRIX VENTE svp:?")));
            double Prixachat= Double.parseDouble((JOptionPane.showInputDialog("PRIX achat svp:?")));
    String query="INSERT INTO  EXEMPLAIRE VALUES("+id+","+idfilm+","+num+","+idjeux+",'"+Dsortie+"','"+Dachat+"','"+DVente+"',"+Prixvente+","+Prixachat+")";
    		            
    		            st=cn.createStatement();
    		            st.executeUpdate(query);
    		            
    		          JOptionPane.showMessageDialog(null, " une exemplaire  a ete ajoute");
    		          st.close();
    		          
    		        }
               
                 catch(SQLException e){
    		            System.out.println(e.getMessage());
    		        } 
    		        
    		        
    		    }
   
   
  
   
    
 //+="4)AFFICHER TOUS LES CLIENT QUI ONT DES FRAIS DE REATARD\n";   
    
public static void Affichage4(){
	
	try       { 
	  cn=connecterDB();
      st=cn.createStatement();
     
      String sql="SELECT c.numcli,c.NOM,c.PRENOM FROM exemplaire e inner  JOIN client c ON e.NUMCLI = c.NUMCLI";
             sql+=" INNER JOIN location l ON l.NUMCLI = c.NUMCLI AND l.ID = e.ID left JOIN film f ON e.IDFILM =f.IDFILM";
             sql+=" LEFT  JOIN jeux j ON e.IDJEUX = j.IDJEUX where l.RETARD <>0" ;
            res=st.executeQuery(sql);
             
		String listeNoms = ""; 
 while (res.next()){
 	
	 
	    int numcli = res.getInt("NUMCLI");
		String nom = res.getString("NOM");
		String prenom = res.getString("PRENOM");
	
		
		listeNoms += numcli+ " " + nom + " " + prenom + " "+"\n";
	 
 	 
                      }
 JOptionPane.showMessageDialog(null,listeNoms);
 st.close();
 
 
		          }

	catch (SQLException e){
	       	 System.out.println(e.getMessage()); 
	                }
	} 



//"5) afficher tous les film qui sont des series\n"


public static void Affichage5(){
	
	try       { 
	  cn=connecterDB();
      st=cn.createStatement();
      String sql="SELECT F.IDFILM,F.TITRE FROM FILM F,SERIE S WHERE S.IDFILM=F.IDFILM GROUP BY F.IDFILM";
     res=st.executeQuery(sql);
      String filmSerie=" ";
 while (res.next()){
	 
	 int IDFILM=res.getInt("IDFILM");
	 String TITRE=res.getString("TITRE");
 	  
      
    filmSerie+=" "+IDFILM+" "+TITRE+"\n";
                      }

         JOptionPane.showMessageDialog(null,filmSerie);
         st.close();
		          }catch (SQLException e){
	       	 System.out.println(e.getMessage()); 
	                } 
	}



//6menu+="6) Afficher tous les client qui ont empruntés des séries\n"




public static void Affichage6(){
	
	try       { 
	 cn=connecterDB();   
      st=cn.createStatement();
     String sql= "SELECT  c.numcli, c.PRENOM, c.NOM FROM serie s INNER JOIN film f ON s.IDFILM = f.IDFILM";
      sql+=" LEFT  JOIN exemplaire e ON e.IDFILM = f.IDFILM INNER JOIN location l ON l.ID = e.ID";
      sql+=" INNER JOIN client  C ON l.NUMCLI = c.NUMCLI AND e.NUMCLI = c.NUMCLI group by c.numcli";
     res=st.executeQuery(sql);
       String req=" ";
 while (res.next()){
      int NUMCLI=res.getInt("NUMCLI");
      String NOM=res.getString("NOM");
      String PRENOM=res.getString("PRENOM");
      req+=" "+ NUMCLI+" "+NOM +" "+PRENOM+ " \n";
     }JOptionPane.showMessageDialog(null, req);
     st.close();
     res.close();
		          }catch (SQLException e){
	       	 System.out.println(e.getMessage()); 
	                }
	

}


//="7) A   QUESTION D: AFFICHER LES CLIENTS QUI ONT COMMANDE DES FILMS ET DE JEUX

public static void Affichage7(){
	
	try       { 
		cn=connecterDB();
      st=cn.createStatement();
      String sql="SELECT C.NUMCLI,c.NOM,c.PRENOM,f.TITRE AS TITREFILM, j.NOM as NomJEUX";
    	     sql+=" FROM exemplaire e inner  JOIN client c ON e.NUMCLI = c.NUMCLI";
    	     sql+=" INNER JOIN location l ON l.NUMCLI = c.NUMCLI";
    	     sql+=" AND l.ID = e.ID left JOIN film f ON e.IDFILM = f.IDFILM LEFT  JOIN jeux j ON e.IDJEUX = j.IDJEUX  GROUP BY C.NUMCLI ORDER BY C.NOM";
     res=st.executeQuery(sql);
     
     String req=" ";
 while (res.next()){
 	
          int NUMCLI=res.getInt("NUMCLI");
	      String NOM=res.getString("NOM");
	      String PRENOM=res.getString("PRENOM");
	      req+=" "+ NUMCLI+" "+NOM +" "+PRENOM+ " \n";
 	      }JOptionPane.showMessageDialog(null, req);
             st.close();
             res.close();
		          }catch (SQLException e){
	       	 System.out.println(e.getMessage()); 
	                }
	}



//QUESTION E: AFFICHER TOUS LES FILMS ET LE NOMBRE DE FOIS QUI A ETE EMPRUNTE
public static void Affichage8(){
	
	try       { 
	  cn=connecterDB();     
      st=cn.createStatement();
      
      String sql=" SELECT f.IDfilm, F.TITRE, COUNT(NUMEROLOCATION) AS NbreFoisLoue";
      sql+=" FROM exemplaire e INNER JOIN film  f ON e.IDFILM = f.IDFILM";
      sql+=" INNER JOIN location l ON l.ID = e.ID GROUP BY f.IDFILM ORDER BY NbreFoisLoue desc";
      
     res=st.executeQuery(sql);
     
      String req=" ";
 while (res.next()){
 	
	 
 	 int idfilm=res.getInt("IDFILM");
      int NbreFoisLoue=res.getInt("NbreFoisLoue");
       String titre=res.getString("TITRE");
      
      req+="idfilm: ="+idfilm+" TITRE DE FILM: "+titre+" nombre fois loue: "+NbreFoisLoue+"\n";
                      }
 JOptionPane.showMessageDialog(null, req);
 st.close();
 res.close();
		          }catch (SQLException e){
	       	 System.out.println(e.getMessage()); 
	                }
	}
//QUESTION f: AFFICHER TOUS LES  JEUX ET LE NOMBRE DE FOIS  QUI A ETE EMPRUNTE

public static void Affichage9(){

try       { 
  cn=connecterDB();  
  st=cn.createStatement();
  
  String sql="SELECT J.IDJEUX, J.NOM as NomDuJeux,COUNT(NUMEROLOCATION) AS NbreFoisJeuxLOUE";
        sql+=" FROM exemplaire e INNER JOIN jeux  j ON e.IDJEUX= J.IDJEUX";
        sql+=" INNER JOIN location l ON l.ID = e.ID GROUP BY J.IDJEUX ";
        res=st.executeQuery(sql);
       
    String req=" ";
while (res.next()){
	int idJeux=res.getInt("IDJEUX");
	String nomJeux=res.getString("NomDuJeux");
	int nombreFoisLoue=res.getInt("NbreFoisJeuxLOUE");
     req+= " IDJEUX:"+idJeux+ "NOM DU JEUX: "+nomJeux+"nombre fois loue: "+nombreFoisLoue+"\n";
    
                  }JOptionPane.showMessageDialog(null, req);
                  st.close();

	          }catch (SQLException e){
       	 System.out.println(e.getMessage()); 
                }
}



//  QUESTION : AFFICHER TOUS LES CLIENT QUI N'ONT PAS EU  DES FRAIS  DE RETARD


public static void Affichage10(){

try       { 
   cn=connecterDB();    
  st=cn.createStatement();
  String sql="SELECT c.NUMCLI,c.NOM,c.prenom FROM location l,client c where l.NUMCLI = c.NUMCLI group by c.numcli  HAVING SUM(l.RETARD)=0;";
        res=st.executeQuery(sql);
     
 String listeNoms=" ";
while (res.next()){
	int numcli = res.getInt("NUMCLI");
	String nom = res.getString("NOM");
	String prenom = res.getString("PRENOM");
	listeNoms += numcli+ " " + nom + " " + prenom + " "+"\n";
	 
                  }
         JOptionPane.showMessageDialog(null, listeNoms);
         st.close();
	          }catch (SQLException e){
       	 System.out.println(e.getMessage()); 
                }
}


//QUESTION 11QUESTION H: AFFICHER LE TOTAL DES FRAIS DE RETARD POUR CHAQUE CLIENT
public static void Affichage11(){

try       { 
  cn=connecterDB();    
  st=cn.createStatement();
 String sql="SELECT c.numcli,c.nom,c.prenom,SUM(RETARD) as TotalFraisRetard from client c, location l ";
		sql+=" where c.numcli=l.numcli group by c.numcli HAVING SUM(l.RETARD)<>0";
        res=st.executeQuery(sql);
        
        String listeNoms=" ";
while (res.next()){
	int numcli = res.getInt("NUMCLI");
	String nom = res.getString("NOM");
	String prenom = res.getString("PRENOM");
	 double TotalFraisRetard=res.getDouble("TotalFraisRetard");
	listeNoms += "numcli: "+numcli+ " nom:" + nom + " prenom: " + prenom + " Total Frais DE Retard :"+ TotalFraisRetard+ "\n";
	
                  }
JOptionPane.showMessageDialog(null, listeNoms);
st.close();
	          }catch (SQLException e){
       	 System.out.println(e.getMessage()); 
                }
}

// QUESTION 12* QUESTION i) AFFICHER TOUS les client qui n'ont jamais loue des jeux;

public static void Affichage12(){

try       { 
	cn=connecterDB();    
  st=cn.createStatement();
 String sql="SELECT C.NUMCLI,c.NOM,c.PRENOM FROM exemplaire e inner JOIN client c ON e.NUMCLI = c.NUMCLI";
		sql+=" INNER JOIN location l ON l.NUMCLI = c.NUMCLI AND l.ID = e.ID LEFT  JOIN jeux j ON e.IDJEUX = j.IDJEUX and isnull(j.IDJEUX)";
        sql+="GROUP BY C.NUMCLI ORDER BY C.NOM;";
        
		res=st.executeQuery(sql);
		
 String listeNoms=" ";
while (res.next()){
	int numcli = res.getInt("NUMCLI");
	String nom = res.getString("NOM");
	String prenom = res.getString("PRENOM");
	listeNoms += "numcli:"+numcli+ " nom: " + nom + " prenom: " + prenom +"\n";
                  }JOptionPane.showMessageDialog(null, listeNoms);
                  st.close();
	          }catch (SQLException e){
       	 System.out.println(e.getMessage()); 
                }
}

// QUESTION J) AFFICHER TOUS LES le client ET LE NBRE de jeux LOUE



         public static void Affichage13(){

        	 try       { 
        		 cn=connecterDB();
        		 String sql="SELECT c.NUMCLI,c.NOM,C.PRENOM,COUNT(NUMEROLOCATION) as NombreJeuxLoue"; 
        	      sql+=" FROM exemplaire e INNER JOIN jeux j ON e.IDJEUX = j.IDJEUX";
        	      sql+=" INNER JOIN location l ON l.ID = e.ID INNER JOIN client  c ON l.NUMCLI = c.NUMCLI";
        	      sql+=" AND e.NUMCLI = c.NUMCLI group by c.numcli order by c.nom";
        	      st=cn.createStatement();
        	      res=st.executeQuery(sql);
        	     
        	  String listeNoms=" ";
        	 while (res.next()){
        	 		 int numcli = res.getInt("NUMCLI");
        			String nom = res.getString("NOM");
        			String prenom = res.getString("PRENOM");
        			int nbreJeuxLoue= res.getInt("NombreJeuxLoue");
        			listeNoms +="numcli: " +numcli+ " NOM: " + nom + " PRENOM: " + prenom +  " nombre jeux qu'ils ont loues: "+  nbreJeuxLoue+"\n";
        			 
        	                   }JOptionPane.showMessageDialog(null, listeNoms);
        	                   st.close();
        	 	          }catch (SQLException e){
        	        	 System.out.println(e.getMessage()); 
        	                 }
        	 }
        	 }