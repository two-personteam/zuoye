<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>





<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>确认订单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<script type="text/javascript" src="<%=path%>/assets/libs/jquery-1.10.1.min.js"></script>
	
	<script src="<%=path%>/assets/amazeui/js/amazeui.min.js"></script>
  	<link rel="stylesheet" href="<%=path%>/assets/amazeui/css/amazeui.min.css"/>
  	<link rel="stylesheet" href="<%=path%>/assets/amazeui/css/admin.css">
	
	<script type="text/javascript" src="<%=path%>/assets/cityloader/jquery.cityloader.static.cn.min.js"></script>
<style type="text/css">
.container{
  	width:700px;margin-left:auto;margin-right:auto;
}

</style>
  </head>
  
  <body>
    



<jsp:include page="/WEB-INF/content/user/header.jsp"></jsp:include>

  
<div class="container">

<form action="<%=path%>/user/order/order!save.html" method="post" class="am-form" id="f1">
<input name="address" type="hidden" >
	
	<div class="am-panel am-panel-success">
	  <div class="am-panel-hd">收件人信息</div>
	  <div class="am-panel-bd">

<div class="am-input-group" id="ssq">
  <span class="am-input-group-label">
  <i class="am-icon-user am-icon-fw"></i>地区
  </span>
  <select addr></select>
  <span class="am-input-group-label"></span>
  <select addr></select>
  <span class="am-input-group-label"></span>
  <select addr></select>
</div>
<div class="am-input-group">
  <span class="am-input-group-label">
  <i class="am-icon-user am-icon-fw"></i>姓名
  </span>
  <input name="name" value="悟空" type="text" class="am-form-field" placeholder="收件人姓名">
</div>
<div class="am-input-group">
  <span class="am-input-group-label">
  <i class="am-icon-user am-icon-fw"></i>电话
  </span>
  <input name="phone" value="666666" type="text" class="am-form-field" placeholder="收件人电话">
</div>

<div class="am-input-group">
  <span class="am-input-group-label">
  <i class="am-icon-user am-icon-fw"></i>地址
  </span>
  <input addr type="text" value="沙河于辛庄" class="am-form-field" placeholder="收货地址">
</div>
	  </div>
	</div>
	
	
	
	<div class="am-panel am-panel-warning">
	  <div class="am-panel-hd">购物清单</div>
	  <div class="am-panel-bd">
<table class="am-table am-table-bordered">
    <thead>
        <tr>
            <th >商品</th>
            <th style="width:70px;">单价</th>
            <th style="width:150px;">数量</th>
            <th style="width:80px;">小计</th>
        </tr>
    </thead>
    <tbody>
    
        <tr>
            <td>西游记</td>
            <td>99.8</td>
            <td>1</td>
			<td>
			99.80
			</td>          
        </tr>
        
    </tbody>
</table>
	  </div>
	</div>
	
	总价格：99.8<br>
	<button type="submit" class="am-btn am-btn-danger">提交订单</button>
</form>
</div>
<script type="text/javascript">
$(function(){
	$("#ssq").cityloader({
		prov:"北京市",
		city:"北京市",
		dist:"昌平区"
	});
	
	$("#f1").submit(function(){
		var address = "";
		$("[addr]").each(function(n,el){
			address+=$(el).val();
		});
		$('[name="address"]').val(address);
	});
});
</script>
  </body>
</html>
