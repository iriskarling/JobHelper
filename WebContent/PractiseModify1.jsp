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
	    String PractiseID=request.getParameter("PractiseID");
	    	 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    	 String url="jdbc:sqlserver://localhost:1433;DatabaseName=JobHelper";

	    	 String user="sa";
	    	 String password="123456";
	    	 Connection conn=DriverManager.getConnection(url,user,password); 		
	    	
	    	request.setCharacterEncoding("utf-8");	
	    	response.setCharacterEncoding("utf-8");

	    	String col1=request.getParameter("title");
	    	col1 = new String(col1.getBytes("ISO8859-1"),"UTF-8"); 
	    	String col2=request.getParameter("company_name");
	        col2 = new String(col2.getBytes("ISO8859-1"),"UTF-8"); 
	    	
	    	
	    	  String[] strArray=null;
	    	   strArray=request.getParameterValues("request");
	    	   String col3="";
	    	   for(int i=0;i<strArray.length;i++)
	    	   {
	    		   col3=col3+strArray[i]+";";
	    	   }
	    	col3 = new String(col3.getBytes("ISO8859-1"),"UTF-8"); 
	    	String col4=request.getParameter("amount");
	    	col4 = new String(col4.getBytes("ISO8859-1"),"UTF-8"); 
	    	String col5=request.getParameter("week");
	    	col5 = new String(col5.getBytes("ISO8859-1"),"UTF-8"); 
	    	String col6=request.getParameter("month");
	    	col6 = new String(col6.getBytes("ISO8859-1"),"UTF-8");
	    	String col9=request.getParameter("Description");
	    	col9 = new String(col9.getBytes("ISO8859-1"),"UTF-8"); 
	   
	    	if(col1.equals("")||col2.equals("")||col9.equals(""))
	    	{
	    		
	    	%>
	    		<script language="javascript">
	    		var a="<%=PractiseID%>";
	    		alert("请填写完整数据");
	    		window.location='PractiseModify.jsp?PractiseID='+a;
	</script>
	    	<% 
	    	}
	    	else
	    	{
	    		CallableStatement st = conn.prepareCall("{call modify_practise(?,?,?,?,?,?,?,?)}");
		    	 st.setString(1, PractiseID);
		    	 st.setString(2, col1);
		    	 st.setString(3, col9);
		    	 st.setString(4, col3);
		    	 st.setString(5, col5);
		    	 st.setString(6, col6);
		    	 st.setString(7, col2);
		    	 st.setString(8, col4);
		    	 st.executeUpdate();
	    %>
<script language="javascript">
	var a="<%=PractiseID%>";
		alert("修改成功");
		window.location='PractiseModify.jsp?PractiseID='+a;
	</script>
	<%

		    st.close();
			conn.close();
	    	}
	//	} catch (Exception e) {
	//	out.println(e.getMessage());
	
		//}
		
	%>
</body>
</html>