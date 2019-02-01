<%@ page language="java" import="java.util.*" contentType="text/html; charset=gb2312" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>
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
body{ background:#EEEEEE;margin:0; padding:0; font-family:"微软雅黑", Arial, Helvetica, sans-serif; }
a{ color:#006600; text-decoration:none;}
a:hover{color:#990000;}
.top{ margin:5px auto; color:#990000; text-align:center;}
.info select{ border:1px #993300 solid; background:#FFFFFF;}
.info{ margin:5px; text-align:center;}
.info #show{ color:#3399FF; }
.bottom{ text-align:right; font-size:12px; color:#CCCCCC; width:1000px;}
</style>
                                          
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
   <script class="resources library" src="area.js" type="text/javascript"></script>
    
    <script type="text/javascript">_init_area();</script>
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
.STYLE5 {font-size: 16px}
-->
                </style>
        </head>

        <body>
 <%
 try{
	 String department = (String) session.getAttribute("Department");
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


                <!-- Start of Page Container -->
                
                
                

             


                                      
                                             
 <p>&nbsp;</p>
<p>&nbsp;</p>
<p align="center" class="STYLE1">发布实习信息</p>
<p align="center" class="STYLE2">     &nbsp;&nbsp;&nbsp;*为必填信息</p>

<div align="center">
  <form name="form1" method="post" action="PractisePublish1.jsp">
  <table width="730" height="438" border="0">
    <tr>
      <td width="181" ><span class="STYLE2">实习职位*</span></td>
      <td width="539" ><input type="text" name="title" /></td>
    </tr>
    <tr>
      <td ><span class="STYLE2">招聘公司*</span></td>
      <td><select id="company_name" name="company_name">
           <%
      rs=stmt.executeQuery("select CompanyName from Company");
      while(rs.next())
      {
    	  String   col=rs.getString(1);
      
      %>
	  <option value="<%=col%>"><%=col %></option>
	  <% 
	  }
	    rs.close();
	  %>
 </select>&nbsp;&nbsp;
      <a href="CompanyPublish.jsp">添加新公司</a></td>
    </tr>
    <tr>
      <td ><span class="STYLE2">实习地点 *</span></td>
      <td >
	<select id="s_province" name="s_province"></select>  <br>
    <select id="s_city" name="s_city" ></select>  <br>
    <select id="s_county" name="s_county"></select><br>
    <script class="resources library" src="js/area.js" type="text/javascript"></script>
    
    <script type="text/javascript">_init_area();</script>
    
    <div id="show"></div> </td>
    </tr>
    <tr>
      <td><span class="STYLE2">能力要求</span></td>
     
      <td >
       <% 
      rs=stmt.executeQuery("select Request from Major where Department='"+department+"'");
      String col=" ";
      String[] strArray=null;
     int i=0;
     String a=" ";
      while(rs.next())
      {
    	  col=rs.getString(1);
    	  strArray = col.split(";");
    	  i=0;
    	  while(i<strArray.length)
    	  {
    		for(int j=1;j<=5;j++){
    			a=strArray[i];
      %>
      <input type="checkbox" name="request" style="font-family:'Microsoft YaHei';font-size:15px;" value="<%=a%>"><%=a%>&nbsp;&nbsp;
        <% 
        i++;
        if(i==strArray.length)break;
    		
    		}
    		%>
    		<br>
    		<%
    	  }
	  }
	    rs.close();
	  %></td>
    </tr>
    <tr>
      <td><span class="STYLE2">招聘人数</span></td>
      <td >
        <span class="STYLE2">
        <input type="text" name="amount" />
        </span>（请填写数字）</td>
    </tr>
    <tr>
      <td><span class="STYLE2">实习天数（每周）</span></td>
      <td >
        <select id="week" name="week">
         <option value="不限">不限</option>
        <option value="1天">1天</option>
         <option value="2天">2天</option>
          <option value="3天">3天</option>
           <option value="4天">4天</option>
            <option value="5天">5天</option>
             <option value="6天">6天</option>
              <option value="7天">7天</option>
            
        </select></td></tr>
 
        <tr>
      <td><span class="STYLE2">实习月数</span></td>
      <td >
         <select id="month" name="month">
        <option value="不限">不限</option>
         <option value="1月">1月</option>
          <option value="2月">2月</option>
           <option value="3月">3月</option>
            <option value="4月">4月</option>
             <option value="5月及以上">5月及以上</option>
           
            
        </select>
        </td>
    </tr>
    <tr>
      <td><span class="STYLE2">职位描述*</span></td>
      <td><textarea name="Description" cols="200" rows="6" style="resize: none;width: 600px;
height: 600px;
max-width: 380px;
max-height: 150px"></textarea></td>
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
   <input type="submit" name="Submit" style="width:100px;height:35px;font-family:'Microsoft YaHei';font-size:18px;" class="btn" value="发布" />
</p>
   </form>               
  <script type="text/javascript">
var Gid  = document.getElementById ;
var showArea = function(){
	Gid('show').innerHTML = " - 市" + 	
	Gid('s_city').value + " - 县/区" + 
	Gid('s_county').value + "</h3>"
							}
Gid('s_county').setAttribute('onchange','showArea()');
</script>
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