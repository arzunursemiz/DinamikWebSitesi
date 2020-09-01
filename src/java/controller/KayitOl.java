package controller;
import common.Common;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Kullanici;
public class KayitOl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        Kullanici kullanici=new Kullanici();
        kullanici.ad_soyad=request.getParameter("ad_soyad");
        kullanici.sifre=request.getParameter("sifre");
        kullanici.kullanici_adi=request.getParameter("kullanici_adi");
        kullanici.rol=request.getParameter("rol").toLowerCase();
        RequestDispatcher dispatcher;
        if(Common.connection.kayitOl(kullanici)){
            Common.mesajGoster(response.getWriter(), "Kayıt Başarılı", true);
            dispatcher=request.getRequestDispatcher("girisyap.jsp");
        }else{
            Common.mesajGoster(response.getWriter(), "Kayıt Başarısız", false);
            dispatcher=request.getRequestDispatcher("kayitol.jsp");
        }
        dispatcher.include(request, response);
    }
}

