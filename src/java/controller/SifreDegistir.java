package controller;

import common.Sha1;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import common.Common;
public class SifreDegistir extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String sifre=request.getParameter("sifre");
        String yeni_sifre=request.getParameter("yeni_sifre");
        String yeni_sifre_tekrar=request.getParameter("yeni_sifre_tekrar");
        if(yeni_sifre.equals(yeni_sifre_tekrar)){
            HttpSession session=request.getSession();
            String kullanici_sifre=(String)session.getAttribute("kullanici_sifre");
            String sifreSha1=Sha1.toSHA1(sifre);
            if(kullanici_sifre!=null && sifreSha1!=null && kullanici_sifre.equals(sifreSha1)){
                if(Common.connection.sifreDegis(session.getAttribute("kullanici_id").toString(), yeni_sifre)){
                    Common.mesajGoster(response.getWriter(), "İşlem başarılı", true);
                     request.getRequestDispatcher("panel.jsp").include(request, response);
                }else{
                    Common.mesajGoster(response.getWriter(), "İşlem başarısız!!", false);
                    request.getRequestDispatcher("sifre_degistir.jsp").include(request, response);
                }
            }else{
                Common.mesajGoster(response.getWriter(), "Şuan ki şifreyi yalnış girdiniz lütfen tekrar deneyin.", false);
                request.getRequestDispatcher("sifre_degistir.jsp").include(request, response);
            }
        }else{
            Common.mesajGoster(response.getWriter(), "Yeni şifre-Yeni şifre(Tekrar) aynı değil. Lütfen tekrar deneyin.", false);
            request.getRequestDispatcher("sifre_degistir.jsp").include(request, response);
        }
        
    }
}