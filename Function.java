package utilitaire;
import connection.*;
import elements.*;
import java.sql.*;
import java.util.*;
import java.text.*;
public class Function 
{
	Statement stat;
    int i=0;
	
	public Function(Statement s)throws Exception
	{
		this.stat = s;
	}
	
    public void valider() throws Exception
	{
		this.stat.executeQuery("Commit");
	}

 	public void afficher(String table)throws Exception{  
		ResultSet res= this.stat.executeQuery("SELECT * FROM "+table);
        ResultSetMetaData result = res.getMetaData();
		while(res.next()){
			for(int i=1; i<result.getColumnCount()-1; i++)
			{
				for(int j=1 ; j<result.getColumnCount()+1;j++)
				{
				System.out.println(result.getColumnName(j)+": "+res.getString(j)+"\n");
				}

			}
			
		}

    }

	public void afficher(ResultSet res)throws Exception{

        ResultSetMetaData result = res.getMetaData();
		while(res.next()){
			for(int i=1; i<=result.getColumnCount(); i++)
			{
				System.out.println(result.getColumnName(i)+": "+res.getObject(i).toString()+"\n");
			}
		}
    }


    public Vols vol(String depart)throws Exception{

        Vols resultat=new Vols();        
        ResultSet res=this.stat.executeQuery("select * from vols where iddepart='"+depart+"'");
        ResultSetMetaData result = res.getMetaData();

        while(res.next()){

            resultat.setDEPART(res.getObject(2).toString());
            resultat.setARRIVE(res.getObject(3).toString());
            //resultat.setDATE(res.getObject(4).toString()); ////////mila avadika date
            resultat.setTARIF(res.getInt(5));
        } 
        return resultat;
    }

    public int compterNbpossible(String depart)throws Exception{
        int reponse=0;
        ResultSet res=this.stat.executeQuery("select COUNT(iddepart) from vols start WITH iddepart='"+depart+"' connect by nocycle prior idarrive=iddepart ");

        while(res.next()){
            reponse=res.getInt(1);
        }

        return reponse;
    }

    public int compterNbpossible2(String depart , String arrive)throws Exception{
        int reponse=0;
        ResultSet res=this.stat.executeQuery("select COUNT(iddepart) from vols where idarrive='"+arrive+"' start WITH iddepart='"+depart+"' connect by nocycle prior idarrive=iddepart");

        while(res.next()){
            reponse=res.getInt(1);
        }

        return reponse;
    }

    public String afficherNom(String h)throws Exception{
        ResultSet res=this.stat.executeQuery(" select nompays from pays where id='"+h+"'");
        String reponse="";
        while(res.next()){
        reponse=res.getObject(1).toString();
        }
        return reponse;
    }
    public int comptePays()throws Exception{
        ResultSet res=this.stat.executeQuery("select count(id) from pays");
        int reponse=0 ;
        while(res.next()){
            reponse=res.getInt(1);
        }
        return reponse;
    }

    public String getidVol(String depart , String arrive)throws Exception{
        ResultSet res=this.stat.executeQuery("select id from vols where iddepart='"+depart+"' and idArrive='"+arrive+"'");
        String reponse="" ;
        while(res.next()){
            reponse=res.getObject(1).toString();
        }
        return reponse;        
    }

    public String getnomVol(int ligne , int colonne , String vol,String categ)throws Exception{
        ResultSet res=this.stat.executeQuery("select nom from place where ligne="+ligne+" and colonne="+colonne+" and idavion='"+vol+"' and idcat='"+categ+"'");/////////////////////////////
        String reponse="" ;
        while(res.next()){
            reponse=res.getObject(1).toString();
        }
        return reponse;        
    }    

    public String getidAvion(String id)throws Exception{
        ResultSet res=this.stat.executeQuery("select idavion from avion where idvol='"+id+"'");/////////////////////////////
        String reponse="" ;
        while(res.next()){
            reponse=res.getObject(1).toString();
        }
        return reponse;        
    }     

    public String[] nomPays()throws Exception{
        String[] valiny = new String[comptePays()];
        int i=0;
        ResultSet res=this.stat.executeQuery("select nompays from pays");
        while(res.next()){
            valiny[i]=res.getObject(1).toString();
            i++;
        }
        return valiny;
    }

    public String[] idPays()throws Exception{
        String[] valiny = new String[comptePays()];
        int i=0;
        ResultSet res=this.stat.executeQuery("select id from pays");
        while(res.next()){
            valiny[i]=res.getObject(1).toString();
            i++;
        }
        return valiny;
    }
    public int compterMaxlevel(String depart , String arrive)throws Exception{
        int reponse=0;
        ResultSet res=this.stat.executeQuery("select MAX(LEVEL) from vols where idarrive='"+arrive+"' start WITH iddepart='"+depart+"' connect by nocycle prior idarrive=iddepart");

        while(res.next()){
            reponse=res.getInt(1);
        }

        return reponse;
    }

    public int compterPlaceLibre(String vol)throws Exception{
        int reponse=0;
        ResultSet res=this.stat.executeQuery("select count(nom) from place where idavion='"+vol+"' and libre='y'");/////////////////////////////

        while(res.next()){
            reponse=res.getInt(1);
        }
        return reponse;
    }

    public int compterplace(String vol)throws Exception{
        int reponse=0;
        ResultSet res=this.stat.executeQuery("select count(nom) from place where idavion='"+vol+"'");/////////////////////////////

        while(res.next()){
            reponse=res.getInt(1);
        }
        return reponse;        
    }

    public int nombreLignes(String vol , String categ)throws Exception{
        int reponse=0;
        ResultSet res=this.stat.executeQuery("select max(ligne) from place where idavion='"+vol+"' and idcat='"+categ+"'");/////////////////////////////

        while(res.next()){
            reponse=res.getInt(1);
        }
        return reponse;        
    } 

    public int nombreColonnes(String vol , String categ)throws Exception{
        int reponse=0;
        ResultSet res=this.stat.executeQuery("select max(colonne) from place where idavion='"+vol+"' and idcat='"+categ+"'");/////////////////////////////
 
        while(res.next()){
            reponse=res.getInt(1);
        }
        return reponse;        
    }     

    public int estLibre(String vol , String nom)throws Exception{
        int reponse=12;
        String temp="";
        
        ResultSet res=this.stat.executeQuery("select libre from place where idavion='"+vol+"' and nom='"+nom+"'");/////////////////////////////

        while(res.next()){
            temp=res.getObject(1).toString();
           
            System.out.println("LIBRE== "+temp);  

            if(temp.compareTo("y")==0){
                reponse=1;
            }
            else if(temp.compareTo("n")==0){
                reponse=0;
            }                     
        }
 
        return reponse;        
    }                                                           


    public String[] place(String vol)throws Exception{
        String[] reponse = new String[compterplace(vol)];
        ResultSet res=this.stat.executeQuery("select nom from place where idavion='"+vol+"'");/////////////////////////////
        int i=0;
        while(res.next()){
            reponse[i]=res.getObject(1).toString();
            i++;
        }
        return reponse;          
    }

    public Vols[] casPossible(String depart)throws Exception{
        int possible=compterNbpossible(depart);
        Vols[] reponse=new Vols[possible];

        ResultSet res=this.stat.executeQuery("select connect_by_root iddepart as origin , iddepart , idarrive , LEVEL as niveau , datedepart , tarif as prix from vols start WITH iddepart='"+depart+"' connect by nocycle prior idarrive=iddepart");
        int compte=0;
        while(res.next()){
            reponse[compte]=new Vols();
            reponse[compte].setDEPART(res.getObject(2).toString());
            reponse[compte].setARRIVE(res.getObject(3).toString());
            String string=res.getObject(5).toString();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date date=sdf.parse(string);
            reponse[compte].setDATE(date);

            reponse[compte].setTARIF(res.getInt(6));
            compte++;
        }

        return reponse;

    }
 
    public Itineraire[] volDispo(String depart , String arrive , int annee , int mois , int jour , int nbPlace)throws Exception{
        annee=annee-1900;
        mois=mois-1;
        
        java.util.Date dt=new java.util.Date(annee,mois,jour);
        java.util.Date dt1=new java.util.Date(annee,mois,jour+2);
        java.util.Date dt2=new java.util.Date(annee,mois,jour-2);


        int tableau1=compterNbpossible2(depart , arrive);

        Vols[] vol=casPossible(depart);
        Itineraire[] valiny=new Itineraire[tableau1];
        int principal=0;
        for(int i=0 ; i<vol.length ; i++){
            int a=0 ;
           
            System.out.println("IDDEPART="+vol[i].getDEPART());
            if(vol[i].getDEPART().compareTo(depart)==0 && vol[i].getARRIVE().compareTo(arrive)==0 && vol[i].getDATE().compareTo(dt1)<0 && vol[i].getDATE().compareTo(dt2)>0&& compterPlaceLibre(getidAvion(getidVol(vol[i].getDEPART(),vol[i].getARRIVE())))>=nbPlace){
                
                valiny[principal]=new Itineraire();

                valiny[principal].getVOLS().add(0,vol[i]);
                principal++;
            }
            if(vol[i].getDEPART().compareTo(depart)==0 && vol[i].getARRIVE().compareTo(arrive)!=0 && vol[i].getDATE().compareTo(dt1)<0 && vol[i].getDATE().compareTo(dt2)>0 && principal<tableau1){
                System.out.println("eto ny principal"+principal);
                
                Vols[]temp=new Vols[compterMaxlevel(depart,arrive)];

                int x=0;
                //System.out.println("NOMBRE DE PLACE DISPO AO AMLE VOL[A]==="+compterPlaceLibre("VOL001"));
                //System.out.println("ID ANLE VOL[A]==="+getidVol(vol[a].getARRIVE(),vol[a].getARRIVE()));
                while(vol[a].getARRIVE().compareTo(arrive)!=0 && vol[a].getARRIVE().compareTo(vol[a+1].getDEPART())==0 && compterPlaceLibre(getidAvion(getidVol(vol[a].getDEPART(),vol[a].getARRIVE())))>=nbPlace) {
                    for(int q=0 ; q<temp.length ;q++){                       
                    temp[q]=new Vols();
                    


                    }
                    while(vol[a].getARRIVE().compareTo(arrive)!=0 && a<temp.length-1){
                    temp[x]=vol[a];
                    temp[x+1]=vol[a+1];
                    
                  
                    a++;
                    x++;
                    if(vol[a].getARRIVE().compareTo(vol[a+1].getDEPART())!=0){


                        continue;
                    }                    
                    }
                 
                    if(vol[a].getARRIVE().compareTo(arrive)==0){

                     valiny[principal]=new Itineraire();                     
                
                     for(int c=0 ; c<temp.length ;c++){
                     
                     valiny[principal].getVOLS().add(c,temp[c]);

                     } 
                     principal++;                      
                    }

                    
                }
                            
            }
        }
        return valiny;
    }

    public void reservAuto(int nombre , String vol)throws Exception{
        int libre=compterPlaceLibre(vol);
        String[] place=new String[libre];
        ResultSet res=this.stat.executeQuery("select * from place where idavion='"+vol+"' and libre='y'");/////////////////////////////
        int i=0;
        while(res.next()){
            place[i]=res.getObject(1).toString();
            i++;
        }       
        
        for(int j=0 ; j<nombre ; j++){
        System.out.println("update place set libre='n' where idavion="+vol+ "and nom= "+place[j]);
        this.stat.executeQuery("update place set libre='n' where idavion='"+vol+"' and nom='"+place[j]+"'");
        valider();
        }
    }

    public String[] getplacelibre(String vol)throws Exception{
        int libre=compterPlaceLibre(vol);
        String[] place=new String[libre];
        ResultSet res=this.stat.executeQuery("select * from place where idavion='"+vol+"' and libre='y'");/////////////////////////////
        int i=0;
        while(res.next()){
            place[i]=res.getObject(1).toString();
            i++;
        }
        return place;          
    }    

    public void reservation(String vol , String place )throws Exception{
        this.stat.executeQuery("update place set libre='n' where idavion='"+vol+"' and nom='"+place+"'");/////////////////////////////
        valider();
    }

    public int getnbcat(String vol)throws Exception{
        ResultSet res=this.stat.executeQuery("select distinct idcat from place where idavion='"+vol+"'");/////////////////////////////
        int reponse=0 ;
        while(res.next()){
            reponse++;
        }
        return reponse;        
    }     

    public String[] getidcat(String vol)throws Exception{
        String[] reponse = new String[getnbcat(vol)];
        ResultSet res=this.stat.executeQuery("select distinct idcat from place where idavion='"+vol+"'");/////////////////////////////
        int i=0;
        while(res.next()){
            reponse[i]=res.getObject(1).toString();
            System.out.println(reponse[i]);
            i++;
        }
        return reponse;          
    } 

    public String getNomcateg(String id)throws Exception{
        String reponse="";
        ResultSet res=this.stat.executeQuery("select nom from categorie where id='"+id+"'");
        while(res.next()){
            reponse=res.getObject(1).toString();
            
        }
        return reponse;          
    }   
}    