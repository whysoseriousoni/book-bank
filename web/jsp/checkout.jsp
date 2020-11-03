<%-- 
    Document   : checkout
    Created on : Feb 25, 2020, 6:52:57 PM
    Author     : whysoseriousoni
--%>

<%@page contentType="text/html" language="java" import="java.util.*,java.io.*,java.sql.*"  pageEncoding="UTF-8"%>
<%
        String book = request.getParameter("book");
        String price = request.getParameter("price");
        String qua = request.getParameter("quantity");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:postgresql://ec2-3-215-207-12.compute-1.amazonaws.com/d1asg36jccevbc?user=gmixkyznbqavld&password=6637fb77025d05636e58c31f7ac781bd22cd3d20b7c38e8acf3896d0d3649883&ssl=true);
        String email=request.getParameter("email");
        String  check="select * from user where email=? and pass=?";
        PreparedStatement ps =conn.prepareStatement(check);
        ps.setString(1, email);
        ps.setString(2,request.getParameter("pswd"));
        ResultSet rs=ps.executeQuery();
        if(rs.next())
        {            
            String ccard=request.getParameter("ccard");
            String cvv=request.getParameter("cvv");
            String expd=request.getParameter("exp");
            String sql="insert into order_list (email,book,ccard,cvv,exp,price) values (?,?,?,?,?,?)";
            PreparedStatement psp=conn.prepareStatement(sql);
            psp.setString(1,email );
            psp.setString(2,book);
            psp.setString(3,ccard);
            psp.setString(4,cvv );
            psp.setString(5,expd );
            psp.setString(6, price);
            psp.executeUpdate();
            String bookUpd="update book set quantity=? where name=? and price=?";
            String num=Integer.toString(Integer.parseInt(qua)-1);
            PreparedStatement bk=conn.prepareStatement(bookUpd);
            bk.setString(1,num);
            bk.setString(2,book);
            bk.setString(3,price);
            bk.executeUpdate();
            out.println("thank you for buying "+book+" book");
            response.sendRedirect("http://localhost:8080/book_bank/home.html");
        }
        else
        {
            out.println("please check email and password");
        }
    } catch (Exception e) {
        out.print(e);
    }

%>
