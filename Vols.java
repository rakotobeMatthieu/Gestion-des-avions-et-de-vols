package elements ;
import java.util.*;
public class Vols{
    String id;
    String depart;
    String arrive ;
    Date date;
    int tarif;

    public Vols(String i , String dep , String arr,Date dur,int tar){
        id=i;
        depart=dep;
        arrive=arr;
        date=dur;
        tarif=tar;
    }
    public Vols(){
        
    }
    public String getID(){
        return id;
    }

    public void setID(String nov){
        id=nov ;
    }   
    
    public String getDEPART(){
        return depart;
    }

    public void setDEPART(String nov){
        depart=nov ;
    }     

    public String getARRIVE(){
        return arrive;
    }

    public void setARRIVE(String nov){
        arrive=nov ;
    }   

    public Date getDATE(){
        return date;
    }

    public void setDATE(int annee , int mois , int jour){
        date.setYear(annee) ;
        date.setMonth(mois) ;
        date.setDate(jour) ;
    }

    public void setDATE(Date dt){
        date=dt;
    }

    public int getTARIF(){
        return tarif;
    }

    public void setTARIF(int nov){
        tarif=nov ;
    }  

}          
            