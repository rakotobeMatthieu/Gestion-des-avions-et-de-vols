package elements ;
import java.util.*;
public class Place{
    String nom;
    int ligne;
    int colonne ;
    String idavion;
    String idcat;
    String libre;

    public Place(String i , int lg , int col,String ida,String idc,String lib){
        nom=i;
        ligne=lg;
        colonne=col;
        idavion=ida;
        idcat=idc;
        libre=lib;
    }

    public String getNOM(){
        return nom;
    }

    public void setNOM(String nov){
        nom=nov;
    }   

    public int getLIGNE(){
        return ligne;
    }

    public void setLIGNE(int nov){
        ligne=nov ;
    }  

    public int getCOLONNE(){
        return colonne;
    }

    public void setCOLONNE(int nov){
        colonne=nov ;
    }      

    public String getIDAVION(){
        return idavion;
    }

    public void setIDAVION(String nov){
        idavion=nov ;
    }  

    public String getIDCAT(){
        return idcat;
    }

    public void setIDCAT(String nov){
        idcat=nov ;
    }  


    public String getLIBRE(){
        return libre;
    }

    public void setLIBRE(String nov){
        libre=nov ;
    }  

}          
