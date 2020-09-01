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
<div class="bgded overlay" style="background-image:url('images/demo/backgrounds/slider1.jpg');"> 
  <div class="wrapper row1">
     <%@include file="ust_menu.jsp" %>
  </div>
</div>
<div class="wrapper row3">
<main class="hoc container clear">
  <div class="group">
    <div class="first">
      <h6 class="heading font-x3"><a href="kayitol.jsp">Kayıt Ol &raquo;</a></h6>
      <br>
      <h6 class="heading font-x3"><a href="girisyap.jsp">Giriş Yap &raquo;</a></h6>
    </div>
    <div class="two_half"><a href="#"> <a href="#"></a></div>
  </div>
  <div class="clear"></div>
</main>
</div>
<div class="wrapper row2"> </div>
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