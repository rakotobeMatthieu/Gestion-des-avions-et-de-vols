package elements ;
import java.util.*;
public class Avion{
    String id;
    String ligne;
    String colonne ;


    public Avion(String i , String lg , String col){
        id=i;
        ligne=lg;
        colonne=col;

    }
    public String getID(){
        return id;
    }

    public void setID(String nov){
        id=nov;
    }   

    public String getLIGNE(){
        return ligne;
    }

    public void setLIGNE(String nov){
        ligne=nov;
    } 

    public String getCOLONNE(){
        return colonne;
    }

    public void setCOLONNE(String nov){
        colonne=nov;
    } 

}          
