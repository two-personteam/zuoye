<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>尚未激活</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<%=path%>/assets/amazeui/css/amazeui.min.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/assets/layer/skin/layer.css">
	<script type="text/javascript" src="<%=path%>/assets/libs/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="<%=path%>/assets/amazeui/js/amazeui.min.js"></script>
	<script type="text/javascript" src="<%=path%>/assets/layer/layer.js"></script>
	
	<script type="text/javascript" src="<%=path%>/assets/laypage/laypage.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=path%>/assets/laypage/skin/laypage.css">

  </head>
  
  <body>
   
您好，您的账号尚未激活，请到您留的邮箱中激活！<br>
账号：${requestScope.user.username }<br>
邮箱：${requestScope.user.email }<br>
<a href="<%=path%>/login!index.html">重新登录</a>
<script type="text/javascript">

</script>

  </body>
</html>
