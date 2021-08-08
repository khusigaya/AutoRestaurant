/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package autocs;

import java.io.IOException;
import com.google.gson.*;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import java.sql.*;
import java.lang.*;

/**
 *
 * @author User
 */
public class Processing extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
         String s3=request.getParameter("fid");
         String s4=request.getParameter("cookid"); 
         String s6=request.getParameter("time"); String s10="yes";
  
         if(s3!=null&&s4!=null&&s6!=null)
         {
         int itemnum2=Integer.parseInt(s3); int s4a=Integer.parseInt(s4);int s6a=Integer.parseInt(s6);s6a=s6a*60;
         String s5=("update currentorder set cookid=" + s4a + ",processtime=" + s6a + ",process='" + s10 + "' where fid=" + itemnum2 + "");
         Integer a=conn.insertUpdateFromSqlQuery(s5); 
         String json = new Gson().toJson(a);
         response.getWriter().write(json);
         
         }
         
           String s1=request.getParameter("foodid");
           if(s1!=null)
           {
               int itemnum2=Integer.parseInt(s1);
               String s7=("update currentorder set delivered='yes' where fid=" + itemnum2 + "");
               Integer a=conn.insertUpdateFromSqlQuery(s7); 
               String json = new Gson().toJson(a);
               response.getWriter().write(json);
           }
           
           String s11=request.getParameter("foodidd");
           if(s11!=null)
           {
               int itemnum2=Integer.parseInt(s11);
               String s8=("update currentorder set served='yes' where fid=" + itemnum2 + "");
               Integer a=conn.insertUpdateFromSqlQuery(s8); 
               String json = new Gson().toJson(a);
               response.getWriter().write(json);
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
