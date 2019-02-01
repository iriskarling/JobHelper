<%@ page language="java" import="java.util.*" contentType="text/html; charset=gb2312" pageEncoding="gbk"%>
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
         <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style>
*{margin:0;padding:0;list-style:none;}
html{background-color:#E3E3E3; font-size:14px; color:#000; font-family:'微软雅黑'}
h2{line-height:30px; font-size:20px;}
a,a:hover{ text-decoration:none;}
pre{font-family:'微软雅黑'}
.box{width:970px; padding:10px 20px; background-color:#fff; margin:10px auto;}
.box a{padding-right:20px;}
.demo1,.demo2,.demo3,.demo4,.demo5,.demo6{margin:25px 0;}
h3{margin:10px 0;}
.layinput{height: 22px;line-height: 22px;width: 150px;margin: 0;}
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
	    	request.setCharacterEncoding("utf-8");	
	    	response.setCharacterEncoding("utf-8");
	    	
	    	
	    	
	    	
	   
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
				
						<img src="images/bg5.jpg" />
						
				
				<div class="clear"></div>
		</div>
		
			


                <!-- End of Search Wrapper -->
 
                <!-- Start of Page Container -->
                <div class="page-container">
                        <div class="container">
                                <div class="row">

                                        <!-- start of page content -->
                                        <div class="span8 page-content">

                                                <!-- Basic Home Page Template -->
                                                <div class="row separator">
                                                        <section class="span4 articles-list">
                                                                <font face="微软雅黑"size="5px">实习信息</font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="PracticeJob.jsp"><style="font-family:'微软雅黑';font-size:10px;">More</style></a> 
                                                               <br>
                                                                <%
                                                                rs = stmt.executeQuery("select Position,PublishTime,CompanyName,Collection,PractiseID from Practise where Department ='"+department+"'");
                                                                 	for (int i=0;i<5;i++){
                                                                 		      rs.next();
					                                                          String col1 = rs.getString(1);
					                                                          String col2= rs.getString(2);
					                                                          String col3 = rs.getString(3);
					                                                          String col4 = rs.getString(4);
					                                                          String id=rs.getString(5);
				                                                                      %>
                                                                <ul class="articles">
                                                                        <li class="article-entry standard">
                                                                                <h4><a href="PracticeJobEach.jsp?PractiseID=<%=id%>"><%=col1 %></a></h4>
                                                                                <span class="article-meta"><%=col2%> &nbsp;&nbsp;<%=col3%></span>
                                                                                <span class="like-count"><%=col4 %></span>
                                                                        </li>
                                                                       
                                                                </ul>
                                                             <%
                                                             }
                                                             rs.close();%>   
                                                        </section>


                                                        <section class="span4 articles-list">
                                                               <font face="微软雅黑"size="5px">兼职信息</font>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<a href="Part_timeJob.jsp"><style="font-family:'微软雅黑';font-size:10px;">More</style></a> 
                                                                <br>
                                                                 <%
                                                                rs = stmt.executeQuery("select Title,PublishTime,District,Collection,Part_timeJobID from Part_timeJob where Department='"+department+"'");
                                                                 for (int i=0;i<5;i++){
                                                                	        rs.next();
					                                                          String col1 = rs.getString(1);
					                                                          String col2= rs.getString(2);
					                                                          String col3 = rs.getString(3);
					                                                          String col4 = rs.getString(4);
					                                                          String id=rs.getString(5);
				                                                                      %>
                                                                <ul class="articles">
                                                                        <li class="article-entry standard">
                                                                                <h4><a href="Part_timeJobEach.jsp?Part_timeJobID=<%=id%>"><%=col1 %></a></h4>
                                                                                <span class="article-meta"><%=col2 %> &nbsp;&nbsp;<%=col3 %></span>
                                                                                <span class="like-count"><%=col4 %></span>
                                                                        </li>
                                                                        
                                                                </ul>
                                                                <%
                                                             }
                                                             rs.close();%>  
                                                        </section>
                                                </div>
                                        </div>
                                        <!-- end of page content -->


                                        <!-- start of sidebar -->
                                        <aside class="span4 page-sidebar">

                                               <section class="span4 articles-list">
                                                                <font face="微软雅黑"size="5px">项目组队</font>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<a href="Project.jsp"><style="font-family:'微软雅黑';font-size:10px;">More</style></a> 
                                                                <br>
                                                                 <%
                                                                rs = stmt.executeQuery("select Title,PublishTime,Type,Collection,ProjectID from Project where Department ='"+department+"'");
                                                                for (int i=0;i<5;i++){
                                                            	  // while(rs.next()){
                                                         	        rs.next();
					                                                          String col1 = rs.getString(1);
					                                                          String col2= rs.getString(2);
					                                                          String col3 = rs.getString(3);
					                                                          String col4 = rs.getString(4);
					                                                          String id=rs.getString(5);
					                                                         
				                                                                      %>
                                                                <ul class="articles">
                                                                        <li class="article-entry standard">
                                                                                <h4><a href="ProjectEach.jsp?ProjectID=<%=id%>"><%=col1 %></a></h4>
                                                                                <span class="article-meta"><%=col2%>&nbsp;&nbsp;<%=col3
                                                                                %></span>
                                                                                <span class="like-count"><%=col4 %></span>
                                                                        </li>
                                                                       
                                                                </ul>
                                                                    <%
                                                             }
                                                             rs.close();%>  
                                                        </section>
                                        <!-- end of sidebar -->
                                </div>
                        </div>
                </div>
                <!-- End of Page Container -->

              <%

		stmt.close();
			conn.close();
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