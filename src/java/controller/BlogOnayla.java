package controller;

import common.Common;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class BlogOnayla extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String id=request.getParameter("blog_id");
        RequestDispatcher dispatcher;
        if(Common.connection.blogTasi(id) && Common.connection.blogSil(id)){
            Common.mesajGoster(response.getWriter(), "İşlem Başarılı", true);
            dispatcher=request.getRequestDispatcher("blog_yazi_incele_liste.jsp");
        }else{
            Common.mesajGoster(response.getWriter(), "İşlem Başarısız", false);
            dispatcher=request.getRequestDispatcher("blog_yazi_incele.jsp");
        }
        dispatcher.include(request, response);
    }
}
