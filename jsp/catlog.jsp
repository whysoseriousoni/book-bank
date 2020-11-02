<%-- 
    Document   : caloge
    Created on : Feb 22, 2020, 7:47:53 PM
    Author     : WhysoseriousONI
--%>

<%@page language="java" contentType="text/html" import="java.io.*,java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../css/newcss.css">
        <%
            ArrayList<String> arr = new ArrayList<String>();
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/asd", "root", "");
                String sql = "select * from book";
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    String temp = rs.getString("author") + " " + rs.getString("name") + " " + rs.getString("price") + " " + rs.getString("quantity");
                    arr.add(temp);
                }

            } catch (Exception e) {
                out.println(e);
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Available books</title>
    </head>
    <body>
        <%
            out.println("<table>");
            out.println("<tr>");
            out.println("<h1><th>Author<th>BookName<th>Price<th>Quantity<th>buy</h1>");
            out.println("</tr>");
            for (int i = 0; i < arr.size(); i++) {
                String temp = arr.get(i);
                String asd[] = temp.split(" ");
                out.println("<td>" + asd[0] + "<td>" + asd[1] + "<td>" + asd[2] + "<td>" + asd[3]);
        %>
        <%
            int qu = Integer.parseInt(asd[3]);
            if (qu != 0) {
        %>
        <%out.println("<td>");%><a href="http://localhost:8080/book_bank/jsp/conform.jsp?book=<%=asd[1]%>&price=<%=asd[2]%>&qua=<%=asd[3]%>"> BUY </a>
        <%out.println("</td>"); %>
        <%out.println("</tr>"); %>
        <% out.println("<br>"); %>
        <% } %>
        <% if (qu == 0) { %>
        <%out.println("</td>"); %>
        <%out.println("</tr>"); %>
        <% out.println("<br>"); %>
        <%   } %>
        <%}
            out.println("</tr>");
            out.println("</table>");
        %>

    </body>   
</html>
