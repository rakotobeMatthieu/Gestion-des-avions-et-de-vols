<%@ page import="utilitaire.*" %>
<%@ page import="connection.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vols | Examen</title>
</head>    

<body>
<%
Connect connex = new Connect();
connex.connection();
 %>

<form action="Traitement2.jsp" method="post">
    
<select name="param">
    <% int isa=connex.getFonction().comptePays();
       String[] nompays=connex.getFonction().nomPays() ;
       String[] idpays=connex.getFonction().idPays() ;
    %>
    <%  for(int z=0 ; z< isa ; z++){ %>    
  <option value="<%= idpays[z]%>"><%= nompays[z] %></option>
    <% } %>
  </select>



<select name="param2">
    
    <%  for(int z=0 ; z< isa ; z++){ %>
  <option value="<%= idpays[z]%>"><%= nompays[z] %></option>
    <% } %>
  </select>

 <select name="param3">
    
    <%  for(int z=1 ; z<= 10 ; z++){ %>
  <option value="<%= z%>"><%= z%></option>
    <% } %>
  </select>

</br>
</br>
<p>Date de depart</p>
<input type="text" name="AnneeD" placeholder="Annee">
<input type="text" name="MonthD" placeholder="Mois">
<input type="text" name="JourD" placeholder="Jour">

<p>Date de d arrive </p>
<input type="text" name="AnneeA" placeholder="Annee">
<input type="text" name="MonthA" placeholder="Mois">
<input type="text" name="JourA" placeholder="Jour">
<input type="submit" value="Rechercher vols">
</form>    
</body>
</html>    