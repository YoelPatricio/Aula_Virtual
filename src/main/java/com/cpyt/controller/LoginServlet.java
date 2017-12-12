/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cpyt.controller;

import com.cpyt.dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Yoel
 */
public class LoginServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
       String user = request.getParameter("user");
       String pass = request.getParameter("pass");
       String accion = request.getParameter("accion");
       if("destroy".equals(accion)){
           session.invalidate();
           //response.sendRedirect("login.jsp");
           //request.getRequestDispatcher("login.jsp").forward(request, response);
           return;
       }
       
        UsuarioDAO ud = new UsuarioDAO();
        List<Object> u = ud.getUserInSession(user, pass);
        if(u.size()!=0){
             Object  a [] = (Object[]) u.get(0);
             int rol = (int) a[0];
             String nombres = a[1].toString();
             String paterno = a[2].toString();
             String materno = a[3].toString();
             String idPer = a[4].toString();
            
            session.setAttribute("rol", rol);
            session.setAttribute("nombres", nombres);
            session.setAttribute("paterno", paterno);
            session.setAttribute("materno", materno);
            session.setAttribute("idPer", idPer);
            //request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            response.sendRedirect("dashboard.jsp");
            //out.print("true");
        }else{
            response.sendRedirect("login.jsp");
            //out.print("true");
            //request.getRequestDispatcher("/login.jsp").include(request, response);
        }
        //response.sendRedirect("dashboard.jsp");
        
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
