<%-- 
    Document   : newjspregister
    Created on : Feb 22, 2020, 1:22:26 AM
    Author     : WhysoseriousONI
--%>

<%@page contentType="java" import="java.sql.*,java.io.*,java.util.*" pageEncoding="UTF-8"%>
<%
    try
    {
        String name=request.getParameter("nm1");
        String mai=request.getParameter("ea1");
        String pass=request.getParameter("ps1");
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/asd","root","");
        String sql="insert into user (name,email,pass) values (?,?,?)";
        PreparedStatement ps=conn.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, mai);
        ps.setString(3, pass);
        int s=ps.executeUpdate();
        out.println(s);
        if(s==1)
        {
            response.sendRedirect("http://localhost:8080/book_bank/login.html");
        }
        else
        {
            out.println("Error occured in registering");
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }


%>

