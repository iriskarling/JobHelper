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

</head>

<body>

	    <%
	
	
	//try {
	    String username = (String) session.getAttribute("Student");
	    String department = (String) session.getAttribute("Department");
	    String FairID=request.getParameter("FairID");
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
	    		var a="<%=FairID%>";
	    		alert("请填写完整数据");
	    		window.location='Job_FairModify.jsp?FairID='+a;
	        </script>
	    	<% 
	    	}
	    	else
	    	{
	    		CallableStatement st = conn.prepareCall("{call modify_Job_Fair(?,?,?,?,?,?,?)}");
		    	 st.setString(1, FairID);
		    	 st.setString(2, col1);
		    	 st.setString(3, col2);
		    	 st.setString(4, col3);
		    	 st.setString(5, col4);
		    	 st.setString(6, col5);
		    	 st.setString(7, col9);
		    	 st.executeUpdate();
	    %>
<script language="javascript">
	var a="<%=FairID%>";
		alert("修改成功");
		window.location='JobFairModify.jsp?FairID='+a;
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