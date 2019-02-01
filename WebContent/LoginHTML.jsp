<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import= "test.* "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
 <link rel="stylesheet" href="carousel.css"/>
                <link rel="stylesheet" href="style.css"/>
                <link rel='stylesheet' id='bootstrap-css-css'  href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='responsive-css-css'  href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
               
                <link rel='stylesheet' id='main-css-css'  href='css/main5152.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='custom-css-css'  href='css/custom5152.html?ver=1.0' type='text/css' media='all' />
<title>Login</title>
</head>
<body  background="images/login.jpg" width="100%" height="100%">

 <!--<div class="header-wrapper">
                        <header>
                                <div class="container">


                                        
                                               <!--   <p>
                                                  <!-- Website Logo 
                                                  <a href="#"  title="Job Helper">                                                  </a>
                                                  <br>
                                                       <font size="6px">   <b>  Job Helper</b></font></p>
   </div>
</div>-->
<form id="Form" name="MyForm" method="POST" action="login.jsp" >
  <div align="right">
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <table width="550" border="0">
    <tr>
    <td><p>&nbsp;&nbsp;</p></td>
    </tr>
    
      <tr>
        <td width="303" height="158">
          <p style="font-size: 17px; color:black">UserName： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="username" >
          </p>
          <br><p style="font-size: 17px; color:black">
            Password：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="password" name="password">
            </p>
          <br><p style="font-size: 17px; color:black">
       
            Identifying Code：
            <input type="text" name="cerCode"><br>
            <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img id="code" src="CerCodeRealize.jsp"><a href="LoginHTML.jsp?javascript:changeimg()" style="font-size: 17px; color:white">&nbsp;&nbsp;&nbsp;看不清，换一张 </a></p>
          <br><p style="font-size: 17px; color:black">
          
            Permission:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="radio" name="permission" value="Student" checked
					style="font-family:'Microsoft YaHei';font-size:20px; color:black">&nbsp;&nbsp;
            Student&nbsp;&nbsp;&nbsp;&nbsp;
            <input
					type="radio" name="permission" value="Assistant" 
					style="font-family:'Microsoft YaHei';font-size:20px; color:black">&nbsp;&nbsp;
          Assistant</p>
          <p> 
          <br>
		  <div align="center">
            <input type="submit"style="width:100px;height:35px;font-family:'Microsoft YaHei';font-size:18px;" class="btn" value="登录">
			</div>
          </p></td>
    </tr>
    </table>
  </div>
</form>


 <!-- script -->
                <script type='text/javascript' src='js/jquery-1.8.3.min.js'></script>
                <script type='text/javascript' src='js/jquery.easing.1.3.js'></script>
                <script type='text/javascript' src='js/prettyphoto/jquery.prettyPhoto.js'></script>
                <script type='text/javascript' src='js/jflickrfeed.js'></script>
				<script type='text/javascript' src='js/jquery.liveSearch.js'></script>
                <script type='text/javascript' src='js/jquery.form.js'></script>
                <script type='text/javascript' src='js/jquery.validate.min.js'></script>
                <script type='text/javascript' src='js/custom.js'></script>

        <div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>