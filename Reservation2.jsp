<%@ page import="elements.*" %>
<%@ page import="connection.*" %>
<%@ page import="utilitaire.*" %>
<%@ page import="java.util.*" %>

<%
Connect connex=new Connect();
connex.connection();
Enumeration param=request.getParameterNames();
while(param.hasMoreElements()){

    String name=(String)param.nextElement();
out.println(name);

String Chiffre1=request.getParameter("chiffre");

String vol1=request.getParameter("vol");
String vol2=connex.getFonction().getidAvion(vol1);

connex.getFonction().reservation(vol2,name);    
}


%>