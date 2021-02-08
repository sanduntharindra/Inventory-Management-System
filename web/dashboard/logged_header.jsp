<%-- 
    Document   : logged_header
    Created on : 07-Feb-2021, 00:59:01
    Author     : Sandun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            if(session.getAttribute("user_logged")==null)
            {
                response.sendRedirect("../login.jsp");
            }
            
        %>
    </body>
</html>
