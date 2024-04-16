<%-- 
    Document   : edit
    Created on : 16 abr. de 2024, 14:18:26
    Author     : Personal
--%>
<%@page import="com.emergentes.seminario"%>
<%
    seminario sem = (seminario) request.getAttribute("seminario");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>REGISTRO EN SEMINARIOS</h1>
        <form action="MainServlet" method="post">
            <input type="hidden" name="id" value="<%= sem.getId()%>">
            <table>
                <tr>
                    <td>
                        <table  border="1" cellspacing="0" width="300" height="150"><tr><td>
                                    <table>
                                        <tr>
                                            <td>Fecha</td>
                                            <td><input type="date" name="fecha" value="<%= sem.getFecha()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Nombre</td>
                                            <td><input type="text" name="nombre" value="<%= sem.getNombre()%>" ></td>
                                        </tr>
                                        <tr>
                                            <td>Apellidos</td>
                                            <td><input type="text" name="apellido" value="<%= sem.getApellido()%>" ></td>
                                        </tr>
                                        <tr>
                                            <td>Turno</td>
                                            <td>
                                                <input type="radio" name="turno" value="Mañana<%= sem.getTurno()%>" >Mañana 
                                                <input type="radio" name="turno" value="Tarde <%= sem.getTurno()%>" >Tarde 
                                                <input type="radio" name="turno" value="Noche <%= sem.getTurno()%>" >Noche 
                                            </td> 
                                        </tr>
                                    </table>
                                </td></tr></table>
                    </td> 
                    <td width="30" height="150"></td>
                    <td>  
                        <table border="1" cellspacing="0" width="200" height="150">
                            <tr>
                                <td><input type="checkbox" name="seminarios" value="Inteligencia Artificial<%= sem.getSeminarios()%>">Inteligencia Artificial
                                    <br>
                                    <input type="checkbox" name="seminarios" value="Machine Learning<%= sem.getSeminarios()%>">Machine Learning
                                    <br>
                                    <input type="checkbox" name="seminarios" value="Simulacion con Arena<%= sem.getSeminarios()%>">Simulacion con Arena
                                    <br>
                                    <input type="checkbox" name="seminarios" value="Robótica Educactiva<%= sem.getSeminarios()%>">Robótica Educactiva
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <input type="submit">
        </form>
    </body>
</html>
