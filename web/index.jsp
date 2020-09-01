<%@page import="java.util.List"%>
<%@page import="model.Blog"%>
<%@page import="common.Common"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>AsosBlog</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
    </head>
    <body id="top">
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- Top Background Image Wrapper -->
        <div class="bgded overlay" style="background-image:url('images/demo/backgrounds/slider1.jpg');"> 
            <!-- ################################################################################################ -->
            <div class="wrapper row1">
                <%@include file="ust_menu.jsp" %>
                                </div>
                                <!-- ################################################################################################ -->
                                <!-- ################################################################################################ -->
                                <!-- ################################################################################################ -->
                                <div id="pageintro" class="hoc clear"> 
                                    <!-- ################################################################################################ -->
                                    <div class="flexslider basicslider">
                                        <ul class="slides clear">
                                            <li>
                                                <article>
                                                    <h3 class="heading font-x3">&nbsp; Asos Blog </h3>
                                                    <footer>
                                                        <ul class="nospace inline pushright">
                                                        </ul>
                                                    </footer>
                                                </article>

                                        </ul>
                                    </div>
                                    <!-- ################################################################################################ -->
                                </div>
                                <!-- ################################################################################################ -->
                                </div>
                                <!-- End Top Background Image Wrapper -->
                                <!-- ################################################################################################ -->
                                <!-- ################################################################################################ -->
                                <!-- ################################################################################################ -->
                                <div class="wrapper row3">
                                    <main class="hoc container clear"> 
                                        <!-- main body -->
                                        <!-- ################################################################################################ -->
                                        <div class="group">
                                            <div class="one_half first">
                                                <p class="font-xs">Asos Blog'a Hoş Geldiniz !</p>
                                                <h6 class="heading font-x3">Asos Güncel Blog Yazıları&nbsp; </h6>
                                                <p>Asos Eğitim Bilişim Danışmanlık şirketi temelini 2013 yılında 3 akademisyen tarafından atılmış olsa da ticarileşmesi 2016 yılının başında gerçekleştirilmiştir. Asos Eğitim Bilişim Yayıncılık olarak ünvanı tescil edilen firmamız bilişim, yayıncılık ve danışmanlık sektöründe hizmet vermektedir.</p>
                                                <p> Sobiad ve İntihal; şirketimizin en çok öne çıkan değerleridir. Bu iki ürün aracılığı ile bilişim sektöründe önemli bir yer edinen şirketimiz Türkiye'nin ilk yerli ve milli yazılımları ile sürekli medyanın ilgisini çekmiştir.</p>
                                                <footer><a href="hakkimizda.html">Hakkımızda &raquo;</a></footer>
                                            </div>

                                            <div class="two_half">
                                                <%
                                                    if (id == null || ad_soyad == null) {
                                                %>
                                                        <a href="uyeliksistemi.jsp"><img src="images/demo/uyeliksistemi.jpg" alt="">
                                                <%
                                                    }
                                                %>
                                                <a href="guncel.jsp"><img src="images/demo/blogyazisi.jpg" alt=""></a></div>																			    
                                        </div>
                                        <!-- ################################################################################################ -->
                                        <!-- / main body -->
                                        <div class="clear"></div>
                                    </main>
                                </div>
                                <!-- ################################################################################################ -->
                                <!-- ################################################################################################ -->
                                <!-- ################################################################################################ -->
                                <div class="wrapper row2">						 
                                    <div class="hoc container clear"> 
                                        <div class="sectiontitle center">
                                            <h2 class="heading">Güncel Bloglar</h2>
                                        </div>
                                        <!-- ################################################################################################ -->
                                        <%
                                            List<Blog> blogs = Common.connection.blogListesiGetir(null);
                                            int size = (blogs != null && !blogs.isEmpty()) ? blogs.size() : 0;
                                            for (int i = 0; i < size; i++) {
                                                Blog blog = blogs.get(i);
                                            if (i % 3 == 0) {
                                        %>
                                                <article class="one_third first">
                                            <%
                                            } else {
                                            %>
                                                <article class="one_third">
                                                <%
                                                    }
                                                %>
                                                <!-- ################################################################################################ -->
                                                    <form action="blog_icerik.jsp" method="post">
                                                        <img src="<%=blog.resimYolu%>"alt="" style="width: 320px;height: 240px;"/>
                                                         <br></br>
                                                         <h6 class="heading font-x1"><%=blog.baslik%></h6>
                                                         <p class="btmspace-30"><%=blog.ozet%>[&hellip;]</p>
                                                         <input type="text" name="resim_yolu" style="display: none" value="<%=blog.resimYolu%>"/>
                                                         <input type="text" name="baslik" style="display: none" value="<%=blog.baslik%>"/>
                                                         <input type="text" name="icerik" style="display: none" value="<%=blog.icerik%>"/>
                                                         <input type="text" name="kategori" style="display: none" value="<%=blog.kategori%>"/>
                                                         <footer class="btmspace-15"><input type="submit" style="background-color: transparent;border: none;color: #A95236;cursor: pointer" value="Detaylar"/></footer>
                                                    </form>
                                                </article>      
                                            <%
                                                }
                                            %>
                                            <!-- ################################################################################################ -->
                                    </div>
                                </div>

                                <div class="wrapper row2"> </div>
                                <!-- ################################################################################################ -->
                                <!-- ################################################################################################ -->
                                <!-- ################################################################################################ -->
                                <div class="wrapper row3"> </div>
                                <div class="bgded overlay" style="background-image:url('images/demo/backgrounds/altbanner.jpg');">
                                <%@include file="alt_bar.jsp" %>
                                </div>
                                <!-- ################################################################################################ -->
                                <!-- ################################################################################################ -->
                                <!-- ################################################################################################ -->

                                <!-- ################################################################################################ -->
                                <!-- ################################################################################################ -->
                                <!-- ################################################################################################ -->
                                <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
                                <!-- JAVASCRIPTS -->
                                <script src="layout/scripts/jquery.min.js"></script>
                                <script src="layout/scripts/jquery.backtotop.js"></script>
                                <script src="layout/scripts/jquery.mobilemenu.js"></script>
                                <script src="layout/scripts/jquery.flexslider-min.js"></script>
                                </body>
                         </html>
