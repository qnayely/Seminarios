
package com.emergentes;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") != null ? request.getParameter("action") : "view";
        switch (action) {
            case "view":
                response.sendRedirect("index.jsp");
                break;
            case "nuevo":
                seminario s = new seminario();
                request.setAttribute("seminario", s);
                request.getRequestDispatcher("edit.jsp").forward(request, response);
                break;
            case "editar":
                int idEditar = Integer.parseInt(request.getParameter("id"));
                HttpSession session = request.getSession();
                List<seminario> lista = (ArrayList<seminario>) session.getAttribute("lista");

                seminario editsem = new seminario();
                for (seminario item : lista) {
                    if (item.getId() == idEditar) {
                        editsem = item;
                        break;
                    }
                }
                request.setAttribute("semianrio", editsem);
                request.getRequestDispatcher("edit.jsp").forward(request, response);
                break;
            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                HttpSession sesion = request.getSession();
                List<seminario> lista1 = (ArrayList<seminario>) sesion.getAttribute("lista");
for (seminario item : lista1) {
                    if (item.getId() == idEliminar) {
                        System.out.println(item.toString());
                        lista1.remove(item);
                        break;
                    }
                }
response.sendRedirect("index.jsp");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String fecha = request.getParameter("fecha");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String turno = request.getParameter("turno");
        String seminarios = request.getParameter("seminarios");

        HttpSession ses = request.getSession();
        List<seminario> lista = (ArrayList<seminario>) ses.getAttribute("lista");

        if (id == 0) {
            seminario s = new seminario();
            int idNuevo = obtenerNuevoId(lista);
            s.setId(idNuevo);
            s.setFecha(fecha);
            s.setNombre(nombre);
            s.setApellido(apellido);
            s.setTurno(turno);
            s.setSeminarios(seminarios);
            lista.add(s);
        }
        else{
            for(seminario item: lista){
                if(item.getId()==id){
                    item.setId(id);
                    item.setFecha(fecha);
                    item.setNombre(nombre);
                    item.setApellido(apellido);
                    item.setTurno(turno);
                    item.setSeminarios(seminarios);
                    break;
                }
            }
        }
        response.sendRedirect("index.jsp");
    }

    private int obtenerNuevoId(List<seminario> lista) {
        int nuevoId = 1;
        for (seminario item : lista) {
            if (item.getId() >= nuevoId) {
                nuevoId = item.getId() + 1;
            }
        }
        return nuevoId;
    }
}
