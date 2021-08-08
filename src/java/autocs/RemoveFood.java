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
import javax.servlet.http.Cookie;


/**
 *
 * @author kkkkkk
 */
public class RemoveFood extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8;application/json");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
         String s3=request.getParameter("fid");
         String s4=request.getParameter("qty"); 
         
         if(s3!=null&&s4!=null)
         {
         int itemnum2=Integer.parseInt(s3);
         String s5=("update addcart set quantity='" + s4 +"' where fid=" + itemnum2 + "");
         Integer a=conn.insertUpdateFromSqlQuery(s5); 
         String json = new Gson().toJson(a);
         response.getWriter().write(json);
         
         }
            
            
        int delid=0;int itemnum=0; String s1=request.getParameter("food_id");
        if(s1!=null){itemnum=Integer.parseInt(request.getParameter("food_id"));
        ResultSet rst=null; rst=conn.getResultFromSqlQuery("select * from addcart where fid='"+itemnum+"'");
        if(rst.next())
        {out.println("<script type=\"text/javascript\">");
         out.println("alert('This product is already in your cart, if you want to more, increase the quantity');");
         out.println("location='addcart.jsp';");
         out.println("</script>");
        }
        else
        {
          //  String query = ("insert into addcart(fid) values('"+itemnum+"')");
            Cookie ck[]=request.getCookies();
             for(int i=0;i<ck.length;i++)
             {
                 ResultSet rs1=conn.getResultFromSqlQuery("select * from visitorslogin where email='" + ck[i].getValue() + "'");
            
                  if(rs1.next())
                  {
                      String query = ("insert into addcart(fid,custemail) values('"+itemnum+"','"+ck[i].getValue()+"')");
                       conn.insertUpdateFromSqlQuery(query);
                       
                  }
             }
           
            out.println("<script type=\"text/javascript\">");
            out.println("location='addcart.jsp';");
            out.println("</script>");
        }}  
        String s2=request.getParameter("id");
        if(s2!=null){delid=Integer.parseInt(request.getParameter("id"));
        String query2=("delete from addcart where fid='" + delid + "'");  
        conn.insertUpdateFromSqlQuery(query2);}  
        }               
        catch(Exception e){}
            
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
