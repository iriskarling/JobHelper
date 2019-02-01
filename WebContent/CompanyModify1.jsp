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
   	 System.out.print(PractiseID);
	    
	    	 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    	 String url="jdbc:sqlserver://localhost:1433;DatabaseName=JobHelper";

	    	 String user="sa";
	    	 String password="123456";
	    	 Connection conn=DriverManager.getConnection(url,user,password);
	    	 Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 		
	    	request.setCharacterEncoding("utf-8");	
	    	response.setCharacterEncoding("utf-8");

	    	String col1=request.getParameter("company");
	        col1 = new String(col1.getBytes("ISO8859-1"),"UTF-8");
	    	String col2=request.getParameter("name");
	    	col2 = new String(col2.getBytes("ISO8859-1"),"UTF-8");
	    	String col3=request.getParameter("email");
	    	col3 = new String(col3.getBytes("ISO8859-1"),"UTF-8");
	    	String col4=request.getParameter("phone");
	    	col4 = new String(col4.getBytes("ISO8859-1"),"UTF-8");
	    	String col9=request.getParameter("Description");
	    	col9 = new String(col9.getBytes("ISO8859-1"),"UTF-8");
	    	String col5=request.getParameter("CompanyID");
	    	col5 = new String(col5.getBytes("ISO8859-1"),"UTF-8");
	    	 ResultSet rs=stmt.executeQuery("select CompanyName from Company where CompanyID='"+col5+"'");
	    	 String company_name="";
	    	 while(rs.next()){
	    		 company_name=rs.getString(1);
	    	 } 
	    	 
	    	if(col1.equals("")||col9.equals(""))
	    	{	
	    	%>
	 <script language="javascript">
	    var c="<%=company_name%>"
		alert("请输入完整数据");
		window.location='CompanyModify.jsp?company_name='+c;
	</script>
	    	<% 
	    	}
	    	else
	    	{
	    		CallableStatement st = conn.prepareCall("{call modify_company(?,?,?,?,?,?)}");
		    	 st.setString(1, col5);
		    	 st.setString(2, col1);
		    	 st.setString(3, col2);
		    	 st.setString(4, col3);
		    	 st.setString(5, col4);
		    	 st.setString(6, col9);
		    	 st.executeUpdate();
		    	 st.close();
	    	}
	if(PractiseID.equals("id"))
		{
		%><script language="javascript">
		var b="<%=col1%>";
		alert("修改成功");
		window.location='CompanyModify.jsp?company_name='+b;
		</script><% 
		
		
		}
	else{
		%>
		<script language="javascript">
		var a="<%=PractiseID%>";
		alert("修改成功");
		window.location='PractiseModify.jsp?PractiseID='+a;
		</script>
	   <%
	   }
		stmt.close();
		conn.close();
	    	
	//	} catch (Exception e) {
	//	out.println(e.getMessage());
	
	//}
		
	%>
</body>
</html>