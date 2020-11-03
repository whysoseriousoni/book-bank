<%-- 
    Document   : returnform
    Created on : Feb 27, 2020, 12:55:43 PM
    Author     : whysoseriousoni
--%>

<%@page import="java.net.ConnectException"%>
<%@page contentType="text/html" language="java" import="java.io.*,java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Return Book</title>
        <%
            String book=request.getParameter("book");
            String email=request.getParameter("mail");
            
            try
            {  
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:postgresql://ec2-3-215-207-12.compute-1.amazonaws.com/d1asg36jccevbc?user=gmixkyznbqavld&password=6637fb77025d05636e58c31f7ac781bd22cd3d20b7c38e8acf3896d0d3649883&ssl=true);
                String sql="delete from order_list where book=? and email=?";
                PreparedStatement ps=conn.prepareStatement(sql);
                ps.setString(1, book );
                ps.setString(2, email);
                ps.executeUpdate();
                String getQua="select quantity from book where name=?";
                PreparedStatement qs=conn.prepareStatement(getQua);
                qs.setString(1, book);
                ResultSet rs=qs.executeQuery();
                String qn="";
                while(rs.next())
                {
                    qn=rs.getString("quantity");
                }
                String upbl="update book set quantity=? where name=?";
                PreparedStatement psp=conn.prepareStatement(upbl);
                psp.setString(1,Integer.toString(Integer.parseInt(qn)+1));
                psp.setString(2, book);
                psp.executeUpdate();
            }
            catch(Exception e)
            {
                out.println(e);
            }


        %>   
        
    </head>
    <body> 
        <% out.println(email); %>
        <h1><b>Book Returned</b></h1>
        
    </body>
</html>
