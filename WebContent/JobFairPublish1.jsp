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

	    	 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    	 String url="jdbc:sqlserver://localhost:1433;DatabaseName=JobHelper";

	    	 String user="sa";
	    	 String password="123456";
	    	 Connection conn=DriverManager.getConnection(url,user,password);    	 		
	    	
	    	request.setCharacterEncoding("utf-8");	
	    	response.setCharacterEncoding("utf-8");	    	
	    	
	    	String col1=request.getParameter("title");
	    	String col2=request.getParameter("location");
	 
	    	String col4=request.getParameter("startDate");
	 
	    	String col6=request.getParameter("startTime");
	    	String col7=request.getParameter("endTime");
	    	
	    	String col9=request.getParameter("Description");
	    	
	    	if(col1.equals("")||col2.equals("")||col4.equals("")||col9.equals(""))
	    	{
	    		
	    	%>
	<script language="javascript">
		alert("请输入完整数据");
		window.location='TalkPublish.jsp';
	</script>
	    	<% 
	    	}
	    	else
	    	{
	    		CallableStatement st = conn.prepareCall("{call insert_JobFair(?,?,?,?,?,?,?)}");
		    	 st.setString(1, username);
		    	 st.setString(2, col1);
		    	 st.setString(3, col2);
		    	 st.setString(4, col4);
		    	 st.setString(5, col6);
		    	 st.setString(6, col7);
		    	 st.setString(7, col9);
		    	 st.executeUpdate();
	    	 /*if(col6.equals(""))
	    			col6="";
	    		else if(col7.equals(""))
	    			col7="";
	    		
	    			
	    	ResultSet rs;
	    	
	    	rs = stmt.executeQuery("select count(*) from Job_Fair where AssistantID='"+username+"'");
	    	int i=0;
	    	while(rs.next())
	    	{
	    		i=rs.getInt(1);
	    	}
			String rid = "";
			String cid="";
			i++;
			cid= Integer.toString(i);
			rid = username+".e"+cid;
			
	    	stmt.executeUpdate("insert into Job_Fair(FairID,AssistantID,Title,Location,Date,StartTime,EndTime,Description,PublishTime)values('"+rid+"','"
	    	+username+"','"
	    	+col1+"','"+col2+"','"
	    	+col4+"','"+col6+"','"
	    	+col7+"','"+col9+"','"+str_date1+"')");

	    rs.close();*/
	 
	    %>
	<script language="javascript">
		alert("发布成功");
		window.location='JobFairPublish.jsp';
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