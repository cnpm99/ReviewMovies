<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Welcome</title>
    </head>
    <body>
        <%
            String user = request.getParameter("username");
            out.print("Welcome " + user + " to my site!");
        %>
    </body>
</html>