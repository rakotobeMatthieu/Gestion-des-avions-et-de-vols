<%@ page import="elements.*" %>
<%@ page import="connection.*" %>
<%@ page import="utilitaire.*" %> 
<% 
Connect connex=new Connect();
connex.connection();

String vol=request.getParameter("vol");
out.println(vol);
String[] cat=connex.getFonction().getidcat(connex.getFonction().getidAvion(vol));%>
<h3>CHOISIR LA CATEGORIE</h3>
<form action="Reservation.jsp" method="post">
    <% for(int i=0 ; i< cat.length ; i++){ 
        String nom=connex.getFonction().getNomcateg(cat[i]);
        %>
<input type="hidden" name="categ" value="<%= cat[i]%>">        
<input type="hidden" name="vol" value="<%= vol%>">        
<input type="submit" name="chiffre" value="<%= cat[i]%>">
    <%  } %>
    </br>
</form>