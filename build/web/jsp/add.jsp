<%-- 
    Document   : newjspReturn
    Created on : Feb 22, 2020, 7:48:52 PM
    Author     : WhysoseriousONI
--%>

<%@page contentType="text/html" import="java.util.*,java.io.*,java.sql.*" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../css/newcss.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Book</title>
        <%
            ArrayList<String> arr = new ArrayList<String>();
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/asd", "root", "");
                String sql = "select * from book";
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    String temp = rs.getString("author") + " " + rs.getString("name") + " " + rs.getString("price")+" "+rs.getString("quantity");
                    arr.add(temp);
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </head>
    <body>
        <%
            out.println("<table>");
            out.println("<tr>");
            out.println("<h1><th>Author<th>BookName<th>Price<th>quantity</h1>");
            out.println("</tr>");
            for (int i = 0; i < arr.size(); i++) {
                String temp = arr.get(i);
                String asd[] = temp.split(" ");
                out.println("<td>" + asd[0] + "<td>" + asd[1] + "<td>" + asd[2]+"<td>"+asd[3]);
        %>
        <%out.println("</td>"); %>
        <%out.println("</tr>"); %>
        <% out.println("<br>"); %>
        <%}
            out.println("</tr>");
            out.println("</table>");
        %>
        <h1><b><a href="http://localhost:8080/book_bank/jsp/catlog.jsp">Lend A Book By Clicking here</a></b></h1>
    </body>   
</html>
