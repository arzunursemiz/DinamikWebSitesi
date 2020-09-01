<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<div class="wrapper row2">						 
  <div class="hoc container clear"> 
      <div>
        <h3 class="heading">Şifre Değiştir</h3>
        <br>
        <br>
        <form action="SifreDegistir" method="POST">
            <label>Şifre</label>
            <input type="password" required="" name="sifre" style="width: 100%;height: 30px"/><br>
            <label>Yeni Şifre</label>
            <input type="password" required="" name="yeni_sifre" style="width: 100%;height: 30px"/><br>
            <label>Yeni Şifre (Tekrar)</label>
            <input type="password" required="" name="yeni_sifre_tekrar" style="width: 100%;height: 30px"/><br>
            <ul style="display: inline-block;list-style: none;position: relative">
                <li style="display: inline-block;margin: 10px"><input class="btn" type="reset" value="Temizle" style="direction: rtl;"/></li>
                <li style="display: inline-block;margin: 10px"><input class="btn" type="submit" value="Değistir" style="direction: rtl;"/></li>
            </ul>
        </form>
      </div>
  </div>
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

