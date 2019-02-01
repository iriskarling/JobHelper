<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import= "test.* "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--<jsp:useBean id="image" scope="page" class="test.Image"/>-->
<%
 String str = image.getCertPic(0,0,response.getOutputStream());
 //将验证码存入session中
 session.setAttribute("cerCode",str);
%>
<script type="text/javascript">
function changeimg()
{

var myimg = document.getElementById("code"); 
now = new Date(); 
myimg.src="CerCodeRealize.jsp?code="+now.getTime();
} 
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>