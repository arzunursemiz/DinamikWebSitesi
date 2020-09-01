<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header id="header" class="hoc clear"> 
      <!-- ################################################################################################ -->
     		<img src="images/demo/asoslogo.png" width="250" height="300">
		<div id="logo" class="fl_left">
      </div>
      <nav id="mainav" class="fl_right">
        <ul class="clear">
            <li class="active"><a href="index.jsp">ANASAYFA</a></li>
            <%
                String rol=(String)session.getAttribute("kullanici_rol");
                if(rol!=null && rol.equals("editor")){
            %>
                <li class="active"><a href="panel.jsp">BLOG YAZ</a></li>
                <li class="active"><a href="blog_yazi_incele_liste.jsp">BLOG INCELE</a></li>
            <%
                }
            %>
            <li class="active"><a href="sifre_degistir.jsp">ŞİFRE DEĞİŞ</a></li>    
            <li class="active"><a href="cikis.jsp">ÇIKIŞ</a></li>
        </ul>    
      </nav>
      <!-- ################################################################################################ -->
    </header>
