<%-- 
    Document   : login page
    Created on : Feb 22, 2020, 1:22:18 AM
    Author     : WhysoseriousONI
--%>

<%@page import="javafx.scene.control.Alert"%>
<%@page import="sun.font.Script"%>
<%@page contentType="text/html" language="java" import="java.util.*,java.io.*,java.sql.*;" %>
<%
    Cookie mailar[] = request.getCookies();
    for (int i = 0; i < mailar.length; i++) {
        out.println(mailar[i].getComment());
    }
    try {
        String mai = request.getParameter("mail");
        String pass = request.getParameter("pswd");
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/asd", "root", "");
        String sql = "select * from user where email=? and pass=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, mai);
        ps.setString(2, pass);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            response.sendRedirect("http://localhost:8080/book_bank/home.html");
        } else {
            out.println("Please Register YourSelf By Clicking Here"); %>
<html>
    <body>
        <h1>
            <a  href = "http://localhost:8080/book_bank/register.html" > Register </a> 
        </h1>
    </body>
</html>
<%}
    } catch (Exception e) {
        out.println(e);
    }
%>


