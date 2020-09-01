<%@page import="java.util.List"%>
<%@page import="model.Blog"%>
<%@page import="common.Common" %>
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
  <!-- ################################################################################################ -->
</div>
<!-- End Top Background Image Wrapper -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
<main class="hoc container clear fa-align-center">
  <!-- main body -->
  <!-- ################################################################################################ -->
  <div class="group fa-align-center">
    <div class="one_half first">
      <h5 class="heading font-x3">Giriş Yap</h5>
        <form action="GirisYap" method="post" >
            <input type="text" name="kullanici_adi" placeholder="Kullanıcı Adı" required=""><br>
            <input type="password" name="sifre" placeholder="Şifre" required=""><br>
          Görevinizi Seçin:
          <select name="rol" class="center">
            <option>Yazar</option>
            <option>Editor</option>
          </select>
          <br>
          <br>
          <input type="submit" name="girisYap" value="Giriş">
        </form>
      </h6>
    </div>
    <div class="one_half"><a href="#"></a></div>
  </div>
  <!-- ################################################################################################ -->
  <!-- / main body -->
  <div class="clear"></div>
</main>
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