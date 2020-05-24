<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="/jeelite-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'demo.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<f:base type="jquery,bootstrap,layer,bootstrap-table,animate,font-awesome,pace"></f:base>
	<f:base type="jquery.slimscroll"></f:base>
	
  </head>
  
  <body>
    This is my JSP page. <br>
    <img alt="" src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1492459055592&di=b6c599df6585e814b389c596e1878375&imgtype=0&src=http%3A%2F%2Fwww.bz55.com%2Fuploads%2Fallimg%2F150804%2F140-150P4104G7.jpg">

  </body>
</html>
