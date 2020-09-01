<%@page import="java.util.List"%>
<%@page import="common.Common" %>
<%@page import="model.Blog"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    String kategori=request.getParameter("kategori");
    String baslik=request.getParameter("baslik");
    String icerik=request.getParameter("icerik");
    String resim_yolu=request.getParameter("resim_yolu");
    String blog_id=request.getParameter("blog_id");
    if(kategori!=null){
        if(kategori.equals("guncel"))
            kategori="Güncel";
        else if(kategori.equals("akademik"))
            kategori="Akademik";
        else
            kategori="Mühendislik";
    }
%>
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
    <%@include file="panel_ust_menu.jsp" %>
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
<main class="hoc container clear">
    <!-- main body -->
    <!-- ################################################################################################ -->
    <div class="content">
      <!-- ################################################################################################ -->
      <h1>İncelenecek <%=kategori%></h1>
      <h1><%=baslik%>&nbsp;</h1>
      <img class="imgr borderedbox inspace-5" src="<%=resim_yolu%>" alt="" style="width: 320px;height: 240px;">
      <p><%=icerik%></p>
      <p><br>
      <ul style="display: inline-block;list-style: none;position: relative">
          <li style="display: inline-block;margin: 10px">
              <a href="BlogSil?blog_id=<%=blog_id%>">Sil</a>
          </li>
          <li style="display: inline-block;margin: 10px">
              <a href="BlogOnayla?blog_id=<%=blog_id%>">Onayla</a>
          </li>
      </ul>    
      <div class="scrollable"> </div>
      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
<script src="layout/scripts/jquery.flexslider-min.js"></script>
</body>
</html>

