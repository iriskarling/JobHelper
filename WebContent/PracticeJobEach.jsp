<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
 <html lang="en-US">
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <base href="<%=basePath%>">
                <title>Job Helper</title>

                <link rel="shortcut icon" href="images/favicon.png" />

                <!-- Style Sheet-->
                <link rel="stylesheet" href="carousel.css"/>
                <link rel="stylesheet" href="style.css"/>
                <link rel='stylesheet' id='bootstrap-css-css'  href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='responsive-css-css'  href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
               
                <link rel='stylesheet' id='main-css-css'  href='css/main5152.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='custom-css-css'  href='css/custom5152.html?ver=1.0' type='text/css' media='all' />

        </head>

        <body>

                <!-- Start of Header -->
                <div class="header-wrapper">
                        <header>
                                <div class="container">


                                        
                                                <!-- Website Logo -->
                                                <a href="index-2.html"  title="Job Helper">
                                                        
                                                </a>
                                                <br>
                                           <font size="6px">   <b>  Job Helper</b></font>
                                     


                                        <!-- Start of Main Navigation -->
                                        <nav class="main-nav">
                                                <div class="menu-top-menu-container">
                                                        <ul id="menu-top-menu" class="clearfix">
                                                        <%                                                   
	String StudentID = session.getAttribute("Student").toString();
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=JobHelper";
	String user = "sa";
	String password = "123456";
	Connection conn = DriverManager.getConnection(url, user, password);
	String studentName=session.getAttribute("Name").toString();
	String permission=session.getAttribute("permission").toString();

%>
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
		<%  
		String PractiseID="";
        String PractiseID2=request.getParameter("PractiseID");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8"); 
        Statement stat=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 
        String sql = "SELECT * FROM Practise where PractiseID='"+PractiseID2+"'";
        ResultSet rs = stat.executeQuery(sql); 

        %>
  <form align="center" >
 
                        <div class="container">
                                <div class="row">

						<div class="span8 page-content">
				
							<% 
			if(rs.first()){
            String position=rs.getString("Position");
            String description=rs.getString("Description");
            String Request=rs.getString("Request");if(Request.equals("")){Request="不限";}
            String TimesAWeek=rs.getString("TimesAWeek");if(TimesAWeek.equals("")){TimesAWeek="不限";}
            String MonthsAmount=rs.getString("MonthsAmount");if(MonthsAmount.equals("")){MonthsAmount="不限";}
            String AssistantID=rs.getString("AssistantID");
            String publishTime = rs.getString("PublishTime");
            String CompanyId=rs.getString("CompanyID");
            String company = rs.getString("CompanyName");
            String province=rs.getString("Province");
            String city = rs.getString("City");
            String distriction = rs.getString("Distriction"); 
            String Amount =rs.getString("Amount");if(Amount.equals("0")){Amount="不限";}
            String Collection=rs.getString("Collection");
            String dept=rs.getString("Department");
            %>
             <article class=" type-page  hentry clearfix">
             <p>&nbsp;</p>
             <h1 class="post-title">
					<%=position%>
				</h1>
				<hr>
                <table border=0  align="center" width="600px" height="130px"style="font-family: 'Microsoft YaHei'; font-size: 18px;">
                            <tr>
                                 <td align="left">人数要求：&nbsp;<%=Amount %>人</td>
                                        <td align="left">能力要求：&nbsp;<%=Request %></td>
                                        </tr>
                                        <tr>  
										<td align="left">实习天数：&nbsp;<%=TimesAWeek %>/周</td>
										<td align="left">实习月数：&nbsp;<%=MonthsAmount %></td></tr>
										<tr> 
										 <td align="left">实习地点：&nbsp;<%=province%>/<%=city %>/<%=distriction %></td>
										 <td align="left">收藏量：&nbsp;<%=Collection %></td></tr>
                                    </table>
                                    <hr>
                                <blockquote>
									<textarea contenteditable="true" name="describe" readonly="readonly" cols="100" rows="6" style="resize: none;width: 600px;
height: 600px;
max-width: 500px;
max-height: 500px"><%=description %></textarea>
                                </blockquote>
                                <hr>
                                <p align="left" style="font-family: 'Microsoft YaHei'; font-size: 20px; ">招聘公司：<a href="PracticeCompany.jsp?CompanyID=<%=CompanyId%>">&nbsp;<%=company %></a></p>
                                <%
                                Statement stat3=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 
                                String sql3 = "SELECT LinkmanName,LinkmanEmail,LinkmanPhone FROM Company where CompanyID='"+CompanyId+"'";
                                ResultSet rs3 = stat3.executeQuery(sql3); 
                                String name="";
                                String email="";
                                String phone="";
                                while(rs3.next()){
                                	name=rs3.getString("LinkmanName");
                                	email=rs3.getString("LinkmanEmail");
                                	phone=rs3.getString("LinkmanPhone");
                                }
                                rs3.close();
                                stat3.close();
                                %>
                                <p align="left" style="font-family: 'Microsoft YaHei'; font-size: 15px; ">联系人：&nbsp;<%=name %>&nbsp;&nbsp;&nbsp;联系电话：&nbsp;<%=phone %>&nbsp;&nbsp;&nbsp;E_mail:&nbsp;<%=email %></p>
									<%
									if(permission.equals("Student"))
									{
									%>
									<div class="post-meta clearfix" align="right"><% 
									Statement stat4=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 
                                String sql4 = "SELECT * FROM Collect_Practise where StudentID='"+StudentID+"'and PractiseID='"+PractiseID2+"' ";
                                ResultSet rs4 = stat4.executeQuery(sql4); 
                                if(rs4.next()){
                                if(email.equals("不详")){
                                		%>
                                		（该公司未发布邮箱，无法投递简历）&nbsp;&nbsp;&nbsp;
									<a href="PracticeCollectDelete.jsp?PractiseID=<%=PractiseID2%>" class="btn" >取消收藏</a>
									<%
                                }
                                else{
                                    %>
                                    <a href="sendmail.jsp?email=<%=email%>&PractiseID=<%=PractiseID2%>" class="btn" >投简历</a>&nbsp;&nbsp;&nbsp;
                                    	<a href="PracticeCollectDelete.jsp?PractiseID=<%=PractiseID2%>" class="btn" >取消收藏</a>
                                    <% 
                                    }
                                }
                                else{
                                	if(email.equals("不详")){
                                		%>
                                		（该公司未发布邮箱，无法投递简历）&nbsp;&nbsp;&nbsp;
                                		<a href="PracticeCollect.jsp?PractiseID=<%=PractiseID2%>" class="btn" >收&nbsp;藏</a>
                                	<% 
                                	}
                                	else{
                                %>
                                <a href="sendmail.jsp?email=<%=email%>&PractiseID=<%=PractiseID2%>" class="btn" >投简历</a>&nbsp;&nbsp;&nbsp;
                                	<a href="PracticeCollect.jsp?PractiseID=<%=PractiseID2%>" class="btn" >收&nbsp;藏</a>
                                <% 
                                }
                                }
                                stat4.close();
                                rs4.close();
									%>
									</div>
									<%
									}
									%>
                                 <div class="post-meta clearfix" align="right">
										<span class="category">发布日期：&nbsp;<%=publishTime %></span>
										<span class="category">发布人：&nbsp;<%=AssistantID %></span> 
										<span class="category">发布院系：&nbsp;<%=dept %></span>
									</div>                              
</article>
							<%  
						        }
								else{%>
								 <article class=" type-page  hentry clearfix">
										<h3 align="center">没有搜索到相关数据！
									    </h3>
									    </article>
								<% }
					        rs.close();
					        stat.close();
					        conn.close();
						%>
</div>
					</div>
</div>
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