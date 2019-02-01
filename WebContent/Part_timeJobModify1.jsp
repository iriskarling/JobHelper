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
	    String Part_timeJobID=request.getParameter("Part_timeJobID");
	    	 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    	 String url="jdbc:sqlserver://localhost:1433;DatabaseName=JobHelper";

	    	 String user="sa";
	    	 String password="123456";
	    	 Connection conn=DriverManager.getConnection(url,user,password);		
	    	
	    	request.setCharacterEncoding("utf-8");	
	    	response.setCharacterEncoding("utf-8");
	    	
	    	String col1=request.getParameter("title");
	    	col1 = new String(col1.getBytes("ISO8859-1"),"UTF-8"); 
	    	String col2=request.getParameter("type");
	    	col2 = new String(col2.getBytes("ISO8859-1"),"UTF-8"); 
	    	String col3=request.getParameter("district");
	    	col3 = new String(col3.getBytes("ISO8859-1"),"UTF-8"); 
	    	String col4=request.getParameter("startDate");
	    	col4 = new String(col4.getBytes("ISO8859-1"),"UTF-8"); 
	    	String col5=request.getParameter("endDate");
	    	col5 = new String(col5.getBytes("ISO8859-1"),"UTF-8"); 
	    	String col6=request.getParameter("startTime");
	    	col6= new String(col6.getBytes("ISO8859-1"),"UTF-8"); 
	    	String col7=request.getParameter("endTime");
	    	col7 = new String(col7.getBytes("ISO8859-1"),"UTF-8");
	    	String col8=request.getParameter("salary");
	    	col8 = new String(col8.getBytes("ISO8859-1"),"UTF-8"); 
	    	String col9=request.getParameter("Description");
	    	col9 = new String(col9.getBytes("ISO8859-1"),"UTF-8"); 
	   
	    	if(col1.equals("")||col3.equals("")||col4.equals("")||col5.equals("")||col9.equals(""))
	    	{
	    		
	    	%>
	    	<script language="javascript">
	    		var a="<%=Part_timeJobID%>";
	    		alert("请填写完整数据");
	    		window.location='Part_timeJobModify.jsp?Part_timeJobID='+a;
	       </script>
	    	<% 
	    	}
	    	else
	    	{
	    		CallableStatement st = conn.prepareCall("{call modify_part_timejob(?,?,?,?,?,?,?,?,?,?)}");
		    	 st.setString(1, Part_timeJobID);
		    	 st.setString(2, col1);
		    	 st.setString(3, col2);
		    	 st.setString(4, col3);
		    	 st.setString(5, col4);
		    	 st.setString(6, col5);
		    	 st.setString(7, col6);
		    	 st.setString(8, col7);
		    	 st.setString(9, col8);
		    	 st.setString(10, col9);
		    	 st.executeUpdate();
           
	    %>
<script language="javascript">
	var a="<%=Part_timeJobID%>";
		alert("修改成功");
		window.location='Part_timeJobModify.jsp?Part_timeJobID='+a;
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