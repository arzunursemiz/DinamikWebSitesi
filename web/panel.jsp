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
        <h3 class="heading">Blog Yaz</h3>
        <br>
        <br>
        <form name="Form" action="BlogKaydet" method="POST" enctype="multipart/form-data">
            <label>Başlık(*)</label>
            <input type="text" required="" name="baslik" style="width: 100%;height: 30px"/><br>
            <label>Özet(*)</label>
            <input type="text" required="" name="ozet" style="width: 100%;height: 30px"/><br>
            <label>İçerik(*)</label>
            <textarea name="icerik" style="width: 100%;height: 300px" required=""></textarea><br>
            <select name="kategori">
                <option>Guncel</option>
                <option>Muhendislik</option>
                <option>Akademik</option>
            </select>
            <ul style="display: inline-block;list-style: none;position: relative">
                <li style="display: inline-block;margin: 10px"><input type="file" accept="image/*" name="file"   required="" value="Resim Yükle" style="direction: rtl;"/></li>
                <li style="display: inline-block;margin: 10px"><input class="btn" type="reset" value="Temizle" style="direction: rtl;"/></li>
                <li style="display: inline-block;margin: 10px"><input class="btn" type="submit" value="Kaydet" style="direction: rtl;"/></li>
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
