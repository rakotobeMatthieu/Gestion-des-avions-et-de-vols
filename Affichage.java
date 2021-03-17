package aff;
import utilitaire.*;
import connection.* ;
import elements.* ;
import java.util.*;
import java.sql.*;
import java.lang.*;


public class Affichage  {

  public static void main(String[] args) throws Exception {      

    Connect connex=new Connect();
    Object[] objet= new Object[100];
    Statement t;
    connex.connection();


  /* Vols resultat;
   resultat=connex.getFonction().vol("PSY001");

   System.out.println("Depart="+resultat.getDEPART()+" arrive= "+resultat.getARRIVE()+" DURREE= "+resultat.getDUREE());*/
  // int compte=connex.getFonction().compterNbpossible("PSY001");
  // System.out.println("Nombre de cas possible="+compte+"\n");
  //connex.getFonction().casPossible("PSY003");
   //Vols[] vol=connex.getFonction().casPossible("PSY001");
  /* Itineraire[] reponse= connex.getFonction().volDispo("PSY001","PSY002",2017,12,15,40);
   System.out.println("---------------------------------------------------------------------------------------------------- \n");
   System.out.println("reponse.length="+reponse.length);
   for(int i=0 ; i<reponse.length ; i++){
      int total=0;
     for(int j=0 ; j<reponse[i].getVOLS().size();j++){
       
       Object temp=reponse[i].getVOLS().elementAt(j);
       Vols str=(Vols)temp;
       total=total+str.getTARIF();
       System.out.println("DEPART-->"+connex.getFonction().afficherNom(str.getDEPART())+"\t");
       System.out.println("ARRIVE-->"+str.getARRIVE()+"\n");
       System.out.println("ARRIVE-->"+str.getTARIF()+"\n");
     }
     System.out.println("Total ="+total);
   
  }*/
 // String[] repon=connex.getFonction().getidcat(connex.getFonction().getidAvion("VOL002"));
  //connex.getFonction().reservAuto(20 , "AVN005");
  int rep=connex.getFonction().compterPlaceLibre("AVN001");
  System.out.println("La reponse est=="+rep);
}
}
