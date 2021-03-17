<%@ page import="elements.*" %>
<%@ page import="connection.*" %>
<%@ page import="utilitaire.*" %> 

<h2>Reserver vos place ici</h2>
<%
Connect connex=new Connect();
connex.connection();

String vol=request.getParameter("vol");
String vol1=connex.getFonction().getidAvion(vol);
String categ=request.getParameter("chiffre");

String[] place=connex.getFonction().place(vol1);
int ligne=connex.getFonction().nombreLignes(vol1,categ);
int colonne=connex.getFonction().nombreColonnes(vol1,categ);


%>
<form action="Reservation2.jsp" method="post">
    <% for(int i=1 ; i<= ligne ; i++){
        for(int j=1 ; j<= colonne ; j++){
            String valeur=connex.getFonction().getnomVol(i,j,vol1,categ);
            int libre=connex.getFonction().estLibre(vol1,valeur);
            %>
            <%
            if (libre==1){
             %>
<input type="hidden" name="vol" value="<%= vol%>">
<input type="checkbox" name="<%= valeur%>">
    <%  }
    
    if (libre==0){%>
Reservee

    <%  }}%>
    </br>
   <% }%>
<input type="submit" name="chiffre" value="Reserver">
</form>
