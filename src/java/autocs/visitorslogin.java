/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package autocs;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.lang.*;
import javax.servlet.http.Cookie;


public class visitorslogin extends HttpServlet {

    
            protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            try{
             String email1=request.getParameter("email1");
             String password1=request.getParameter("password1");
             Cookie ck=new Cookie("email1",email1);
              response.addCookie(ck);
             if(email1!=null && password1!=null){
             ResultSet rs2=conn.getResultFromSqlQuery("select * from visitorslogin where email='" + email1 + "' and password='" + password1 + "'");
             if(rs2.next()){
             out.println("<script type=\"text/javascript\">");
             out.println("alert('welcome to Resturant automation system');");
             out.println("location='visitorshome.jsp';");
             out.println("</script>");}
             else{
             out.println("<script type=\"text/javascript\">");
             out.println("alert('incorrect password or username');");
             out.println("location='visitorslogin.jsp';");
             out.println("</script>");   
             }}
             
             String email=request.getParameter("email");
             String password=request.getParameter("password");
             ResultSet rs1=conn.getResultFromSqlQuery("select * from visitorslogin where email='" + email + "'");
             if(rs1.next()){
             out.println("<script type=\"text/javascript\">");
             out.println("alert('Email is already exist');");
             out.println("location='visitorslogin.jsp';");
             out.println("</script>");}
             else{
             conn.insertUpdateFromSqlQuery("insert into visitorslogin(email,password) values('"
							+ email + "','" + password + "')");
             out.println("<script type=\"text/javascript\">");
             out.println("alert('Sucessful, Please log in');");
             out.println("location='visitorslogin.jsp';");
             out.println("</script>");
        }}
   catch(Exception ee){}
    }
}
    
