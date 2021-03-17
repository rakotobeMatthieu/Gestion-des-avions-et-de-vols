package elements ;
import java.util.*;
public class Itineraire{
    Vector vols=new Vector();

    public Itineraire(Vector v){
        vols=v;
    }

    public Itineraire(){

    }

    public Vector getVOLS(){
        return vols;
    }
    public void setVOLS(Vector temp){
        vols=temp;
    }
}    