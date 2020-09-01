<%@page import="java.util.List"%>
<%@page import="common.Common" %>
<%@page import="model.Blog"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>AsosBlog</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<%
    String kategori=request.getParameter("kategori");
    String baslik;
    if(kategori.equals("guncel"))
        baslik = "Güncel";
    else if(kategori.equals("muhendislik"))
        baslik = "Mühendislik";
    else
        baslik = "Akademik";
%>
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
  <!-- ################################################################################################ -->
</div>
<!-- End Top Background Image Wrapper -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
<div class="wrapper row2">						 
  <div class="hoc container clear"> 
    <div class="sectiontitle center">
	<h2 class="heading"><%=baslik%></h2>
    </div>
    <%
        List<Blog> blogs=Common.connection.blogListesiGetir(kategori);
        int size=(blogs!=null && !blogs.isEmpty())?blogs.size():0;
        for (int i = 0; i < size; i++) {
            Blog blog=blogs.get(i);
    %>
    <%
        if(i%3==0){
    %>
        <article class="one_third first">
    <%
        }else{
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
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

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
