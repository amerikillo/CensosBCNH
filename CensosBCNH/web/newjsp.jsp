<%-- 
    Document   : newjsp
    Created on : 17-abr-2014, 17:32:15
    Author     : Americo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String lang[]=request.getParameterValues("c1");
    out.println(lang[0]);
    out.println(lang[1]);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
