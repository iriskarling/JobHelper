<%@ page language="java" import="java.util.*" contentType="text/html; charset=gb2312" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<!doctype html>
        <!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en-US"> <![endif]-->
        <!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en-US"> <![endif]-->
        <!--[if IE 8]>    <html class="lt-ie9" lang="en-US"> <![endif]-->
        <!--[if gt IE 8]><!--> <html lang="en-US"> <!--<![endif]-->
        <head>
                <!-- META TAGS -->
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
        <title>Job Helper</title>

                                          
              <style type="text/css">
<!--
.STYLE1 {
	font-size: 36px;
	font-weight: bold;
	font-family: "方正等线";
	color: #333333;
}
-->
              </style>                             
                                           

                <!-- Style Sheet-->
                <link rel="stylesheet" href="carousel.css"/>
                <link rel="stylesheet" href="style.css"/>
                <link rel='stylesheet' id='bootstrap-css-css'  href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='responsive-css-css'  href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
               
                <link rel='stylesheet' id='main-css-css'  href='css/main5152.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='custom-css-css'  href='css/custom5152.html?ver=1.0' type='text/css' media='all' />
               <script src="laydate/laydate.js"></script>
                <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
                <!--[if lt IE 9]>
                <script src="js/html5.js"></script></script>
                <![endif]-->

                <style type="text/css">
<!--
.STYLE2 {
	font-family: "方正等线";
	font-size: 18px;
}
.STYLE6 {
	font-family: "Microsoft YaHei UI";
	font-size: 16px;
}
-->
                </style>
        </head>

        <body>
 <% String Company=request.getParameter("company_name");
 String StudentID = (String) session.getAttribute("Student");
 String studentName = (String) session.getAttribute("Name");
                                   String PractiseID=request.getParameter("PractiseID");
                                   if(PractiseID==null||PractiseID.equals("id")){
                                	   PractiseID="id";
                                   }
                                         Company = new String(Company.getBytes("ISO8859-1"),"UTF-8");
	                                    String username = (String) session.getAttribute("Student");
	                                        String permission = (String) session.getAttribute("permission");
                                                       Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                          	    	 String url="jdbc:sqlserver://localhost:1433;DatabaseName=JobHelper";
                                          	    	 String user="sa";
                                          	    	 String password="123456";
                                          	    	 Connection conn=DriverManager.getConnection(url,user,password);
                                          	    	 Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 		
                                          	    	ResultSet rs;
                                          	    	request.setCharacterEncoding("utf-8");	
                                          	    	response.setCharacterEncoding("utf-8");

                                          	    	  
                                                       %>
                <!-- Start of Header -->
                <div class="header-wrapper">
                        <header>
                                <div class="container">


                                        <div class="logo-container">
                                               
                                                                  
                                           <font size="6px">   <b>  Job Helper</b></font>
                                               
                                        </div>


                                       
                                        
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


                <!-- Start of Page Container -->
                                           
 <p>&nbsp;</p>
<p>&nbsp;</p>
<p align="center" class="STYLE1">填写公司信息</p>
<p align="center"class="STYLE2">     &nbsp;&nbsp;&nbsp;*为必填信息</p>
<div align="center">
  <form name="form1" method="post" action="CompanyModify1.jsp">
  <table width="730" height="408" border="0">
    <tr>
      <td width="181"><span class="STYLE2">公司名称*</span></td>
      <td width="539"><input type="text" name="company" value="<%=Company%>"/></td>
    </tr>
    <tr>
      <td><span class="STYLE2"><br>
      <%
      rs=stmt.executeQuery("select LinkmanName,LinkmanEmail,LinkmanPhone,Description,CompanyID from Company where CompanyName='"+Company+"'");
      String col1="";
      String col2="";
      String col3="";
      
      String col4="";
      String col5="";
      while(rs.next())
      {
    	col1=rs.getString(1);
    	col2=rs.getString(2);
    	col3=rs.getString(3);

    	col4=rs.getString(4);
    	col5=rs.getString(5);
  	  
      }
      rs.close();
      %>
        联系人姓名
      </span></td>
      <td><br>
        <span class="STYLE2">
        <input type="text" name="name" value="<%=col1%>"/></span></td>
    </tr>
      <tr>
      <td><span class="STYLE2"> </span></td>
      <td><input type="hidden"name="CompanyID" value="<%=col5%>" /></td>
    </tr>
    <tr>
      <td><span class="STYLE2"> </span></td>
      <td><input type="hidden"name="PractiseID" value="<%=PractiseID%>" /></td>
    </tr>
    <tr>
      <td><span class="STYLE2">联系方式</span></td>
      <td><p class="STYLE2">联系邮箱<span class="STYLE2">
        <input type="text" name="email" value="<%=col2%>"/>
          </span><br>
        </p>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><span class="STYLE2">联系电话</span>
      <input type="text" name="phone" value="<%=col3%>"/></td>
    </tr>
    <tr>
      <td><span class="STYLE2">公司介绍 *</span></td>
      <td><textarea name="Description" cols="200" rows="6" style="resize: none;width: 600px;
height: 600px;
max-width: 380px;
max-height: 150px"><%=col4%></textarea></td>
    </tr>
  </table>
  <%

		stmt.close();
			conn.close();

	%>   
</div>
<p align="center">
   <input type="submit" name="Submit" style="width:100px;height:35px;font-family:'Microsoft YaHei';font-size:18px;" class="btn" value="修改" />
</p>
        </form>                
  

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