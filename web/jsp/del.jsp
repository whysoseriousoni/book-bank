<%-- 
    Document   : del
    Created on : Feb 22, 2020, 8:17:14 PM
    Author     : WhysoseriousONI
--%>

<%@page contentType="text/html" language="java" import="java.io.*,java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Return Book</title>
        <%
            String email=request.getParameter("mail");
            ArrayList<String> arr = new ArrayList<String>();
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:postgresql://ec2-3-215-207-12.compute-1.amazonaws.com/d1asg36jccevbc?user=gmixkyznbqavld&password=6637fb77025d05636e58c31f7ac781bd22cd3d20b7c38e8acf3896d0d3649883&ssl=true);
                String sql = "select * from order_list where email=? ";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, request.getParameter("mail"));
                ResultSet rs = ps.executeQuery();;
                while (rs.next()) {
                    arr.add(rs.getString("book"));
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </head>
    <body>
        <h1><b>
            <%
                out.println("<table>");
                out.println("<tr>");
                out.println("<h1><th>BookName");
                out.println("</tr>");
                for (int i = 0; i < arr.size(); i++) {%>
            <% out.println("<td>");%>
            <%=arr.get(i) %>
            <a href="http://localhost:8080/book_bank/jsp/returnform.jsp?book=<%=arr.get(i)%>&mail=<%= email%>"> Return </a>
            <% out.println("</td>"); %>
            <%out.println("</tr>"); %>
            <% } %>
            <% out.println("<br>");%>
            <% out.println("</table>");%>
            </b></h1>
    </body>
</html>
