<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Çıkış İşlemi</title>
    </head>
    <body>
        <%
            session.invalidate(); //Session sayfalar arası ortak alan
            PrintWriter printer=response.getWriter();
            printer.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            printer.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            printer.println("<script>");
            printer.println("$(document).ready(function(){");
            printer.println("swal('Çıkış işlemi yapıldı','','success')");
            RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
            printer.println("});");
            printer.println("</script>");
            dispatcher.include(request, response);
        %>
    </body>
</html>
