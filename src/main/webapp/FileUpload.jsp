<%-- 
    Document   : FileUpload
    Created on : 02/11/2017, 11:12:16 PM
    Author     : Yoel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <br>
        <br>
        <br>
        <form action="FileUpload" method="GET" enctype="multipart/form-data">
            <input type="text" id="dni">
            
            <input type="file" id="archivo" multiple>
            <input type="submit" value="enviar">
        </form>
    </body>
</html>
