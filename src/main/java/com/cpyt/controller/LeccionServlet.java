/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cpyt.controller;

import com.cpyt.dao.GenericDAO;
import com.cpyt.dao.LeccionDAO;
import com.cpyt.dao.PersonaDAO;
import com.cpyt.dao.SendMail;
import com.cpyt.model.Curso;
import com.cpyt.model.Lecciones;
import com.cpyt.model.Persona;
import com.cpyt.model.Rol;
import com.cpyt.model.Usuario;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author limati
 */
public class LeccionServlet extends HttpServlet {

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
            String idLec = request.getParameter("idLec");
            LeccionDAO ld = new LeccionDAO();
            try {
                 ld.deleteLeccion(idLec);
            out.print("true");
            } catch (Exception e) {
                out.print("false");
            }
           
        } else {

            

            String urlArchivo = "C:\\AulaVirtual_Files\\lessons\\file"; 
            String urlVideo = "C:\\AulaVirtual_Files\\lessons\\video"; 
            String url="";
            //String url2 = "C:\\Users\\limati\\Documents\\NetBeansProjects\\Aula_Virtual\\src\\main\\webapp\\certificate";
            
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setRepository(new File(urlArchivo));

            ServletFileUpload upload = new ServletFileUpload(factory);

            HashMap<String, Object> campos = new HashMap();
            try {
                List<FileItem> partes = upload.parseRequest(request);

                for (FileItem items : partes) {

                    if (!items.isFormField()) {
                        
                        if(items.getFieldName().equals("video")){
                            url=urlVideo;
                        }else{
                            url=urlArchivo;
                        }
                        File file = new File(url, items.getName());
                        
                        items.write(file);
                        
                        campos.put(items.getFieldName(), items.getName());
                    } else {
                        campos.put(items.getFieldName(), items.getString());
                    }

                }
                String accion = campos.get("accion").toString();
               

                
               
                Lecciones lec = new Lecciones();
                Curso cur=new Curso();
                cur.setIdCur(Integer.parseInt(campos.get("txtIdCur").toString()));
                
                lec.setCurso(cur);
                lec.setNomLec(campos.get("txtNombre").toString());
                lec.setVidLec(campos.get("video").toString());
                lec.setArcLec(campos.get("archivo").toString());

              
                

                if (accion.equals("add")) {
                    g.insert(lec);
                } else {
                    lec.setIdLec(Integer.parseInt(campos.get("txtIdLec").toString()));
                    g.update(lec);
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
