<%-- 
    Document   : video
    Created on : 02-dic-2017, 10:45:35
    Author     : limati
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
        
        
        
        <div id="dialogoVideo" title="Video" >
            <br>
            <div align="center">
            <video id="sourceVideo" width="320" height="240" controls>
               <source src='C:\\AulaVirtual_Files\\lessons\\video\\Ejemplo2.mp4'  type='video/mp4'>
            </video>
                <div id="divVideo">
                    <form action="LoginServlet" method="POST">
                        <input id="user" name="user" type="text"><br><br>
                        <input id="pass" name="pass" type="text"><br><br>
                        <input type="submit" >Enviar</button> 
                    </form>
                    
                </div>
                
            </div>


        </div>
    </body>
</html>
