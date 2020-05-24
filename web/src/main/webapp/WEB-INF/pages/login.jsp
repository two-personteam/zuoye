<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户登录</title>
    
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
    
<jsp:include page="/WEB-INF/content/user/header.jsp"></jsp:include>

<div style="width: 400px;margin-left: auto;margin-right: auto;">

<h1>用户登录</h1>
<form action="<%=path%>/user!ajaxlogin.html" method="post">
	账号：<input id="user" value="Master.Xia"><br>
	密码：<input id="pass" value="123456"><br>
	验证：<input id="code" style="width:60px;" >
	<img id="yzm" style="width:130px;height: 30px;" >
	<br>
	<input id="bt1" type="button" value="安全登录" >
	<a href="${path }/register.html">去注册</a>
</form>
</div>
<script type="text/javascript">

$(function(){

	$("#yzm").click(function(){
		this.src='';
		this.src='<%=path%>/common/vcode.jpg?'+Math.random(); //会访问com.itshidu.jeelite.common.action.CodeAction.java
		code.value='';
	}).click();
	$("#code").keydown(function(e){
		if(e.keyCode==13){
			$("#bt1").click();
		}
	});
	$("#bt1").click(function(){
		$.post("<%=path%>/login",{
			"u":user.value,
			"p":pass.value,
			"code":code.value
		},function(data){
			$("#code").blur();
			if(data=="success"){
				layer.alert('登录成功', {
					icon: 6,
					btn:['个人中心']
				},function(){
					window.location.href="${path}/user/home.html";
				});
				$(window).one("keydown",function(e){
					if(e.keyCode==13){
						window.location.href="${path}/user/home.html";
					}
				});
			}
			if(data=="VerifyCodeError"){
				layer.tips('验证码不正确', '#yzm');
				$("#code").focus();
			}
			if(data=="UnknownAccount"){
				layer.tips('用户名不存在', '#user');
				$("#user").focus();
			}
			if(data=="PasswordError"){
				layer.tips('密码不正确', '#pass');
				$("#pass").focus();
			}
			if(data=="LockedAccount"){
				layer.tips('账号未激活', '#user');
				$("#user").focus();
			}
			if(data=="DisabledAccount"){
				layer.tips('账号被屏蔽', '#user');
				$("#user").focus();
			}
			if(data=="already"){
				layer.msg('您已是登录状态，不能重复登录！');
			}
			$("#yzm").click();
			
		});
	});
	
});
</script>



  </body>
</html>
