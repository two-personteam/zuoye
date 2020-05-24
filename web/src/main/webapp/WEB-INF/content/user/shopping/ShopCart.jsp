<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>购物车</title>
    
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
<style type="text/css">
.container{
  	width:700px;margin-left:auto;margin-right:auto;
}
</style>
  </head>
  
  <body>




<jsp:include page="/WEB-INF/content/user/header.jsp"></jsp:include>

<div class="container">
<table class="am-table am-table-bordered">
    <thead>
        <tr>
            <th >商品</th>
            <th style="width:70px;">单价</th>
            <th style="width:150px;">数量</th>
            <th style="width:80px;">小计</th>
            <th style="width:100px;">操作</th>
        </tr>
    </thead>
    <tbody>
    
        <tr>
            <td>西游记</td>
            <td>99.8</td>
            <td>
				<div class="am-input-group" style="width:150px;">
				  <span class="am-input-group-btn" cc="-"
				  	onclick="setNumber(1,1);">
			        <button class="am-btn am-btn-default" type="button">
						<i class="am-icon-minus"></i>
					</button>
			      </span>
			      <input type="text" class="am-form-field" value="1" 
			      onchange="setNumber(1,this.value);">
			      <span class="am-input-group-btn" cc="+"
			        onclick="setNumber(1,2);">
			        <button class="am-btn am-btn-default" type="button">
						<i class="am-icon-plus"></i>
					</button>
			      </span>
			    </div>
			</td>
			<td>
			99.80
			</td>
            <td>
				<button type="button" class="am-btn am-btn-danger"
				onclick="location.href='<%=path%>/user/shopping/cart!remove.html?id=1'"
				>移除</button>
			</td>
        </tr>
        
    </tbody>
</table>
<div>
<a href="<%=path%>/user/order/confirm.html">
	<button type="button" class="am-btn am-btn-danger">结算</button>
</a>
</div>

总价格：99.8

</div>


<script type="text/javascript">
function setNumber(pid,num){
	window.location.href="<%=path%>/user/shopping/cart!set.html?id="+pid+"&rows="+num;
}
$(function(){
	
});
</script>
  </body>
</html>
