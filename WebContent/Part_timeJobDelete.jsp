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
String Part_timeJobID="";
String Part_timeJobID2=request.getParameter("Part_timeJobID");

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:sqlserver://localhost:1433;DatabaseName=JobHelper";
String user="sa";
String password="123456";
Connection conn=DriverManager.getConnection(url,user,password);
CallableStatement st = conn.prepareCall("{call delete_part_timejob(?)}");
st.setString(1, Part_timeJobID2);
st.executeUpdate();
st.close();
conn.close();
%>
<script charset="gb2312" language="javascript" type="text/javascript" >
        var id="<%=Part_timeJobID2%>";
		alert("删除成功！");
		window.location.href ="MyPublish.jsp?Part_timeJobID="+id;
	</script>
</body>
</html>