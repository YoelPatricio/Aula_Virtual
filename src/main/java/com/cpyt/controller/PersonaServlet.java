/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cpyt.controller;

import com.cpyt.dao.GenericDAO;
import com.cpyt.model.Persona;
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
            
        String url = "C:\\AulaVirtual_Files\\certificate";
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setRepository(new File(url));        
        
        ServletFileUpload upload = new ServletFileUpload(factory);
        
        HashMap<String,Object> campos = new HashMap();
        try {
            List<FileItem> partes = upload.parseRequest(request);
            
            for (FileItem items : partes) {
                
                if(!items.isFormField()){
                    File file = new File(url,items.getName());
                    items.write(file);
                    campos.put(items.getFieldName(), items.getName());
                }else{
                    campos.put(items.getFieldName(), items.getString());
                }
                
            }
            String accion = campos.get("accion").toString();
            
            
            GenericDAO g = new GenericDAO();
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
            
            if(accion.equals("add")){
                g.insert(p);
            }else{
                p.setIdPer(Integer.parseInt(campos.get("txtIdPer").toString()));
                g.update(p);
            }
            
            
            out.print("true");
            System.out.println("Funkoooo");
            
        } catch (Exception e) {
            out.print("false");
            System.out.println("Noooooooooo  :(" + e);
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
