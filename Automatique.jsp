<%@ page import="elements.*" %>
<%@ page import="connection.*" %>
<%@ page import="utilitaire.*" %>
<%@ page import="java.util.*" %>
<%
Connect connex=new Connect();
connex.connection();

String nombre1=request.getParameter("nombre");
int isa=Integer.parseInt(nombre1);

String vol1=request.getParameter("vol");
String vol2=connex.getFonction().getidAvion(vol1);
connex.getFonction().reservAuto(isa,vol2);
String place[]=connex.getFonction().getplacelibre(vol2);


out.println(vol1);
%>
</br>
<%
out.println("RESERVATION DES "+isa+" PLACE EFFECTUE \n" );
%>
</br>
<%
for(int i=0 ; i< isa ; i++){
    out.println("Vous avez reserve la place "+place[i]+ "\n");
%>
</br>
    <%
}
%>