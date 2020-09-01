package controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import common.Common;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import model.Blog;

@MultipartConfig
public class BlogKaydet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = null;
        try {
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            Blog blog = new Blog();
            blog.baslik = request.getParameter("baslik");
            blog.ozet = request.getParameter("ozet");
            blog.icerik = request.getParameter("icerik");
            blog.kategori = request.getParameter("kategori").toLowerCase();
            Part part=request.getPart("file");
            String fileName = getSubmittedFileName(part);
            int kullanici_id = -1;
            File folder = new File("C:/Users/Arzu YAR/Desktop/StajUygulamasi/web/images/image");
            File file =new File(folder,fileName);
            part.write(file.getAbsolutePath());
            blog.resimYolu = file.getAbsolutePath();
            int index=blog.resimYolu.indexOf("images");
            blog.resimYolu=blog.resimYolu.substring(index,blog.resimYolu.length());
            kullanici_id = (int) request.getSession().getAttribute("kullanici_id");
            if (Common.connection.blogYazisiOlustur(blog, kullanici_id)) {
                Common.mesajGoster(response.getWriter(), "İşlem Başarılı", true);
                dispatcher = request.getRequestDispatcher("panel.jsp");
            } else {
                Common.mesajGoster(response.getWriter(), "İşlem Başarısız Tekrar Deneyin.", false);
                dispatcher = request.getRequestDispatcher("panel.jsp");
            }
        } catch (Exception e) {
            Common.mesajGoster(response.getWriter(), e.getLocalizedMessage(), false);
            dispatcher = request.getRequestDispatcher("panel.jsp");
        }
        if (dispatcher != null) {
            dispatcher.include(request, response);
        }
    }
    private static String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }
}
