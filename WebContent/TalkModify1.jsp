<%@ page language="java" import="java.util.*" contentType="text/html; charset=gb2312" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

               <SCRIPT language="JavaScript">
    var myDate = new Date();
    myDate.getYear();       //获取当前年份(2位)
    myDate.getFullYear();   //获取完整的年份(4位,1970-????)
    myDate.getMonth();      //获取当前月份(0-11,0代表1月)
    myDate.getDate();       //获取当前日(1-31)
    myDate.getDay();        //获取当前星期X(0-6,0代表星期天)
    myDate.getTime();       //获取当前时间(从1970.1.1开始的毫秒数)
    myDate.getHours();      //获取当前小时数(0-23)
    myDate.getMinutes();    //获取当前分钟数(0-59)
    myDate.getSeconds();    //获取当前秒数(0-59)
    myDate.getMilliseconds();   //获取当前毫秒数(0-999)
    myDate.toLocaleDateString();    //获取当前日期
    var mytime=myDate.toLocaleTimeString();    //获取当前时间
    myDate.toLocaleString( );       //获取日期与时间

if (mytime<"23:30:00")
{
alert(mytime);
}
</SCRIPT>
</head>

<body>

	    <%
		
	//try {
	    String username = (String) session.getAttribute("Student");
	    String department = (String) session.getAttribute("Department");
	    String TalkID=request.getParameter("TalkID");
	    	 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    	 String url="jdbc:sqlserver://localhost:1433;DatabaseName=JobHelper";

	    	 String user="sa";
	    	 String password="123456";
	    	 Connection conn=DriverManager.getConnection(url,user,password); 		
	    	
	    	request.setCharacterEncoding("utf-8");	
	    	response.setCharacterEncoding("utf-8");
	
	    	String col1=request.getParameter("title");
	    	col1 = new String(col1.getBytes("ISO8859-1"),"UTF-8"); 
	    	String col2=request.getParameter("location");
	    	col2 = new String(col2.getBytes("ISO8859-1"),"UTF-8"); 
	    	String col3=request.getParameter("startDate");
	    	col3 = new String(col3.getBytes("ISO8859-1"),"UTF-8"); 
	    	String col4=request.getParameter("startTime");
	    	col4 = new String(col4.getBytes("ISO8859-1"),"UTF-8"); 
	    	String col5=request.getParameter("endTime");
	    	col5 = new String(col5.getBytes("ISO8859-1"),"UTF-8"); 
	    	String col9=request.getParameter("Description");
	    	col9 = new String(col9.getBytes("ISO8859-1"),"UTF-8"); 
	    
	    	if(col1.equals("")||col2.equals("")||col3.equals("")||col9.equals(""))
	    	{
	    		
	    	%>
	    		<script language="javascript">
	    		var a="<%=TalkID%>";
	    		alert("请填写完整数据");
	    		window.location='TalkModify.jsp?TalkID='+a;
	</script>
	    	<% 
	    	}
	    	else
	    	{
	    		CallableStatement st = conn.prepareCall("{call modify_talk(?,?,?,?,?,?,?)}");
		    	 st.setString(1, TalkID);
		    	 st.setString(2, col1);
		    	 st.setString(3, col2);
		    	 st.setString(4, col3);
		    	 st.setString(5, col4);
		    	 st.setString(6, col5);
		    	 st.setString(7, col9);
		    	 st.executeUpdate();
	    %>
<script language="javascript">
	var a="<%=TalkID%>";
		alert("修改成功");
		window.location='TalkModify.jsp?TalkID='+a;
	</script>
	<%

		    st.close();
			conn.close();
	    	}
	//	} catch (Exception e) {
	//		out.println(e.getMessage());
	
	//	}
		
	%>
</body>
</html>