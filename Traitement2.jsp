<%@ page import="elements.*" %>
<%@ page import="connection.*" %>
<%@ page import="utilitaire.*" %>

<%
Connect connex=new Connect();
connex.connection();

String idDepart=request.getParameter("param");
String idArrive=request.getParameter("param2");
String nombre1=request.getParameter("param3");

String anneeD=request.getParameter("AnneeD");
String monthD=request.getParameter("MonthD");
String jourD=request.getParameter("JourD");

String anneeA=request.getParameter("AnneeA");
String monthA=request.getParameter("MonthA");
String jourA=request.getParameter("JourA");

int nombre=Integer.parseInt(nombre1);
int aD=Integer.parseInt(anneeD);
int mD=Integer.parseInt(monthD);
int jD=Integer.parseInt(jourD);

int aA=Integer.parseInt(anneeA);
int mA=Integer.parseInt(monthA);
int jA=Integer.parseInt(jourA);
%>
<%  Itineraire[] reponse = connex.getFonction().volDispo(idDepart,idArrive,aD,mD,jD,nombre);%>
<h1>PROPOSITION VOL ALLE</h1>
<% 

    try{

for(int i=0 ; i< reponse.length ; i++){
    int total=0;
    for(int j=0 ; j< reponse[i].getVOLS().size();j++){

       Object temp=reponse[i].getVOLS().elementAt(j);
       Vols str=(Vols)temp;
       total=total+str.getTARIF();
       String depart=connex.getFonction().afficherNom(str.getDEPART());
       String arrive=connex.getFonction().afficherNom(str.getARRIVE());
       out.println(depart+"------->");
       out.println(arrive+"  ");
       out.println("    TARIF-->"+str.getTARIF()+"        ");
       String vol=connex.getFonction().getidVol(str.getDEPART(),str.getARRIVE());
         %>RESERVATION DES PLACES:  <form action="Automatique.jsp" method="post">
                         <input type="hidden" name="nombre" value="<%= nombre%>">
                         <input type="hidden" name="vol" value="<%= vol%>">
                         <input type="submit" value="Automatique">
                         </form>

                          <form action="choix.jsp" method="post">
                         <input type="hidden" name="vol" value="<%= vol%>">
                         <input type="submit" value="Manuel">
                         </form>
       
            <%
    }out.println("Total ="+total);%>
  
    <!--<a href='Affichage.jsp'>Reserver place </a>-->
    <p>------------------------------------------------------------</p>
    <%
}
    }
    catch(Exception e){
        
    }
%>

</br>
</br>

<%  Itineraire[] reponse2 = connex.getFonction().volDispo(idArrive,idDepart,aD,mD,jD,nombre);%>
<h1>PROPOSITION VOL RETOUR</h1>
<% 
try{
for(int i=0 ; i< reponse2.length ; i++){
    int total=0;
    for(int j=0 ; j< reponse2[i].getVOLS().size();j++){

       Object temp=reponse2[i].getVOLS().elementAt(j);
       Vols str=(Vols)temp;
       total=total+str.getTARIF();
       String depart=connex.getFonction().afficherNom(str.getDEPART());
       String arrive=connex.getFonction().afficherNom(str.getARRIVE());
       out.println(depart+"------->");
       out.println(arrive+"  ");
       out.println("    TARIF-->"+str.getTARIF());
      String vol=connex.getFonction().getidVol(str.getDEPART(),str.getARRIVE());
         %>RESERVATION:  <form action="Automatique.jsp" method="post">
                         <input type="hidden" name="nombre" value="<%= nombre%>">
                         <input type="hidden" name="vol" value="<%= vol%>">
                         <input type="submit" value="Automatique">
                         </form>

                          <form action="choix.jsp" method="post">
                         <input type="hidden" name="vol" value="<%= vol%>">
                         <input type="submit" value="Manuel">
                         </form>                         
        <p>
            <%
    }out.println("Total ="+total);%>
    
    <p>------------------------------------------------------------</p>
    <%
}
}catch(Exception e){
    
}
%>

