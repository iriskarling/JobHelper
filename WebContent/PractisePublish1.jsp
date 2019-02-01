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
	    	String col2=request.getParameter("company_name");
	    	
	    	String col3=request.getParameter("s_province");
	    	String col4=request.getParameter("s_city");
	    	String col5=request.getParameter("s_county");
	    	   String[] strArray=null;
	    	   strArray=request.getParameterValues("request");
	    	   String col6="";
	    	   if(strArray!=null){
	    	   for(int i=0;i<strArray.length;i++)
	    	   {
	    		   col6=col6+strArray[i]+";";
	    	   }
	    	   }
	    	String col7=request.getParameter("amount");  	
	    	String col8=request.getParameter("week");
	    	String col9=request.getParameter("month");
	    	String col10=request.getParameter("Description");
	    	
	    	if(col1.equals("")||col2.equals("")||col3.equals("省份")||col10.equals(""))
	    	{
	    		
	    	%>
	 <script language="javascript">
		alert("请输入完整数据");
		window.location='PractisePublish.jsp';
	</script>
	    	<% 
	    	}
	    	else
	    	{
	    		 CallableStatement st = conn.prepareCall("{call insert_practise(?,?,?,?,?,?,?,?,?,?,?,?)}");
		    	 st.setString(1, col1);
		    	 st.setString(2, col10);
		    	 st.setString(3, col6);
		    	 st.setString(4, col8);
		    	 st.setString(5, col9);
		    	 st.setString(6, username);
		    	 st.setString(7, col2);
		    	 st.setString(8, col3);
		    	 st.setString(9, col4);
		    	 st.setString(10, col5);
		    	 st.setString(11, col7);
		    	 st.setString(12, department);
		    	 st.executeUpdate();
	    		/*if(col6.equals(""))
	    			col6="不限";
	    		else if(col7.equals(""))
	    			col7="0";
	    		
	    		else if(col4.equals("地级市"))
	    			col4="";
	    		else if(col5.equals("市、县级市"))
	    			col5="";
	    		int a=Integer.parseInt(col7);
	    	String companyID="";
	    	ResultSet rs1=stmt.executeQuery("select CompanyID from Company where CompanyName='"+col2+"'");
	    	while(rs1.next()){
	    		companyID=rs1.getString(1);
	    	}
	       
	    	ResultSet rs;
	    	
	    	rs = stmt.executeQuery("select count(*) from Practise where AssistantID='"+username+"'");
	    	int i=0;
	    	while(rs.next())
	    	{
	    		i=rs.getInt(1);
	    	}
			String rid = "";
			String cid="";
			i++;
			cid= Integer.toString(i);
			rid = username+".a"+cid;
			
	    	stmt.executeUpdate("insert into Practise (PractiseID,AssistantID,Position,CompanyID,CompanyName,Province,City,Distriction,Request,Amount,TimesAWeek,MonthsAmount,PublishTime,Department,Description,Collection)values('"+rid+"','"
	    	+username+"','"
	    	+col1+"','"+companyID+"','"+col2+"','"
	    	+col3+"','"+col4+"','"
	    	+col5+"','"+col6+"',"
	    	+a+",'"+col8+"','"
	    	+col9+"','"+str_date1+"','"+department+"','"+col10+"',"+0+")");

	    rs.close();*/
	 
	    %>
	<script language="javascript">
		alert("发布成功");
		window.location='PractisePublish.jsp';
	</script>
	<%

			conn.close();
	    	}
	//	} catch (Exception e) {
	//		out.println(e.getMessage());
	
	//	}
		
	%>
</body>
</html>