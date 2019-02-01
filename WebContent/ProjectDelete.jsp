<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@ page import="java.text.*"%> 
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete</title>
</head>
<body>
<%
String ProjectID="";
String ProjectID2=request.getParameter("ProjectID");
String StudentID = session.getAttribute("Student").toString();

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:sqlserver://localhost:1433;DatabaseName=JobHelper";
String user="sa";
String password="123456";
Connection conn=DriverManager.getConnection(url,user,password);
CallableStatement st = conn.prepareCall("{call delete_project(?)}");
st.setString(1, ProjectID2);
st.executeUpdate();
st.close();
conn.close();
%>
<script charset="gb2312" language="javascript" type="text/javascript" >
        var id="<%=ProjectID2%>";
		alert("删除成功！");
		window.location.href ="MyPublishProject.jsp?ProjectID="+id;
	</script>
</body>
</html>