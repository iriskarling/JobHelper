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
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
        <title>Job Helper</title>

                                          
                                           
                                           

                <!-- Style Sheet-->
                <link rel="stylesheet" href="carousel.css"/>
                <link rel="stylesheet" href="style.css"/>
                <link rel='stylesheet' id='bootstrap-css-css'  href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='responsive-css-css'  href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
               
                <link rel='stylesheet' id='main-css-css'  href='css/main5152.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='custom-css-css'  href='css/custom5152.html?ver=1.0' type='text/css' media='all' />

                <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
                <!--[if lt IE 9]>
                <script src="js/html5.js"></script></script>
                <![endif]-->

                <style type="text/css">
<!--
.STYLE1 {
	font-family: "Microsoft YaHei UI";
	font-size: 18px;
	color: #666666;
}
-->
                </style>
        </head>

        <body>
 <% try{
	 String StudentID = (String) session.getAttribute("Student");
	 String studentName = (String) session.getAttribute("Name");
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


              
                                                
                                                  <table align="center" width="600"  border="0">
                                                <%if (permission.equals("Assistant")){ 
                                                                                   %>
                                                 <tr><td COLSPAN=6 align="center"><p><font size="6px">&nbsp;</font></td></tr>
                                                 <tr>
                                                <td width="100" ><a href="MyPublishPractise.jsp" class="btn">实习</a></td>
                                                <td width="100"><a href="MyPublish.jsp" class="btn">兼职</a></td>
                                                <td width="100"><a href="MyPublishProject.jsp" class="btn">组队</a></td>
                                                <td width="100"><a href="MyPublishTalk.jsp" class="btn">宣讲会</a></td>
                                                <td width="100"><a href="MyPublishJobFair.jsp" class="btn">招聘会</a></td>
                                                 <td width="100"><a href="MyPublishCompany.jsp" class="btn">公司</a></td>
                                                </tr>
                                                <tr><td COLSPAN=6 align="center"><p><font size="6px">&nbsp;</font></td></tr>
                                               <tr><td COLSPAN=6 align="center"> <p><font size="6px">我发布的兼职信息</font><br></td></tr>
                                               <% }
                                               else{%>
                                               <tr><td COLSPAN=3 align="center"><p><font size="6px">&nbsp;</font></td></tr>
                                             <tr>
                                                <td align="right"><a href="MyPublish.jsp" class="btn">兼职</a></td>
                                                <td align="center" width="100"></td>
                                                <td align="left"><a href="MyPublishProject.jsp" class="btn">组队</a></td>
                                              </tr>
                                              <tr><td COLSPAN=3 align="center"><p><font size="6px">&nbsp;</font></td></tr>
                                              <tr><td COLSPAN=3 align="center"> <p><font size="6px">我发布的兼职信息</font><br></td></tr>
                                                <% }%>
                                                 </table>
                                                                                          
<%!  
    public static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";  
    public static final String USER = "sa";  
    public static final String PASS = "123456";  
    public static final String URL = "jdbc:sqlserver://localhost:1433;DatabaseName=JobHelper";
    public static final int PAGESIZE = 10;  
    int pageCount;  
    int curPage = 1; 
%>
		<%  
    //一页放5个  
    try{  
        Class.forName(DRIVER);  
        Connection con = DriverManager.getConnection(URL,USER,PASS);    
        Statement stat=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 
        String sql = "select Title,PublishTime,District,Collection,Part_timeJobID from Part_timeJob where PublishID='"+username+"' order by PublishTime desc";
        rs = stat.executeQuery(sql); 
        request.setCharacterEncoding("utf-8");

        rs.last();  
        int size = rs.getRow();  
        pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);  
        String tmp = request.getParameter("curPage");  
        if(tmp==null){  
            tmp="1";  
        }  
        curPage = Integer.parseInt(tmp);  
        if(curPage>=pageCount) curPage = pageCount;  
        if(curPage<=0)curPage=1;
        boolean flag = rs.absolute((curPage-1)*PAGESIZE+1);    
        int count = 0; 
        %>
                
            <table border=0 align="center" style="font-family: 'Microsoft YaHei';"width="200">
			<tr>
				<td>
                                <div class="row">

                                        <!-- start of page content -->
                                        <div class="span8 page-content">
                                        <br>
                                        <br>
                                                  <%

                                                  do{
                                                 		if(count>=PAGESIZE)break;
		                                                          String col1 = rs.getString(1);
		                                                          String col2= rs.getString(2);
		                                                          String col3 = rs.getString(3);
		                                                          String col4 = rs.getString(4);
		                                                          String col5 = rs.getString(5);
		                                                          count++;
				                                                                      %>
                                                  
                                               
                                                <article class=" type-post format-standard hentry clearfix">

                                                        <h2  class="post-title"><a href="Part_timeJobEach.jsp?Part_timeJobID=<%=col5%>"><%=col1 %></a></h2>

                                                        <div class="post-meta clearfix">
                                                               <span class="date">发布时间：<%=col2%>&nbsp;</span>&nbsp;&nbsp;
                                                                      <span class="category">实习地点<%=col3 %></span></div>
                                                                      <div  class="post-meta clearfix" align="right">
                                                                     <a href="Part_timeJobDelete.jsp?Part_timeJobID=<%=col5 %>">删除信息</a>&nbsp;&nbsp;&nbsp;<a href="Part_timeJobModify.jsp?Part_timeJobID=<%=col5 %>">修改信息</a>&nbsp;&nbsp;&nbsp;
                                                                      <%
                                                                      if(col4==null)
                                                                    	  col4="0";
                                                                      %>  
                                                                    <span class="like-count"><%=col4 %></span>
                                                                    
                                                        </div>
                                                          <!-- end of post meta -->
                                                         <% }while(rs.next());
                                                             rs.close();
                                                             }  
						    catch(Exception e){  
						          
						    }  %>
						 
                               </article>
                                 <div class="post-meta clearfix" align="center">
								<a href="MyPublish.jsp?curPage=1" class="btn">首页</a>&nbsp;&nbsp; <a
									href="MyPublish.jsp?curPage=<%=curPage-1%>" class="btn">上一页</a>&nbsp;&nbsp;
								<a href="MyPublish.jsp?curPage=<%=curPage+1%>" class="btn">下一页</a>&nbsp;&nbsp;
								<a href="MyPublish.jsp?curPage=<%=pageCount%>" class="btn">尾页</a>&nbsp;&nbsp;
								第<%=curPage%>页/共<%=pageCount%>页
</div>
</div>
</div>
</td></tr></table>  
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