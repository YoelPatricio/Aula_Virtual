/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cpyt.controller;

import com.cpyt.dao.GenericDAO;
import com.cpyt.dao.PersonaDAO;
import com.cpyt.dao.SendMail;
import com.cpyt.model.Persona;
import com.cpyt.model.Rol;
import com.cpyt.model.Usuario;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Yoel
 */
public class PersonaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String accionDel = request.getParameter("accion");
        GenericDAO g = new GenericDAO();
        if ("delete".equals(accionDel)) {
            String idPer = request.getParameter("idPer");
            PersonaDAO pd = new PersonaDAO();
            try {
                 pd.deletePersona(idPer);
            out.print("true");
            } catch (Exception e) {
                out.print("false");
            }
           
        } else {

            

            String url = "C:\\AulaVirtual_Files\\certificate"; 
            String url2 = "C:\\Users\\limati\\Documents\\NetBeansProjects\\Aula_Virtual\\src\\main\\webapp\\certificate";
            
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setRepository(new File(url));

            ServletFileUpload upload = new ServletFileUpload(factory);

            HashMap<String, Object> campos = new HashMap();
            try {
                List<FileItem> partes = upload.parseRequest(request);

                for (FileItem items : partes) {

                    if (!items.isFormField()) {
                        File file = new File(url, items.getName());
                        File file2 = new File(url2, items.getName());
                        items.write(file);
                        items.write(file2);
                        campos.put(items.getFieldName(), items.getName());
                    } else {
                        campos.put(items.getFieldName(), items.getString());
                    }

                }
                String accion = campos.get("accion").toString();
                String tipo = campos.get("tipo").toString();

                
                Persona p = new Persona();

                p.setDni(campos.get("txtDNI").toString());
                p.setNombres(campos.get("txtNombres").toString());
                p.setApaterno(campos.get("txtPaterno").toString());
                p.setAmaterno(campos.get("txtMaterno").toString());
                p.setCorreo(campos.get("txtCorreo").toString());
                p.setCelular(campos.get("txtCelular").toString());
                p.setDireccion(campos.get("txtDireccion").toString());
                p.setCip(campos.get("txtCIP").toString());
                p.setImgCol(campos.get("imgDocente").toString());

                if (accion.equals("add")) {
                    g.insert(p);
                } else {
                    p.setIdPer(Integer.parseInt(campos.get("txtIdPer").toString()));
                    g.update(p);
                }

                //agregar en tabla usuario y enviar credenciales de acceso
                String usuario = campos.get("txtDNI").toString();
                String password = campos.get("txtDNI").toString();
                String destinatario = campos.get("txtCorreo").toString();

                if (tipo.equals("docente") && accion.equals("add")) {
                    SendMail sm = new SendMail();
                    Rol rol = new Rol();
                    rol.setIdRol(2);
                    Persona per = new Persona();
                    per.setIdPer(g.ultimoID("idPer", "Persona"));

                    Usuario usu = new Usuario();
                    usu.setPersona(per);
                    usu.setRol(rol);
                    usu.setLogUsu(usuario);
                    usu.setPasUsu(password);

                    g.insert(usu);
                    sm.enviarCredencialesAcceso(usuario, password, "Docente", destinatario);

                }

                out.print("true");
                System.out.println("Funkoooo");

            } catch (Exception e) {
                out.print("false");
                System.out.println("Noooooooooo  :(" + e);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
