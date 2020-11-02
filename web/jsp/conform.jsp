<%-- 
    Document   : conform
    Created on : Feb 26, 2020, 2:01:09 PM
    Author     : whysoseriousoni
--%>

<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Out</title>
        <link rel="stylesheet" href="../css/newcss.css">
    </head>

    <body>
        <div>
            <h1> Please Verify Your Identity </h1>
        </div>
        <% 
            String book=request.getParameter("book");
            String price=request.getParameter("price");
            String quan=request.getParameter("qua");
        %>
           
        <form id="frm1" method="POST" action="checkout.jsp">
            Email:<input type="text" size="50px" style="font-size: 25px " name="email" value=""><br>
            Password:<input type="password" size="50px" style="font-size: 25px " name="pswd" value=""><br>
            Credit Card:<input type="number" style="font-size: 25px " name="ccard" value=""><br>
            CVV:<input type="password" name="cvv" style="font-size: 25px " size="50px" value=""><br>            
            Expiry Date:<input type="text" name="exp" style="font-size: 25px " size="50px" value=""><br>
            <input type="hidden" value="<%=book %>" name="book" ><br>
            <input type="hidden" value="<%=price %>" name="price" ><br>
            <input type="hidden" value="<%=quan %>" name="quantity" ><br>
            <input type="submit" value="submit" id="submitid" >

        </form>
    </body>
</html>

