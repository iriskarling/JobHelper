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
<script language="JavaScript">
	function go1() {
		var form = document.getElementById("Search");
		form.action = "PracticeSearch.jsp";
		form.submit();
	}
	function go2() {
		var form = document.getElementById("Search");
		form.action = "PracticeSearch.jsp";
		form.submit();

	}
	</script>
	

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
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
	String StudentID = session.getAttribute("Student").toString();
    String department=session.getAttribute("Department").toString();
    String major2=request.getParameter("majoring"); 
    if(!department.equals(major2)&&major2!=null){
    	if(major2.equals("不限")){
    		department="";
    	}
    	else{
    	department=major2;
    	}
    }
    String PositionKeyword=request.getParameter("PositionKeyword");
    String CompanyKeyword=request.getParameter("CompanyKeyword");
    String Province=request.getParameter("s_province");
    if(Province.equals("省份")){
    	Province="";
    }
    String City=request.getParameter("s_city");
    if(City.equals("地级市")){
    	City="";
    }
    String District=request.getParameter("s_county");
    if(District.equals("市、县级市")){
    	District="";
    }
    String Request=request.getParameter("request");  
    if(Request==null||Request.equals("不限")){
    	Request="";
    }
    String Days=request.getParameter("days");
    if(Days.equals("0")||Days==null){
    	Days="";
    }
    String Months=request.getParameter("months");
    if(Months.equals("0")||Months==null){
    	Months="";
    }
    String Order=request.getParameter("order");
    
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
                <!-- background image -->
		<div id="slides" align="center">
            <img src="images/practise.jpg"  alt="Slide 1"/>
		</div>
		
<form id="Search" name="Search" method="POST" action="" >
		<table border=0 align="center" style="font-family: 'Microsoft YaHei'; font-size:17px;" width="650" height="550" >
		<tr><td COLSPAN=4 align="left" ><h5></h5></td></tr>
		<tr><td align="left" width="100">
		发布院系:&nbsp;</td>
		<td align="center" COLSPAN=2>
		<select id="majoring" name="majoring" style="width:300px;font-size:17px;">
		<option value="不限" <% if(department.equals("")) out.print( "selected");%>>不限</option>
		<%
		Statement stat1=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 
        String sql1 = "SELECT Department FROM Major";
        ResultSet rs1 = stat1.executeQuery(sql1); 
        request.setCharacterEncoding("utf-8");
        while(rs1.next()){
        	String major=rs1.getString(1);
        	%>
        	<option value="<%=major %>" <% if(department.equals(major)) out.print( "selected");%>><%=major %></option>
        	<%        
        	}
		%>
		</select>
		</td>
		<td align="center" width="100">
		<input type="button" name="Search"  class="btn" onclick="go2();" value="院系跳转" style="width:100px;height:37px;"></td>
		</tr>
		<tr ><td COLSPAN=4 align="left" ><h3>筛选条件</h3></td></tr>
		<tr>
		
		<tr><td align="left" width="100">
		职位关键字:&nbsp;</td>
		<td COLSPAN=3>
		<input type="text" name="PositionKeyword" id="PositionKeyword" style="width:450px; height:20px;" value="<%=PositionKeyword%>">
		</td>
		</tr>
		<tr><td align="left" width="100">
		公司关键字:&nbsp;</td>
		<td COLSPAN=3>
		<input type="text" name="CompanyKeyword" id="CompanyKeyword" style="width:450px; height:20px;" value="<%=CompanyKeyword%>">
		</td>
		</tr>
		<tr><td align="left" width="100">
                                   实习地点:&nbsp;</td>
			<td align="left"  COLSPAN=3><font style="font-size:15px;">
			<div class="info">
	<div>
 
	<select id="s_province" name="s_province" style="width:120px;font-size:17px;"></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <select id="s_city" name="s_city" style="width:120px;font-size:17px;"></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <select id="s_county" name="s_county" style="width:120px;font-size:17px;"></select>
    <script class="resources library" src="js/area.js" type="text/javascript"></script>
    
    <script type="text/javascript">_init_area();</script>

    </div>
    <div id="show"></div>
    </div>
 <script type="text/javascript">
var Gid  = document.getElementById ;
var showArea = function(){
	Gid('Search').innerHTML = "<h3>省" + Gid('s_province').value + " - 市" + 	
	Gid('s_city').value + " - 县/区" + 
	Gid('s_county').value + "</h3>";
}
Gid('s_county').setAttribute('onchange','showArea()');
</script></font></td>
			</tr>
			<tr>
			<td align="left" width="100">
		         能力要求:&nbsp;</td>
			<td align="left" COLSPAN=3>
			<input type="radio" name="request" value="不限" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Request.equals("")) out.print( "checked");%>>不限&nbsp;&nbsp;&nbsp;&nbsp;
			<%
			Statement stat4=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 
	        String sql4 = "SELECT Request FROM Major where Department='"+department+"'";
	        ResultSet rs4 = stat4.executeQuery(sql4); 
	        request.setCharacterEncoding("utf-8");
	        while(rs4.next()){
	        	String re=rs4.getString(1);
	        	String[] ss = re.split(";"); 
	        	int i=0;
	        	while(i<ss.length){
	        		for(int j=1;j<=5;j++){
	        			
	        	%>
	        	<input type="radio" name="request" value="<%=ss[i]%>" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Request.equals(ss[i])) out.print( "checked");%>><%=ss[i]%>&nbsp;&nbsp;&nbsp;&nbsp;
	        	<% 
	        	    i++;
	        	    if(i==ss.length)break;
	        		}
	        		%>
	        		<br>
	        		<% 
	        	}     	
	        }
	        stat4.close();
	        rs4.close();
			%>
			
		</td></tr>
		<tr><td align="left" width="100">
		实习天数:&nbsp;</td>
			<td align="left" COLSPAN=3>
			<input type="radio" name="days" value="0" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Days.equals("")) out.print( "checked");%>>不限&nbsp;&nbsp;
			<input type="radio" name="days" value="1" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Days.equals("1")) out.print( "checked");%>>1天&nbsp;&nbsp;
			<input type="radio" name="days" value="2" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Days.equals("2")) out.print( "checked");%>>2天&nbsp;&nbsp;
			<input type="radio" name="days" value="3" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Days.equals("3")) out.print( "checked");%>>3天&nbsp;&nbsp;
			<input type="radio" name="days" value="4" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Days.equals("4")) out.print( "checked");%>>4天&nbsp;&nbsp;
			<input type="radio" name="days" value="5" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Days.equals("5")) out.print( "checked");%>>5天&nbsp;&nbsp;
			<input type="radio" name="days" value="6" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Days.equals("6")) out.print( "checked");%>>6天&nbsp;&nbsp;
			<input type="radio" name="days" value="7" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Days.equals("7")) out.print( "checked");%>>7天
			</td>
			</tr>
			<tr>
			<td align="left" width="100">
		           实习月数:&nbsp;</td>
			<td align="left" COLSPAN=3>
			<input type="radio" name="months" value="0" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Months.equals("")) out.print( "checked");%>>不限&nbsp;&nbsp;
			<input type="radio" name="months" value="1" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Months.equals("1")) out.print( "checked");%>>1月&nbsp;&nbsp;
			<input type="radio" name="months" value="2" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Months.equals("2")) out.print( "checked");%>>2月&nbsp;&nbsp;
			<input type="radio" name="months" value="3" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Months.equals("3")) out.print( "checked");%>>3月&nbsp;&nbsp;
			<input type="radio" name="months" value="4" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Months.equals("4")) out.print( "checked");%>>4月&nbsp;&nbsp;
			<input type="radio" name="months" value="5" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Months.equals("5")) out.print( "checked");%>>5月及以上
			
		</td></tr>
		<tr>
			<td align="left" width="100">
		           排序方式:&nbsp;</td>
			<td align="left" COLSPAN=3>
			<input type="radio" name="order" value="PublishTime" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Order.equals("PublishTime")) out.print( "checked");%>>最新发布&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="order" value="Collection" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Order.equals("Collection")) out.print( "checked");%>>最具人气
			
		</td></tr>
		<tr><td align="left" width="100"></td><td align="left" width="250"></td>
		<td align="center" COLSPAN=2><br><input type="button" name="Search"  class="btn" onclick="go1();" value="条件查找" style="width:100px;height:37px;"></td>
		</tr>
		</table>


		<hr>
     


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
        String sql="";
        if(Order.equals("PublishTime")){
        sql = "SELECT * FROM Practise where Department like '%"+department+"%' and (Position like '%"+PositionKeyword+"%'or Description like '%"+PositionKeyword+"%') and CompanyName like '%"+CompanyKeyword+"%' and Province like '%"+
        Province+"%' and (City like '%"+City+"%'or City='不详') and (Distriction like '%"+District+"%'or Distriction='不详 ') and (Request like '%"+Request+"%' or Request='不限') and (TimesAWeek like '%"+Days+"%' or TimesAWeek='不限') and (MonthsAmount like'%"+Months+"%' or MonthsAmount='不限') order by PublishTime desc,Collection desc";
        }
        else{
        	sql = "SELECT * FROM Practise where Department like '%"+department+"%' and (Position like '%"+PositionKeyword+"%'or Description like '%"+PositionKeyword+"%') and CompanyName like '%"+CompanyKeyword+"%' and Province like '%"+
        	        Province+"%' and (City like '%"+City+"%'or City='不详') and (Distriction like '%"+District+"%'or Distriction='不详 ') and (Request like '%"+Request+"%' or Request='不限') and (TimesAWeek like '%"+Days+"%' or TimesAWeek='不限') and (MonthsAmount like'%"+Months+"%' or MonthsAmount='不限') order by Collection desc,PublishTime desc";
        	        
        }
        ResultSet rs = stat.executeQuery(sql); 
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
						<div class="span8 main-listing">
							<% 
			do{
            if(count>=PAGESIZE)break;
            String practiseID=rs.getString("PractiseID");
            String position=rs.getString("Position");
            String publishTime = rs.getString("PublishTime");
            String company = rs.getString("CompanyName");
            String city = rs.getString("City");
            String distriction = rs.getString("Distriction");
            String collection=rs.getString("Collection");
            count++; 
            %>
							<article class="format-standard type-post hentry clearfix">

								<header class="clearfix">


									<h3 class="post-title">
										<a href="PracticeJobEach.jsp?PractiseID=<%=practiseID%>"><%=position%></a>
									</h3>

									<div class="post-meta clearfix">
										<span class="date"><%=publishTime %></span>
										<span class="category"><%=company %></span> 
										<span class="category"><%=city %>/<%=distriction %></span> <span class="like-count"><%=collection %></span>
									</div>
									<!-- end of post meta -->

								</header>

							</article>
							<%  
								} while(rs.next());
						        //con.close();
						        rs.close();
						        stat.close(); 
						    }  
						    catch(Exception e){  
						          
						    }  
						%>
						</div>
					</div>

				</td>
			</tr>
		</table>
		<div class="post-meta clearfix" align="center">
		<input type="button" name="btn"   class="btn" onclick="go5();" value="首页" >&nbsp;&nbsp; 
		<input type="button" name="btn"   class="btn" onclick="go4();" value="上一页" >&nbsp;&nbsp;
		<input type="button" name="btn"   class="btn" onclick="go3();" value="下一页" >&nbsp;&nbsp;
		<input type="button" name="btn"  class="btn" onclick="go6();" value="尾页" >&nbsp;&nbsp;
								第<%=curPage%>页/共<%=pageCount%>页
		</div>
	</form>
<script language="JavaScript">
	function go3() {
		var form = document.getElementById("Search");
		var a="<%=curPage+1%>";
		form.action = "PracticeSearch.jsp?curPage="+a;
		form.submit();

	}
	function go4() {
		var form = document.getElementById("Search");
		var a="<%=curPage-1%>";
		form.action = "PracticeSearch.jsp?curPage="+a;
		form.submit();

	}
	function go5() {
		var form = document.getElementById("Search");
		var a="1";
		form.action = "PracticeSearch.jsp?curPage="+a;
		form.submit();

	}
	function go6() {
		var form = document.getElementById("Search");
		var a="<%=pageCount%>";
		form.action = "PracticeSearch.jsp?curPage="+a;
		form.submit();

	}
</script>
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
