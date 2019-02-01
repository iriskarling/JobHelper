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
.STYLE7 {
	font-family: "Microsoft YaHei UI";
	font-size: 16px;
}
-->
                </style>
        </head>

        <body>
 <%
 try{
	 String StudentID = (String) session.getAttribute("Student");
	 String studentName = (String) session.getAttribute("Name");
                      String ProjectID2=request.getParameter("ProjectID");
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
<p align="center" class="STYLE1">修改项目信息</p>
<p align="center"class="STYLE2">     &nbsp;&nbsp;&nbsp;*为必填信息</p>
<div align="center">
  <form name="form1" method="post" action="ProjectModify1.jsp">
  <table width="730" height="408" border="0">
    <tr>
      <td width="120"><span class="STYLE2">标题 *</span></td>
       <%
                                                  rs = stmt.executeQuery("select Title,Type,Grade,StartDate,EndDate,Description,ProjectID,Major from Project where ProjectID='"+ProjectID2+"'");
												       String col1 = "";
												       String col2=  "";
												       String col3 =  "";
												       String col4 =  "";
												       String col5 =  "";
												       String col6 =  "";
												       String col7 =  "";
												       String col8 =  "";
                                                  while(rs.next()){
		                                                          col1 = rs.getString(1);
		                                                          col2= rs.getString(2);
		                                                           col3 = rs.getString(3);
		                                                           col4 = rs.getString(4);
		                                                           col5 = rs.getString(5);
		                                                           col6 = rs.getString(6);
		                                                          col7 = rs.getString(7);
		                                                          col8 = rs.getString(8);
                                                  }
                                                  rs.close();
		                                                      
				                                                                      %>
      <td width="600"><input type="text" name="title" value="<%=col1 %>"/></td>
    </tr>
     <tr>
      <td><span class="STYLE2"> </span></td>
      <td><input type="hidden"name="ProjectID" value="<%=col7%>" /></td>
    </tr>
    <tr>
      <td><span class="STYLE2">合作类型 </span></td>
      <td><select name="type">
      <option value="学科竞赛类"<% if(col2.equals("学科竞赛类")) out.print( "selected");%>>学科竞赛类</option>
      <option value="社会实践类"<% if(col2.equals("社会实践类")) out.print( "selected");%>>社会实践类</option>
      <option value="实验室/项目"<% if(col2.equals("实验室/项目")) out.print( "selected");%>>实验室/项目</option>
      <option value="其他"<% if(col2.equals("其他")) out.print( "selected");%>>其他</option>
      </select></td>
    </tr>
    <tr>
      <td><span class="STYLE2">学历要求 </span></td>
      <td><select name="grade">
      <option value="不限"<% if(col3.equals("不限")) out.print( "selected");%>>不限</option>
        <option value="大一及以上"<% if(col3.equals("大一及以上")) out.print( "selected");%>>大一及以上</option>
          <option value="大二及以上"<% if(col3.equals("大二及以上")) out.print( "selected");%>>大二及以上</option>
            <option value="大三及以上"<% if(col3.equals("大三及以上")) out.print( "selected");%>>大三及以上</option>
              <option value="大四及以上"<% if(col3.equals("大四及以上")) out.print( "selected");%>>大四级以上</option>
                <option value="研一及以上"<% if(col3.equals("研一及以上")) out.print( "selected");%>>研一及以上</option>
                  <option value="研二及以上"<% if(col3.equals("研二及以上")) out.print( "selected");%>>研二及以上</option>
                    <option value="研三及以上"<% if(col3.equals("研三及以上")) out.print( "selected");%>>研三及以上</option>
                    
      </select>    </td>
    </tr>
    <tr>
      <td><span class="STYLE2">合作时间 *</span></td>
      <td><span class="STYLE2">
    开始：<input class="inline laydate-icon" id="start" name="startDate" style="width:200px; margin-right:10px;" value="<%=col4%>"/><br>
    <br>结束：<input class="inline laydate-icon" id="end" name="endDate" style="width:200px;"value="<%=col5 %>"/>
      </span></td>
    </tr>
    <tr>
      <td><span class="STYLE2">专业要求</span></td>
      <td><select name="major">
      <option value="不限" <% if(col8.equals("不限")||col8.equals("")) out.print( "selected");%>>不限</option>
      <%
    
      rs=stmt.executeQuery("select Department from Major");
      while(rs.next())
      {
    	  String   col=rs.getString(1);
      
      %>
	  <option value="<%=col%>"<% if(col8.equals(col)) out.print( "selected");%>><%=col %></option>
	  <% 
	  }
	    rs.close();
	  %>
       
      </select></td>
    </tr>
    <tr>
      <td><span class="STYLE2">详细描述 *</span></td>
      <td><textarea name="Description" cols="200" rows="6" style="resize: none;width: 600px;
height: 600px;
max-width: 380px;
max-height: 150px"><%=col6 %></textarea></td>
    </tr>
  </table>
  <%
                                                

		stmt.close();
			conn.close();
 } catch (Exception e) {
			out.println(e.getMessage());
		
		}
			

	%>   
</div>
<p align="center">
   <input type="submit" name="Submit" style="width:100px;height:35px;font-family:'Microsoft YaHei';font-size:18px;" class="btn"  value="修改" />
</p>
        </form>                
  
        <script>
!function(){
laydate.skin('default');//切换皮肤，请查看skins下面皮肤库
laydate({elem: '#demo'});//绑定元素
}();
//日期范围限制
var start = {
    elem: '#start',
    format: 'YYYY-MM-DD',
    min: laydate.now(), //设定最小日期为当前日期
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