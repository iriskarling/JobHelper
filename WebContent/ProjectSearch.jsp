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

<script src="laydate/laydate.js"></script>
<script language="JavaScript">
	function go1() {
		var form = document.getElementById("Search");
		form.action = "ProjectSearch.jsp";
		form.submit();
	}
	function go2() {
		var form = document.getElementById("Search");
		form.action = "ProjectSearch.jsp";
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
    
    String Type=request.getParameter("type");
    if(Type.equals("不限")){
    	Type="";
    }
    String Grade=request.getParameter("grade");
    if(Grade.equals("不限")){
    	Grade="";
    }
    String Majorneed=request.getParameter("majorneed");
    if(Majorneed.equals("不限")){
    	Majorneed="";
    }
    String StartDate=request.getParameter("start");  
    if(StartDate.equals("")){
    	StartDate="0000-00-00";
    }
    String EndDate=request.getParameter("end");
    if(EndDate.equals("")){
    	EndDate="9999-99-99";
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
		<div id="slides">
            <img src="images/project.jpg"  alt="Slide 1"/>
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
		需求关键字:&nbsp;</td>
		<td COLSPAN=3>
		<input type="text" name="PositionKeyword" id="PositionKeyword" style="width:480px; height:20px;" value="<%=PositionKeyword%>">
		</td>
		</tr>
		<tr><td align="left" width="100">
                                   类型选择:&nbsp;</td>
			<td align="left"  COLSPAN=3><font style="font-size:15px;">
			<input type="radio" name="type" value="不限" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Type.equals("")) out.print( "checked");%>>不限&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="type" value="学科竞赛类" style="font-family:'Microsoft YaHei';font-size:20px;"<% if(Type.equals("学科竞赛类")) out.print( "checked");%> >学科竞赛类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="type" value="社会实践类" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Type.equals("社会实践类")) out.print( "checked");%>>社会实践类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="type" value="实验室/项目" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Type.equals("实验室/项目")) out.print( "checked");%>>实验室/项目&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="type" value="其他" style="font-family:'Microsoft YaHei';font-size:20px;" <% if(Type.equals("其他")) out.print( "checked");%>>其他<br></font></td>
			</tr>
			<tr>
			<td align="left" width="100">
		        年级要求:&nbsp;</td>
			<td align="left" COLSPAN=3>
			<select id="grade" name="grade" style="width:240px;font-size:17px;">
			<option value="不限" <% if(Grade.equals("")) out.print( "selected");%>>不限</option>
			<option value="大一及以上" <% if(Grade.equals("大一及以上")) out.print( "selected");%>>大一及以上</option>
			<option value="大二及以上" <% if(Grade.equals("大二及以上")) out.print( "selected");%>>大二及以上</option>
			<option value="大三及以上" <% if(Grade.equals("大三及以上")) out.print( "selected");%>>大三及以上</option>
			<option value="大四及以上" <% if(Grade.equals("大四及以上")) out.print( "selected");%>>大四及以上</option>
			<option value="研一及以上" <% if(Grade.equals("研一及以上")) out.print( "selected");%>>研一及以上</option>
			<option value="研二及以上" <% if(Grade.equals("研二及以上")) out.print( "selected");%>>研二及以上</option>
			<option value="研三及以上" <% if(Grade.equals("研三及以上")) out.print( "selected");%>>研三及以上</option>

			</select>
		</td></tr>
		<tr><td align="left" width="100">
		院系要求:&nbsp;</td>
			<td align="left" COLSPAN=3>
		<select id="majorneed" name="majorneed" style="width:240px;font-size:17px;">
		<option value="不限" <% if(Majorneed.equals("")) out.print( "selected");%>>不限</option>
		<%
		Statement stat0=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 
        String sql0 = "SELECT Department FROM Major";
        ResultSet rs0 = stat0.executeQuery(sql0); 
        request.setCharacterEncoding("utf-8");
        while(rs0.next()){
        	String major=rs0.getString(1);
        	%>
        	<option value="<%=major %>" <%if(Majorneed.equals(major)) out.print( "selected");%>><%=major %></option>
        	<%        
        	}
		    %>
		    </select>
			</td>
			</tr>
			<tr>
			<td align="left" width="100">
		           合作时间:&nbsp;</td>
			<td align="left" COLSPAN=3 class="inline">
			FROM：<input class="inline laydate-icon" id="start" name="start" style="width:150px; margin-right:10px;" value="<%if(StartDate.equals("0000-00-00")) out.print( ""); else out.print(StartDate);%>">&nbsp;&nbsp;&nbsp;&nbsp;
            TO：<input class="inline laydate-icon" id="end" name="end" style="width:150px;" value="<%if(EndDate.equals("9999-99-99")) out.print(""); else out.print(EndDate);%>">		
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
        sql = "SELECT * FROM Project where Department like '%"+department+"%' and (Title like '%"+PositionKeyword+"%' or Description like '%"+PositionKeyword+"%') and (Type like '%"+
        Type+"%'or Type='不限') and (Grade like '%"+Grade+"%'or Grade ='不限') and StartDate >= '"+StartDate+"' and EndDate <= '"+EndDate+"' and (Major like '%"+Majorneed+"%'or Major='不限') order by PublishTime desc,Collection desc";
        }
        else{
        	sql = "SELECT * FROM Project where Department like '%"+department+"%' and (Title like '%"+PositionKeyword+"%' or Description like '%"+PositionKeyword+"%') and (Type like '%"+
        	        Type+"%'or Type='不限') and (Grade like '%"+Grade+"%'or Grade ='不限') and StartDate >= '"+StartDate+"' and EndDate <= '"+EndDate+"' and (Major like '%"+Majorneed+"%'or Major='不限') order by Collection desc,PublishTime desc";
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
					            String ProjectID=rs.getString("ProjectID");
					            String Title=rs.getString("Title");
					            String Type1=rs.getString("Type");
					            String publishTime = rs.getString("PublishTime");
					            String Grade1 = rs.getString("Grade");
					            String collection=rs.getString("Collection");
					            count++; 
					            %>
												<article class="format-standard type-post hentry clearfix">

													<header class="clearfix">


														<h3 class="post-title">
															<a href="ProjectEach.jsp?ProjectID=<%=ProjectID%>"><%=Title%></a>
														</h3>

														<div class="post-meta clearfix">
															<span class="date"><%=publishTime %></span>
															<span class="category"><%=Type1 %></span> 
															<span class="category">年级要求：<%=Grade1 %></span> <span class="like-count"><%=collection %></span>
														</div>
														<!-- end of post meta -->

													</header>

												</article>
												<%  
													}while(rs.next());
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
		form.action = "ProjectSearch.jsp?curPage="+a;
		form.submit();

	}
	function go4() {
		var form = document.getElementById("Search");
		var a="<%=curPage-1%>";
		form.action = "ProjectSearch.jsp?curPage="+a;
		form.submit();

	}
	function go5() {
		var form = document.getElementById("Search");
		var a="1";
		form.action = "ProjectSearch.jsp?curPage="+a;
		form.submit();

	}
	function go6() {
		var form = document.getElementById("Search");
		var a="<%=pageCount%>";
		form.action = "ProjectSearch.jsp?curPage="+a;
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
<script>
!function(){
laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
laydate({elem: '#demo'});//绑定元素
}();
//日期范围限制
var start = {
    elem: '#start',
    format: 'YYYY-MM-DD',
    min: '1099-06-16', //设定最小日期为当前日期
    max: '2099-06-16', //最大日期
    istime: true,
    istoday: false,
    choose: function(datas){
         end.min = datas; //开始日选好后，重置结束日的最小日期
         end.start = datas //将结束日的初始值设定为开始日
    }
};
var end = {
    elem: '#end',
    format: 'YYYY-MM-DD',
    min: laydate.now(),
    max: '2099-06-16',
    istime: true,
    istoday: false,
    choose: function(datas){
        start.max = datas; //结束日选好后，充值开始日的最大日期
    }
};
laydate(start);
laydate(end);
//自定义日期格式
laydate({
    elem: '#test1',
    format: 'YYYY年MM月DD日',
    festival: true, //显示节日
    choose: function(datas){ //选择日期完毕的回调
        alert('得到：'+datas);
    }
});
//日期范围限定在昨天到明天
laydate({
    elem: '#hello3',
    min: laydate.now(-1), //-1代表昨天，-2代表前天，以此类推
    max: laydate.now(+1) //+1代表明天，+2代表后天，以此类推
});
</script>
</body>
</html>
>