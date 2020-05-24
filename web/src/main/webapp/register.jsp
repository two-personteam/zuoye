<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
</head>
<body>

<h1>AJAX异步注册</h1>
账号<input id="t1" placeholder="请输入用户名"><br>
密码<input id="t2" type="password" placeholder="请输入密码"><br>
邮箱<input id="t3"><br>
手机<input id="t4"><br>
验证码：<input id="t5"><img id="yzm"><br>
<input id="bt1" type="button" value="确认注册" >
<script type="text/javascript">
//文档就绪事件
$(function(){
	$('#bt1').click(function(){
		/*
		注册用户：/user?act=zhuce
			参数：a账号，b密码，c邮箱，d手机
			结果：1成功，2账号存在，3邮箱存在，4手机存在，5其他错误
		*/
		$.post('public/register',{
			username:t1.value,
			password:t2.value,
			email:t3.value,
			phone:t4.value,
			code:t5.value
			},function(data){
			if(data==1){
				alert("注册成功");
				window.location.href='login.html';
			}
			if(data==2){
				alert("账号存在");
			}
			if(data==3){
				alert("邮箱存在");
			}
			if(data==4){
				alert("手机存在");
			}
			if(data==5){
				alert("发生未知错误");
			}
			if(data==6){
				alert("验证码不正确");
			}
		});
	});
	
	$('#yzm').click(function(){
		$(this).attr('src','./verify.jpg?r='+Math.random());
	}).click();
	
});
</script>
</body>
</html>