
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.seminario"%>
<%
    if(session.getAttribute("lista")==null){
        ArrayList<seminario> listAux = new ArrayList<seminario>();
        session.setAttribute("lista", listAux);
    }
    List<seminario> lista = (ArrayList<seminario>) session.getAttribute("lista");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>LISTA DE INSCRITOS</h1>
        <h2>By: Nayely Quispe Mamani</h2>
        <p><a href ="MainServlet?action=nuevo">Nuevo</a></p>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Fecha</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Turno</th>
                <th>Seminario</th>
                <th></th>
                <th></th>
            </tr>
            <%
                for(seminario sem: lista){
            %>
            <tr>
                <td><%= sem.getId()%></td>
                <td><%= sem.getFecha()%></td>
                <td><%= sem.getNombre()%></td>
                <td><%= sem.getApellido()%></td><%%>
                <td><%= sem.getTurno()%></td>
                <td><%= sem.getSeminarios()%></td>
                <td><a href="MainServlet?action=editar&id=<%= sem.getId()%>">Editar</a></td>
                <td><a href="MainServlet?action=eliminar&id=<%= sem.getId()%>">Eliminar</a></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
