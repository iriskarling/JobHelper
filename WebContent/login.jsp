<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
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
		try {
			 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			 String url="jdbc:sqlserver://localhost:1433;DatabaseName=JobHelper";

			 String user="sa";
			 String password="123456";
			 Connection conn=DriverManager.getConnection(url,user,password);
			 Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 		
			ResultSet rs;
			request.setCharacterEncoding("utf-8");
			String username = request.getParameter("username");
			String password1= request.getParameter("password");
			String cerCode=request.getParameter("cerCode");
			String permission = request.getParameter("permission");
			String cerCode2=session.getAttribute("cerCode").toString();
			String col = "";
			String department="";
			String name="";
			boolean flag =false;
			if(permission.equals("Student"))
			{
			rs = stmt.executeQuery("select Password,Department,StudentName from Student where StudentID='"+username+"'");
			if(rs.next()){
				boolean flag1=true;
				while(flag1){
					String pw=rs.getString(1);
					 department=rs.getString(2);
					 name=rs.getString(3);
					if(pw.equals(password1)){
						flag=true;
						break;
					}
					flag1=rs.next();
				}
				rs.close();
				if(flag == false)
				{%>
			 <script charset="gb2312" language="javascript" type="text/javascript" >
					alert("密码输入错误，请重新输入");
					window.location='LoginHTML.jsp';
				</script>
			<% 
				}
				else{
					if(cerCode.equals(cerCode2)){
						session.setAttribute("Student", username);
						session.setAttribute("Department", department);
						session.setAttribute("permission", permission);
						session.setAttribute("Name", name);
						%>
						<script charset="gb2312" language="javascript" type="text/javascript" >
							alert("成功登录");
							window.location='Home.jsp';
						</script><% 
				}
				else{
					%>
					<script charset="gb2312" language="javascript" type="text/javascript" >
							alert("验证码错误！");
							window.location='LoginHTML.jsp';
						</script>
					<% 
					
				}
				
			}
			}
			else{
				%>
				<script charset="gb2312" language="javascript" type="text/javascript" >
						alert("该用户不存在！");
						window.location='LoginHTML.jsp';
					</script>
				<% 
			}
			}
			else if(permission.equals("Assistant"))
			{
				rs = stmt.executeQuery("select Password,Department,AssistantName from Assistant where AssistantID='"+username+"'");
				if(rs.next()){
					boolean flag1=true;
					while(flag1){
						String pw=rs.getString(1);
						department=rs.getString(2);
						name=rs.getString(3);
						if(pw.equals(password1)){
							flag=true;
							break;
						}
						flag1=rs.next();
					}
					rs.close();
					if(flag == false)
					{%>
				 <script charset="gb2312" language="javascript" type="text/javascript" >
						alert("密码输入错误，请重新输入");
						window.location='LoginHTML.jsp';
					</script>
				<% 
					}
					else{
						if(cerCode.equals(cerCode2)){
							session.setAttribute("Student", username);
							session.setAttribute("Department", department);
							session.setAttribute("permission", permission);
							session.setAttribute("Name", name);
							%>
							<script charset="gb2312" language="javascript" type="text/javascript" >
								alert("成功登录");
								window.location='Home.jsp';
							</script><% 
					}
					else{
						%>
						<script charset="gb2312" language="javascript" type="text/javascript" >
								alert("验证码错误！");
								window.location='LoginHTML.jsp';
							</script>
						<% 
						
					}
					}
				}
				else{
					%>
					<script charset="gb2312" language="javascript" type="text/javascript" >
							alert("该用户不存在！");
							window.location='LoginHTML.jsp';
						</script>
					<% 
				}
				}
			stmt.close();
			conn.close();
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>
</body>
</html>