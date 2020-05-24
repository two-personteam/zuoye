<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src='<%=path %>/dwr/engine.js'></script>
	<script src='<%=path %>/dwr/util.js'></script>
	<script src='<%=path %>/dwr/interface/md5.js'></script>
	
  </head>
  
  <body>
  
  <h1>这是一个欢迎页，可以在这里顺便打个广告，</h1>
  <h1>为了降低违和感，建议放一些生活小提示，</h1>
  HelloWorld
    
    <a href="<%=path%>/dev/CreateCode.html">代码生成器</a>
    <a href="<%=path %>/login.html" >去登录</a>
    <a href="<%=path %>/register.html" >去注册</a>
    <a href="<%=path %>/user!active.html?user.id=6&user.activeCode=387188" >激活6号</a>
    <a href="<%=path %>/assets/hplus4.2/index.html" >hplus4.2</a>
    <hr>
    <a href="${path }/manager/index.html" >后台首页</a>
    <a href="${path }/chat.jsp" >聊天测试</a>
    <hr>
    <a href="${path }/demo/oss_demo.html">OSS-DEMO-1</a>
    <a href="${path }/demo/oss_demo2.html">OSS-DEMO-2</a>
    
    
  </body>
</html>
