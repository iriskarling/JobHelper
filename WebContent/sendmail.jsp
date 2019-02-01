<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@page import="SendMail.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<!doctype html>
        <!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en-US"> <![endif]-->
        <!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en-US"> <![endif]-->
        <!--[if IE 8]>    <html class="lt-ie9" lang="en-US"> <![endif]-->
        <!--[if gt IE 8]><!--> <html lang="en-US"> <!--<![endif]-->
        <head>
                <!-- META TAGS -->
               
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
                <style type="text/css">
<!--

.STYLE1 {
	font-size: 36px;
	font-weight: bold;
	font-family: "Microsoft YaHei";
	color: #333333;
}


.STYLE2 {
	font-family: "方正等线";
	font-size: 18px;
}
.STYLE7 {
	font-family: "Microsoft YaHei UI";
	font-size: 16px;
}
-->
                </style>
                <title>Job Helper</title>

                <link rel="shortcut icon" href="images/favicon.png" />

                <!-- Style Sheet-->
                <link rel="stylesheet" href="carousel.css"/>
                <link rel="stylesheet" href="style.css"/>
                <link rel='stylesheet' id='bootstrap-css-css'  href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='responsive-css-css'  href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
               
                <link rel='stylesheet' id='main-css-css'  href='css/main5152.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='custom-css-css'  href='css/custom5152.html?ver=1.0' type='text/css' media='all' />
                


                <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
                <!--[if lt IE 9]>
                <script src="js/html5.js"></script>
                <![endif]-->

        </head>


<body>
<%
	try{
		request.setCharacterEncoding("utf-8");	
		response.setCharacterEncoding("utf-8");
	  String permission = (String) session.getAttribute("permission");
	  String StudentID = (String) session.getAttribute("Student");
	  String studentName = (String) session.getAttribute("Name");
	  String department= (String) session.getAttribute("Department");

	    	 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    	 String url="jdbc:sqlserver://localhost:1433;DatabaseName=JobHelper";

	    	 String user="sa";
	    	 String password="123456";
	    	 Connection conn=DriverManager.getConnection(url,user,password);
	    	 Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 		
	    	ResultSet rs;     	
	   
	    %>
                <!-- Start of Header -->
                <div class="header-wrapper">
                        <header>
                                <div class="container">


                                        
                                                <!-- Website Logo -->
                                                <a href="Home.jsp"  title="Job Helper">
                                                        
                                                </a>
                                                <br>
                                           <font size="6px">   <b>  Job Helper</b></font>
                                     


                                        <!-- Start of Main Navigation -->
                                      <nav class="main-nav">
                                                <div class="menu-top-menu-container">
                                                        <ul id="menu-top-menu" class="clearfix">
                                                      <li>Hello!&nbsp;<%=studentName %>&nbsp;[<%=StudentID %>]</li>
                                                      
                                                                <li class="current-menu-item"><a href="Home.jsp">主页</a></li>
                       
                                                                <li><a href="#">招聘信息</a>
                                                                        <ul class="sub-menu">
                                                                                <li><a href="PracticeJob.jsp">实习</a></li>
                                                                                <li><a href="Part_timeJob.jsp">兼职</a></li>
                                                                                <li><a href="Project.jsp">组队</a></li>
                                                                            
                                                                        </ul>
                                                                </li>
                                                                 </li>
                                                                <li><a href="#">消息栏</a>
                                                                        <ul class="sub-menu">
                                                                                 <li><a href="Talk.jsp">宣讲会</a></li>
                                                                                <li><a href="JobFair.jsp">招聘会</a></li>
                                                                              
                                                                        </ul>
                                                                </li>
                                                                         <li><a href="#">我要发布</a>
                                                                        <ul class="sub-menu">
                                               <%if (permission.equals("Assistant")){ 
                                                                                   %>
                                                                       <li> <a href="PractisePublish.jsp">实习</a></li>
                                                                        <li> <a id="link1" href="TalkPublish.jsp" >宣讲会</a></li>
                                                                                 <li> <a id="link2" href="JobFairPublish.jsp">招聘会</a></li>
                                                                       <% }%>
                                                                                <li><a href="Part_timeJobPublish.jsp">兼职</a></li>
                                                                                <li><a href="ProjectPublish.jsp">组队</a></li>
                                                                              

                                                                            
                                                                        </ul>
                                                               </li>
                                                               
                                                                                  <li><a href="#">我的信息</a>
                                                                          <ul class="sub-menu">
                                                                                <%if (permission.equals("Student")){ 
                                                                                   %>
                                                                                   <li><a href="MyCollect.jsp">我的收藏</a></li>
                                                                              
                                                                       <li><a href="MySend.jsp">我的投递</a></li>
                                                                                  <% }%>
                                                                               <li><a href="MyPublish.jsp">我的发布</a></li>
                                                                        </ul>
                                                                </li>
                                                                 <li><a href="LoginHTML.jsp">退出</a></li>

                                                        </ul>
                                                </div>
                                        </nav>
                                        <!-- End of Main Navigation -->

                                </div>
                        </header>
                </div>
                <!-- End of Header -->

                <!-- Start of Search Wrapper -->
      <div align="center">
				
						<img src="images/mail.jpg" />			
				<div class="clear"></div>
</div>
	<%
	String practiseID=request.getParameter("PractiseID");
   String mail=request.getParameter("email");
   String position="";
   rs=stmt.executeQuery("select Position from Practise where PractiseID ='"+practiseID+"'");
   while(rs.next()){
	   position=rs.getString(1);
   }
   rs.close();
   stmt.close();
   %>
   <p align="center" class="STYLE1">&nbsp;</p>
<p align="center" class="STYLE1">简历投递</p>
<p align="center" class="STYLE2">（注意将你的联系方式写在附件中，方便公司与你联系）</p>
  <div align="center">
  <form name="form1" method="post" action="SendMail2.jsp">
    <table width="400" height="400" border="0">
      <tr>
        <td width="100" ><span class="STYLE2">收件人：</span></td>
        <td width="300"><font face="Microsoft YaHei">
          <input type="text" name="to" value="<%=mail %>">
        </font></td>
      </tr>
     <tr>
        <td ><span class="STYLE2"></span></td>
        <td >
          <input type="hidden" name="practise" value="<%=practiseID %>">
        </td>
      </tr>
      <tr>
        <td width="100"><span class="STYLE2">主题：</span></td>
        <td ><font face="Microsoft YaHei">
          <input type="text" name="topic" value="<%=position %>职位应聘简历">
        </font></td>
      </tr>
      <tr>
        <td width="100" ><span class="STYLE2">上传附件</span></td>
        <td><font face="Microsoft YaHei">
          <input type="file" name="file">
        </font></td>
      </tr>
      <tr>
      <td COLSPAN=2 align="center"><input type="submit" name="Submit" style="width:100px;height:35px;font-family:'Microsoft YaHei';font-size:18px;" class="btn" value="发送邮件"></td>
      </tr>
      </table>
 </form>
  </div>
   
<p>&nbsp;</p>
<% 
conn.close();
stmt.close();
} catch (Exception e) {
	out.println(e.getMessage());
}
	%>  
<a href="#top" id="scroll-top"></a>

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