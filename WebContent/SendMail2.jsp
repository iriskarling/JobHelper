<%@page import="java.io.*"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.activation.*"%>
<%@page import="SendMail.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>Insert title here</title>
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
<jsp:useBean id="mail" scope="page" class="SendMail.SendMail2"/> 
<body>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String from="j2ee14@163.com";
System.out.print(from);
String to=request.getParameter("to");
System.out.print(to);
String Subject=request.getParameter("topic");
System.out.print(Subject);
//Subject = new String(Subject.getBytes("ISO8859-1"),"UTF-8"); 
String location=request.getParameter("file");
System.out.print(location);
//location = new String(location.getBytes("ISO8859-1"),"UTF-8"); 
String fileName=location.substring(location.lastIndexOf("\\")+1);
//String fileName="a.txt";
//fileName = new String(fileName.getBytes("ISO8859-1"),"UTF-8"); 
System.out.print(fileName);
String host="smtp.163.com";
String username="j2ee14";
String password="14j2ee";
mail.setAddress(from,to,Subject);
mail.setAffix(location,fileName);
mail.send(host,username,password);

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:sqlserver://localhost:1433;DatabaseName=JobHelper";
String user="sa";
String password2="123456";
Connection conn=DriverManager.getConnection(url,user,password2);
Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
String practiseID=request.getParameter("practise");
String StudentID=session.getAttribute("Student").toString();
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

java.util.Date currentTime = new java.util.Date();//得到当前系统时间

String str_date1 = formatter.format(currentTime); //将日期时间格式化
String sql="insert into Send_Mail (StudentID,PractiseID,SendTime,FileName,Topic)values('"+StudentID+"','"+practiseID+"','"+str_date1+"','"+fileName+"','"+Subject+"')";
stmt.executeUpdate(sql);
stmt.close();
conn.close();
%>
<script charset="gb2312" language="javascript" type="text/javascript" >
       var a="<%=to%>";
       var b="<%=practiseID%>";
		alert("发送成功！");
		window.location.href ="sendmail.jsp?email="+a+"&PractiseID="+b;
	</script>
</body>
</html>