package mysql;

import common.Sha1;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Blog;
import model.Kullanici;
import model.GirisResponse;

public class MysqlConnection {
    private Connection myCon;
    private final String url = "jdbc:mysql://localhost:3306";
    private final String user = "root";
    private final String password = "1292737";
    private final String TAG = MysqlConnection.class.getSimpleName();
 
    public MysqlConnection() {
        Connection();
    }

    private void Connection() {
        try {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(TAG).log(Level.SEVERE, null, ex);
            }
            myCon = DriverManager.getConnection(url, user, password);//Veri tabanı bağlantı kısmı
        } catch (SQLException e) {
            System.out.println(TAG + e.getMessage());
        }
    }

    public GirisResponse giris(Kullanici kullanici) {
        GirisResponse response=new GirisResponse();
        response.message="Giriş Başarısız!!!";
        response.isSuccess=false;
        try {
            PreparedStatement psmt = myCon.prepareStatement("select sifre,id,ad_soyad from asosblog.kullanicilar where kullanici_adi=? and rol=?");
            //PreparedStatement veri tabanı sorguları için kullanılan sınıf
            psmt.setString(1, kullanici.kullanici_adi);
            psmt.setString(2, kullanici.rol);
            //ResultSet veri tabanı sorgusu sonucunda dönen veri kümesini tutar
            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {
                String sifre = rs.getString("sifre");
                if (sifre.equals(Sha1.toSHA1(kullanici.sifre))) {
                    response.isSuccess=true;//işlemin başarılı olup olmadığını tutan değişken
                    response.message="Giriş Başarılı";
                    response.kullanici_id=rs.getInt("id");
                    response.ad_soyad=rs.getString("ad_soyad");
                    return response;
                }
            }
        } catch (Exception e) {
            System.out.println(TAG + e.getMessage());
            response.message=e.getLocalizedMessage();
            response.isSuccess=false;
            return response;
        }
        return response;
    }
    public boolean sifreDegis(String id,String sifre){
        try{
            String sha1Sifre=Sha1.toSHA1(sifre);
            if(sha1Sifre!=null){
                PreparedStatement psmt = myCon.prepareStatement("update asosblog.kullanicilar set sifre=? where id=?");
                psmt.setString(1, Sha1.toSHA1(sifre));
                psmt.setString(2, id);
                psmt.execute();
                return true;
            }else{
                return false;
            }
        }catch(SQLException e){
            return false;
        }
    }
    public boolean kayitOl(Kullanici kullanici) {
        try {
            if (!kullaniciKontrol(kullanici.kullanici_adi)) {
                PreparedStatement psmt = myCon.prepareStatement("insert into asosblog.kullanicilar (kullanici_adi,sifre,ad_soyad,role,son_giris,kayit_tarihi) values(?,?,?,?,now(),now())");
                psmt.setString(1, kullanici.kullanici_adi);
                psmt.setString(2, Sha1.toSHA1(kullanici.sifre));
                psmt.setString(3, kullanici.ad_soyad);
                psmt.setString(4, kullanici.rol);
                psmt.execute();
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println(TAG + e.getMessage());
            return false;
        }
    }

    private boolean kullaniciKontrol(String kullanici_adi) {
        try {
            PreparedStatement psmt = myCon.prepareStatement("select if(exists(select * from asosblog.kullanicilar where kullanici_adi=?),1,0) as sonuc");
            psmt.setString(1, kullanici_adi);
            ResultSet resultSet = psmt.executeQuery();
            if (resultSet != null && resultSet.next()) {
                if (resultSet.getBoolean("sonuc")) {
                    return true;
                }
            }
            return false;
        } catch (SQLException e) {
            System.out.println(TAG + e.getMessage());
            return true;
        }
    }

    public List<Blog> blogListesiGetir(String kategori) {
        List<Blog> blogListesi = new ArrayList<>();
        try {
            PreparedStatement psmt;
            if(kategori!=null){
                psmt= myCon.prepareStatement("select baslik,resim_yolu,kategori,ozet,icerik from asosblog.blog_yazilari where kategori=?");
                psmt.setString(1, kategori);
            }else{
                psmt= myCon.prepareStatement("select baslik,resim_yolu,kategori,ozet,icerik from asosblog.blog_yazilari order by guncelleme_tarihi desc limit 6");
            }
            ResultSet resultSet = psmt.executeQuery();
            if (resultSet != null) {
                while (resultSet.next()) {
                    Blog blogYazisi = new Blog();
                    blogYazisi.baslik = resultSet.getString("baslik");
                    blogYazisi.resimYolu = resultSet.getString("resim_yolu");
                    blogYazisi.kategori= resultSet.getString("kategori");
                    blogYazisi.ozet= resultSet.getString("ozet");
                    blogYazisi.icerik = resultSet.getString("icerik");
                    blogListesi.add(blogYazisi);
                }
            }
        } catch (SQLException e) {
            System.out.println(TAG + e.getMessage());
        }
        return blogListesi;
    }
    public List<Blog> blogListesiGetir(int limit) {
        List<Blog> blogListesi = new ArrayList<>();
        try {
            PreparedStatement psmt= myCon.prepareStatement("select baslik,resim_yolu,kategori,ozet,icerik from asosblog.blog_yazilari order by guncelleme_tarihi desc limit ?");
            psmt.setInt(1, limit);
            ResultSet resultSet = psmt.executeQuery();
            if (resultSet != null) {
                while (resultSet.next()) {
                    Blog blogYazisi = new Blog();
                    blogYazisi.baslik = resultSet.getString("baslik");
                    blogYazisi.resimYolu = resultSet.getString("resim_yolu");
                    blogYazisi.kategori= resultSet.getString("kategori");
                    blogYazisi.ozet= resultSet.getString("ozet");
                    blogYazisi.icerik = resultSet.getString("icerik");
                    blogListesi.add(blogYazisi);
                }
            }
        } catch (SQLException e) {
            System.out.println(TAG + e.getMessage());
        }
        return blogListesi;
    }
    public List<Blog> blogInceleListesiGetir() {
        List<Blog> blogListesi = new ArrayList<>();
        try {
            PreparedStatement psmt= myCon.prepareStatement("select id,baslik,resim_yolu,kategori,ozet,icerik from asosblog.inceleme_blog_yazilari");
            ResultSet resultSet = psmt.executeQuery();
            if (resultSet != null) {
                while (resultSet.next()) {
                    Blog blogYazisi = new Blog();
                    blogYazisi.id=resultSet.getInt("id");
                    blogYazisi.baslik = resultSet.getString("baslik");
                    blogYazisi.resimYolu = resultSet.getString("resim_yolu");
                    blogYazisi.kategori= resultSet.getString("kategori");
                    blogYazisi.ozet= resultSet.getString("ozet");
                    blogYazisi.icerik = resultSet.getString("icerik");
                    blogListesi.add(blogYazisi);
                }
            }
        } catch (SQLException e) {
            System.out.println(TAG + e.getMessage());
        }
        return blogListesi;
    }
    public boolean blogSil(String id) {
        try {
            PreparedStatement psmt= myCon.prepareStatement("delete from asosblog.inceleme_blog_yazilari where id=?");
            psmt.setString(1, id);
            psmt.execute();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }
    public boolean blogTasi(String id){
        try{
            PreparedStatement psmt=myCon.prepareStatement("insert into asosblog.blog_yazilari (kullanici_id,baslik,ozet,icerik,kategori,resim_yolu,guncelleme_tarihi) select kullanici_id,baslik,ozet,icerik,kategori,resim_yolu,guncelleme_tarihi FROM asosblog.inceleme_blog_yazilari WHERE id=?");
            psmt.setString(1, id);
            psmt.execute();
            return true;
        }catch(SQLException e){
            return false;
        }
    }
    public boolean blogYazisiOlustur(Blog blog,int kullanici_id){
        try{
            PreparedStatement psmt=myCon.prepareStatement("insert into asosblog.inceleme_blog_yazilari (kullanici_id,baslik,resim_yolu,ozet,icerik,kategori,guncelleme_tarihi) values(?,?,?,?,?,?,now())");
            psmt.setInt(1, kullanici_id);
            psmt.setString(2, blog.baslik);
            psmt.setString(3, blog.resimYolu);
            psmt.setString(4, blog.ozet);
            psmt.setString(5, blog.icerik);
            psmt.setString(6, blog.kategori);
            psmt.execute();
            return true;
        }catch(SQLException e){
            return false;
        }
    }
}