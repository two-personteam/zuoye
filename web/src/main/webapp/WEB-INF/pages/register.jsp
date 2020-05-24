<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title>用户注册</title>
    
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
	<script type="text/javascript" src="${res }/cityloader/jquery.cityloader.js"></script>
	
<style type="text/css">
.container{
  	width:700px;margin-left:auto;margin-right:auto;
}
.am-input-group{
	width:100%;
	margin-bottom: 5px;
}
.am-input-group > .am-input-group-label{
	width: 150px;
	text-align: left;
}
</style>
  </head>
  
  <body>
    
<jsp:include page="/WEB-INF/content/user/header.jsp"></jsp:include>
    
<div class="container">
	
    <form action="<%=path %>/user!save.action" method="post" data-am-validator class="am-form" >
    	<div class="am-input-group">
		  <span class="am-input-group-label">
		  	<i class="am-icon-user am-icon-fw"></i>
		  	账号
		  </span>
		  <input name="username" type="text" class="am-form-field" placeholder="请输入用户名" required>
		</div>
    	<div class="am-input-group">
		  <span class="am-input-group-label">
		  	<i class="am-icon-user am-icon-fw"></i>
		  	邮箱
		  </span>
		  <input name="email" type="text" class="am-form-field" placeholder="请输入用户名" required>
		</div>
    	<div class="am-input-group">
		  <span class="am-input-group-label">
		  	<i class="am-icon-user am-icon-fw"></i>
		  	密码
		  </span>
		  <input name="password" type="password" class="am-form-field" placeholder="请输入用户名" required>
		</div>
		<div class="am-input-group">
		  <span class="am-input-group-label">
		  	<i class="am-icon-user am-icon-fw"></i>
		  	真实姓名
		  </span>
		  <input name="realname" type="text" class="am-form-field" placeholder="请输入用户名">
		</div>
		
		<button id="bt1" type="button" class="am-btn am-btn-primary">提交注册</button>
    	<a href="${path }/login.html">去登录</a>
    </form>
</div>
<script type="text/javascript">
$(function(){
	
	$('#bt1').click(function(){

		$.post('<%=path%>/register.do',$('form').serialize(),function(data){
			if(data=='success'){
				alert('注册成功');
				//location.href='xxxxx';
			}
			if(data=='HasUsername'){
				alert('注册失败，用户名已被使用！');
			}
			if(data=='6'){
				alert('注册失败，邮箱已被使用！');
			}
			if(data=='4'){
				alert('注册失败，密码不合法！');
			}
			if(data=='3'){
				alert('注册失败，邮箱格式有问题！');
			}
			if(data=='2'){
				alert('注册失败，账号不合法！');
			}
		});
		
	});
	
});
</script>
  </body>
</html>
