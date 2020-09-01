<%@page import="java.util.List"%>
<%@page import="model.Blog"%>
<%@page import="common.Common"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer id="footer" class="hoc clear"> 
    <div class="one_third first">
        <h6 class="heading">Asos Blog</h6>
        <nav>
            <ul class="nospace">
                <li><a href="index.jsp"><i class="fa fa-lg fa-home">ANASAYFA</i></a></li><br>
                <li><a href="guncel.jsp">Blog Yazıları</a></li><br>
                <li><a href="#">Ürünlerimiz</a></li><br>
                <li><a href="uyeliksistemi.jsp">ÜYELİK SİSTEMİ</a></li><br>
            </ul>
        </nav>
        <ul class="faico clear">
            <li><a class="faicon-facebook" href="#"><i class="fa fa-facebook"></i></a></li>
            <li><a class="faicon-twitter" href="#"><i class="fa fa-twitter"></i></a></li>
            <li><a class="faicon-dribble" href="#"><i class="fa fa-dribbble"></i></a></li>
            <li><a class="faicon-linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
            <li><a class="faicon-google-plus" href="#"><i class="fa fa-google-plus"></i></a></li>
            <li><a class="faicon-vk" href="#"><i class="fa fa-vk"></i></a></li>
        </ul>
    </div>
    <div class="one_third">
        <h6 class="heading">İletişim Bilgileri</h6>
        <ul class="nospace linklist contact">
            <li><i class="fa fa-map-marker"></i>
                <address>
                    &nbsp;Çaydaçıra Mah. Hacı Ali Efendi Sok. No:21/2 Elazığ/Merkez
                </address>
            </li>

            <li>0850 305 5523</li>
            <li>asos@asosegitim.com</li>
        </ul>
    </div>
    <div class="one_third">
        <h6 class="heading">Son Bloglar</h6>
        <ul class="nospace linklist">
            <%
                List<Blog> blog_yazilari = Common.connection.blogListesiGetir(2);
                int boyut = (blog_yazilari != null && !blog_yazilari.isEmpty()) ? blog_yazilari.size() : 0;
                for (int i = 0; i < boyut; i++) {
                    Blog blog = blog_yazilari.get(i);
            %>
            <li>
                <article>
                    <form action="blog_icerik.jsp" method="post">
                        <h2 class="nospace font-x1"><input type="submit" style="background-color: transparent;border: none;color: #A95236;cursor: pointer" value="<%=blog.baslik%>"/></h2>
                        <p class="nospace"><%=blog.ozet%>[&hellip;]</p>
                        <input type="text" name="resim_yolu" style="display: none" value="<%=blog.resimYolu%>"/>
                        <input type="text" name="baslik" style="display: none" value="<%=blog.baslik%>"/>
                        <input type="text" name="icerik" style="display: none" value="<%=blog.icerik%>"/>
                        <input type="text" name="kategori" style="display: none" value="<%=blog.kategori%>"/>
                    </form>
                </article>
            </li>
            <%
                }
            %>
        </ul>
    </div>
</footer>
