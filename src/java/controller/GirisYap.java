package controller;
import common.Common;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.GirisResponse;
import model.Kullanici;

public class GirisYap extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        Kullanici kullanici=new Kullanici();
        kullanici.kullanici_adi=request.getParameter("kullanici_adi");
        kullanici.sifre=request.getParameter("sifre");
        kullanici.rol=request.getParameter("rol").toLowerCase();
        RequestDispatcher dispatcher;
        GirisResponse gResponse=Common.connection.giris(kullanici);
        if(gResponse.isSuccess){
            HttpSession session=request.getSession();
            session.setAttribute("kullanici_id", gResponse.kullanici_id);
            session.setAttribute("kullanici_adi", gResponse.ad_soyad);
            session.setAttribute("kullanici_rol", kullanici.rol);
            Common.mesajGoster(response.getWriter(), "Giriş Başarılı", true);
            dispatcher=request.getRequestDispatcher("panel.jsp");
        }else{
            Common.mesajGoster(response.getWriter(), gResponse.message, false);
            dispatcher=request.getRequestDispatcher("girisyap.jsp");
        }
        dispatcher.include(request, response);
    }
}
