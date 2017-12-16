/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cpyt.controller;

import com.cpyt.dao.GenericDAO;
import com.cpyt.dao.TarjetaDAO;
import com.cpyt.model.Curso;
import com.cpyt.model.Inscripcion;
import com.cpyt.model.Persona;
import com.cpyt.model.Tarjeta;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Yoel
 */
public class InscripcionServlet extends HttpServlet {

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
        
        try {
            
            String idPer = request.getParameter("idPer");
            String idCur = request.getParameter("idCur");
            String tarjeta = request.getParameter("tarjeta");
            String fv = request.getParameter("fv");
            String ccv = request.getParameter("ccv");
            BigDecimal precio = new BigDecimal(request.getParameter("precio").toString());
            
            TarjetaDAO td = new TarjetaDAO();
            
            List<Tarjeta> t = td.getTarjeta(tarjeta, fv, ccv);
            if(t.size()==0){
                out.print("false");
                return;
            }
            
            BigDecimal saldo = t.get(0).getSaldo();
            Integer idTar = t.get(0).getIdTar();
            
            //Integer saldo2=Integer.parseInt(saldo.toString());
            //Integer precio2=Integer.parseInt(precio.toString());
            //if(saldo2<precio2){
            //    out.print("false");
            //    return;
            //}
            
            BigDecimal saldoActualizado = saldo.subtract(precio);
            
            
            
            GenericDAO g = new GenericDAO();
            Inscripcion i = new Inscripcion();
            
            Persona p = new Persona();
            p.setIdPer(Integer.parseInt(idPer));
            
            Curso c = new Curso();
            c.setIdCur(Integer.parseInt(idCur));
            
            i.setPersona(p);
            i.setCurso(c);
            i.setFecIns(new Date());
            i.setEstIns(0);
            
            g.insert(i);
            td.actualizarSaldo(saldoActualizado, idTar);
            
            
            
           
            out.print("true");
        } catch (Exception e) {
            out.print("false");
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
