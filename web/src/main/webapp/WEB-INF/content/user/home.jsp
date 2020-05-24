<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<%-- 基础环境 --%>
	<script type="text/javascript" src="<%=path%>/assets/libs/jquery-1.10.1.min.js"></script>
	
	<%-- jQuery图像裁剪插件 --%>
	<script type="text/javascript" src="<%=path%>/assets/cropper/cropper.min.js"></script>
	<link rel="stylesheet" href="<%=path %>/assets/cropper/cropper.min.css">
	
	<!-- layer -->
    <link href="${res}/layer/skin/layer.css" rel="stylesheet">
    <script src="${res}/layer/layer.js" type="text/javascript"></script>
	
	<%-- 妹子UI --%>
	<script src="<%=path%>/assets/amazeui/js/amazeui.min.js"></script>
  	<link rel="stylesheet" href="<%=path %>/assets/amazeui/css/amazeui.min.css"/>

	<script type="text/javascript" src="${res}/canvas-to-blob.js"></script>
	
<style>
.img-circle{
	border: 5px solid #000;
	border-radius:50%;
	width:150px;
	height: 150px;
}
.img-rounded{
	border: 5px solid #000;
	border-radius:10px;
	width:150px;
	height: 150px;
}
.img-preview {
  float: left;
  margin-right: 10px;
  margin-bottom: 10px;
  overflow: hidden;
}

.img-preview > img {
  max-width: 100%;
}

.preview-lg {
  width: 263px;
  height: 148px;
}

.preview-md {
  width: 139px;
  height: 78px;
}

.preview-sm {
  width: 69px;
  height: 39px;
}

.preview-xs {
  width: 35px;
  height: 20px;
  margin-right: 0;
}
</style>

  </head>
  
  <body>
    <hr>
	头像：
	<img class="utx img-circle" src="${path }/upload/user/${sessionScope.loginInfo.icon}"/>

	<img class="utx img-rounded" src="${sessionScope.loginInfo.icon}"/>
	<button id="btn3">更换头像</button>
<hr>
<button id="btn4">编辑器</button>
<script type="text/javascript">
$(function(){

$('#btn3').click(function(){
	window.layer_user_icon_update=
	layer.open({
      type: 2,
      title: '添加数据',
      shadeClose: false,
      shade: 0.3,
      maxmin: false, //开启最大化最小化按钮
      area: ['600px', '450px'],
      content: '${path}/user/update_icon.html'
    });
});

$('#btn4').click(function(){
	layer.open({
	      type: 2,
	      title: '网页编辑器',
	      shadeClose: false,
	      shade: 0.3,
	      maxmin: true, //开启最大化最小化按钮
	      area: ['600px', '450px'],
	      content: 'http://jsbin.com/'
	    });
});



});
</script>


  </body>
</html>
