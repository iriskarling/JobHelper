<%@ page language="java" import="java.util.*" contentType="text/html; charset=gb2312" pageEncoding="gbk"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<!doctype html>
        <!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en-US"> <![endif]-->
        <!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en-US"> <![endif]-->
        <!--[if IE 8]>    <html class="lt-ie9" lang="en-US"> <![endif]-->
        <!--[if gt IE 8]><!--> <html lang="en-US"> <!--<![endif]-->
        <head>
                <!-- META TAGS -->
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
        <title>Job Helper</title>

                                          
              <style type="text/css">
<!--
.STYLE1 {
	font-size: 36px;
	font-weight: bold;
	font-family: "��������";
	color: #333333;
}
-->
              </style>                             
                                           

                <!-- Style Sheet-->
                <link rel="stylesheet" href="carousel.css"/>
                <link rel="stylesheet" href="style.css"/>
                <link rel='stylesheet' id='bootstrap-css-css'  href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='responsive-css-css'  href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
               
                <link rel='stylesheet' id='main-css-css'  href='css/main5152.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='custom-css-css'  href='css/custom5152.html?ver=1.0' type='text/css' media='all' />
               <script src="laydate/laydate.js"></script>
                <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
                <!--[if lt IE 9]>
                <script src="js/html5.js"></script></script>
                <![endif]-->

                <style type="text/css">
<!--
.STYLE2 {
	font-family: "��������";
	font-size: 18px;
}
.STYLE7 {
	font-family: "Microsoft YaHei UI";
	font-size: 16px;
}
-->
                </style>
        </head>

        <body>
 <%
 try{
	 String StudentID = (String) session.getAttribute("Student");
	 String studentName = (String) session.getAttribute("Name");
                      String ProjectID2=request.getParameter("ProjectID");
	                                    String username = (String) session.getAttribute("Student");
	                                        String permission = (String) session.getAttribute("permission");
                                                       Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                          	    	 String url="jdbc:sqlserver://localhost:1433;DatabaseName=JobHelper";
                                          	    	 String user="sa";
                                          	    	 String password="123456";
                                          	    	 Connection conn=DriverManager.getConnection(url,user,password);
                                          	    	 Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 		
                                          	    	ResultSet rs;
                                          	    	request.setCharacterEncoding("utf-8");	
                                          	    	response.setCharacterEncoding("utf-8");
                                          	    	  
                                                       %>
                <!-- Start of Header -->
                <div class="header-wrapper">
                        <header>
                                <div class="container">


                                        <div class="logo-container">
                                               
                                                                  
                                           <font size="6px">   <b>  Job Helper</b></font>
                                               
                                        </div>


                                     
                                        <!-- Start of Main Navigation -->
                                      <nav class="main-nav">
                                                <div class="menu-top-menu-container">
                                                        <ul id="menu-top-menu" class="clearfix">
                                                      <li>Hello!&nbsp;<%=studentName %>&nbsp;[<%=StudentID %>]</li>
                                                      
                                                                <li class="current-menu-item"><a href="Home.jsp">��ҳ</a></li>
                       
                                                                <li><a href="#">��Ƹ��Ϣ</a>
                                                                        <ul class="sub-menu">
                                                                                <li><a href="PracticeJob.jsp">ʵϰ</a></li>
                                                                                <li><a href="Part_timeJob.jsp">��ְ</a></li>
                                                                                <li><a href="Project.jsp">���</a></li>
                                                                            
                                                                        </ul>
                                                                </li>
                                                                 </li>
                                                                <li><a href="#">��Ϣ��</a>
                                                                        <ul class="sub-menu">
                                                                                 <li><a href="Talk.jsp">������</a></li>
                                                                                <li><a href="JobFair.jsp">��Ƹ��</a></li>
                                                                              
                                                                        </ul>
                                                                </li>
                                                                         <li><a href="#">��Ҫ����</a>
                                                                        <ul class="sub-menu">
                                               <%if (permission.equals("Assistant")){ 
                                                                                   %>
                                                                       <li> <a href="PractisePublish.jsp">ʵϰ</a></li>
                                                                        <li> <a id="link1" href="TalkPublish.jsp" >������</a></li>
                                                                                 <li> <a id="link2" href="JobFairPublish.jsp">��Ƹ��</a></li>
                                                                       <% }%>
                                                                                <li><a href="Part_timeJobPublish.jsp">��ְ</a></li>
                                                                                <li><a href="ProjectPublish.jsp">���</a></li>
                                                                              

                                                                            
                                                                        </ul>
                                                               </li>
                                                               
                                                                                  <li><a href="#">�ҵ���Ϣ</a>
                                                                          <ul class="sub-menu">
                                                                                <%if (permission.equals("Student")){ 
                                                                                   %>
                                                                                   <li><a href="MyCollect.jsp">�ҵ��ղ�</a></li>
                                                                              
                                                                       <li><a href="MySend.jsp">�ҵ�Ͷ��</a></li>
                                                                                  <% }%>
                                                                               <li><a href="MyPublish.jsp">�ҵķ���</a></li>
                                                                        </ul>
                                                                </li>
                                                                 <li><a href="LoginHTML.jsp">�˳�</a></li>

                                                        </ul>
                                                </div>
                                        </nav>
                                        <!-- End of Main Navigation -->
                                </div>
                        </header>
                </div>
                <!-- End of Header -->


                <!-- Start of Page Container -->
                
                
                

             


                                      
                                             
 <p>&nbsp;</p>
<p>&nbsp;</p>
<p align="center" class="STYLE1">�޸���Ŀ��Ϣ</p>
<p align="center"class="STYLE2">     &nbsp;&nbsp;&nbsp;*Ϊ������Ϣ</p>
<div align="center">
  <form name="form1" method="post" action="ProjectModify1.jsp">
  <table width="730" height="408" border="0">
    <tr>
      <td width="120"><span class="STYLE2">���� *</span></td>
       <%
                                                  rs = stmt.executeQuery("select Title,Type,Grade,StartDate,EndDate,Description,ProjectID,Major from Project where ProjectID='"+ProjectID2+"'");
												       String col1 = "";
												       String col2=  "";
												       String col3 =  "";
												       String col4 =  "";
												       String col5 =  "";
												       String col6 =  "";
												       String col7 =  "";
												       String col8 =  "";
                                                  while(rs.next()){
		                                                          col1 = rs.getString(1);
		                                                          col2= rs.getString(2);
		                                                           col3 = rs.getString(3);
		                                                           col4 = rs.getString(4);
		                                                           col5 = rs.getString(5);
		                                                           col6 = rs.getString(6);
		                                                          col7 = rs.getString(7);
		                                                          col8 = rs.getString(8);
                                                  }
                                                  rs.close();
		                                                      
				                                                                      %>
      <td width="600"><input type="text" name="title" value="<%=col1 %>"/></td>
    </tr>
     <tr>
      <td><span class="STYLE2"> </span></td>
      <td><input type="hidden"name="ProjectID" value="<%=col7%>" /></td>
    </tr>
    <tr>
      <td><span class="STYLE2">�������� </span></td>
      <td><select name="type">
      <option value="ѧ�ƾ�����"<% if(col2.equals("ѧ�ƾ�����")) out.print( "selected");%>>ѧ�ƾ�����</option>
      <option value="���ʵ����"<% if(col2.equals("���ʵ����")) out.print( "selected");%>>���ʵ����</option>
      <option value="ʵ����/��Ŀ"<% if(col2.equals("ʵ����/��Ŀ")) out.print( "selected");%>>ʵ����/��Ŀ</option>
      <option value="����"<% if(col2.equals("����")) out.print( "selected");%>>����</option>
      </select></td>
    </tr>
    <tr>
      <td><span class="STYLE2">ѧ��Ҫ�� </span></td>
      <td><select name="grade">
      <option value="����"<% if(col3.equals("����")) out.print( "selected");%>>����</option>
        <option value="��һ������"<% if(col3.equals("��һ������")) out.print( "selected");%>>��һ������</option>
          <option value="���������"<% if(col3.equals("���������")) out.print( "selected");%>>���������</option>
            <option value="����������"<% if(col3.equals("����������")) out.print( "selected");%>>����������</option>
              <option value="���ļ�����"<% if(col3.equals("���ļ�����")) out.print( "selected");%>>���ļ�����</option>
                <option value="��һ������"<% if(col3.equals("��һ������")) out.print( "selected");%>>��һ������</option>
                  <option value="�ж�������"<% if(col3.equals("�ж�������")) out.print( "selected");%>>�ж�������</option>
                    <option value="����������"<% if(col3.equals("����������")) out.print( "selected");%>>����������</option>
                    
      </select>    </td>
    </tr>
    <tr>
      <td><span class="STYLE2">����ʱ�� *</span></td>
      <td><span class="STYLE2">
    ��ʼ��<input class="inline laydate-icon" id="start" name="startDate" style="width:200px; margin-right:10px;" value="<%=col4%>"/><br>
    <br>������<input class="inline laydate-icon" id="end" name="endDate" style="width:200px;"value="<%=col5 %>"/>
      </span></td>
    </tr>
    <tr>
      <td><span class="STYLE2">רҵҪ��</span></td>
      <td><select name="major">
      <option value="����" <% if(col8.equals("����")||col8.equals("")) out.print( "selected");%>>����</option>
      <%
    
      rs=stmt.executeQuery("select Department from Major");
      while(rs.next())
      {
    	  String   col=rs.getString(1);
      
      %>
	  <option value="<%=col%>"<% if(col8.equals(col)) out.print( "selected");%>><%=col %></option>
	  <% 
	  }
	    rs.close();
	  %>
       
      </select></td>
    </tr>
    <tr>
      <td><span class="STYLE2">��ϸ���� *</span></td>
      <td><textarea name="Description" cols="200" rows="6" style="resize: none;width: 600px;
height: 600px;
max-width: 380px;
max-height: 150px"><%=col6 %></textarea></td>
    </tr>
  </table>
  <%
                                                

		stmt.close();
			conn.close();
 } catch (Exception e) {
			out.println(e.getMessage());
		
		}
			

	%>   
</div>
<p align="center">
   <input type="submit" name="Submit" style="width:100px;height:35px;font-family:'Microsoft YaHei';font-size:18px;" class="btn"  value="�޸�" />
</p>
        </form>                
  
        <script>
!function(){
laydate.skin('default');//�л�Ƥ������鿴skins����Ƥ����
laydate({elem: '#demo'});//��Ԫ��
}();
//���ڷ�Χ����
var start = {
    elem: '#start',
    format: 'YYYY-MM-DD',
    min: laydate.now(), //�趨��С����Ϊ��ǰ����
    max: '2099-06-16', //�������
    istime: true,
    istoday: false,
    choose: function(datas){
         end.min = datas; //��ʼ��ѡ�ú����ý����յ���С����
         end.start = datas //�������յĳ�ʼֵ�趨Ϊ��ʼ��
    }
};
var end = {
    elem: '#end',
    format: 'YYYY-MM-DD',
    min: laydate.now(),
    max: '2099-06-16',
    istime: true,
    istoday: false,
    choose: function(datas){
        start.max = datas; //������ѡ�ú󣬳�ֵ��ʼ�յ��������
    }
};
laydate(start);
laydate(end);
//�Զ������ڸ�ʽ
laydate({
    elem: '#test1',
    format: 'YYYY��MM��DD��',
    festival: true, //��ʾ����
    choose: function(datas){ //ѡ��������ϵĻص�
        alert('�õ���'+datas);
    }
});
//���ڷ�Χ�޶������쵽����
laydate({
    elem: '#hello3',
    min: laydate.now(-1), //-1�������죬-2����ǰ�죬�Դ�����
    max: laydate.now(+1) //+1�������죬+2������죬�Դ�����
});
</script>     

                <a href="#top" id="scroll-top"></a>

               <!-- script -->
                <script type='text/javascript' src='js/jquery-1.8.3.min.js'></script>
                <script type='text/javascript' src='js/jquery.easing.1.3.js'></script>
                <script type='text/javascript' src='js/prettyphoto/jquery.prettyPhoto.js'></script>
                <script type='text/javascript' src='js/jflickrfeed.js'></script>
				<script type='text/javascript' src='js/jquery.liveSearch.js'></script>
                <script type='text/javascript' src='js/jquery.form.js'></script>
                <script type='text/javascript' src='js/jquery.validate.min.js'></script>
                <script type='text/javascript' src='js/custom.js'></script>

        <div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>