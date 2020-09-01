<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header id="header" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <img src="images/demo/asoslogo.png" width="250" height="300"">
    <div id="logo" class="fl_left">
    </div>
    <nav id="mainav" class="fl_right">
        <ul class="clear">
            <li class="active"><a href="index.jsp">ANASAYFA</a></li>
            <li><a class="drop" href="#">Blog Yazıları</a>
                <ul>			 
                    <li><a href="blog_yazilari.jsp?kategori=guncel">Güncel</a></li>
                    <li><a href="blog_yazilari.jsp?kategori=muhendislik">Mühendislik</a></li>
                    <li><a href="blog_yazilari.jsp?kategori=akademik">Akademik</a></li>
                </ul>      
            <li><a class="drop" href="#">Ürünler</a>
                <ul>
                    <li><a href="https://atif.sobiad.com/">SOBİAD</a></li>
                    <li><a href="https://www.intihal.net/">İNTİHAL</a></li>
                    <li><a href="http://www.asosyayinlari.com/index.html">ASOS YAYINLARI</a></li>
                    <li><a href="https://www.asoscongress.com/">ASOS CONGRESS</a></li>
                    <li><a href="https://www.akademiktv.com/">AKADEMİK TV</a></li>
                    <li><a href="http://akademikiletisim.com/">AKADEMİK İLETİŞİM</a></li>
                    <li> <a href="#"> DOİ PLATFORMU</a></li>
                </ul>
            </li>
            <%
                Integer id = (Integer) session.getAttribute("kullanici_id");
                String ad_soyad = (String) session.getAttribute("kullanici_adi");
                if (id != null && ad_soyad != null) {
            %>    
                <li><a class="drop" href="#"><%=ad_soyad%></a>
                    <ul>
                        <li><a href="panel.jsp">KULLANICI PANELİ</a></li>
                        <li><a href="cikis.jsp">ÇIKIŞ</a></li>
                    </ul>
                </li>
            <%
                }
            %>   
        </ul>                 
    </nav>
</header>
