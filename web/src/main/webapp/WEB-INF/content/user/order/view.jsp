<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>





<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title>我的订单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<script type="text/javascript" src="<%=path%>/assets/libs/jquery-1.10.1.min.js"></script>
	
	<script src="<%=path%>/assets/amazeui/js/amazeui.min.js"></script>
  	<link rel="stylesheet" href="<%=path%>/assets/amazeui/css/amazeui.min.css"/>
  	<link rel="stylesheet" href="<%=path%>/assets/amazeui/css/admin.css">
	
	<link rel="stylesheet" type="text/css" href="<%=path%>/assets/layer/skin/layer.css">
	<script type="text/javascript" src="<%=path%>/assets/layer/layer.js"></script>
  
  </head>
  
  <body>



<jsp:include page="/WEB-INF/content/user/header.jsp"></jsp:include>




<table class="am-table am-table-bordered">
    <thead>
        <tr>
            <th >序号</th>
            <th>订单编号</th>
            <th>订单金额</th>
            <th>订单状态</th>
            <th>付款方式</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody>
    
        <tr>
            <td>1</td>
            <td>2016111211253600000</td>
			<td>
			99.80
			</td>
			<td>
				
					
					
					已发货
					
					
					
				
			</td>     
			<td>
				
					余额支付
					
					
					
				
			</td>   
			<td>
				<a href="<%=path%>/user/order/order!detail.html?id=1">
					<button>明细</button>
				</a>
				
				
			</td>
        </tr>
     
        <tr>
            <td>2</td>
            <td>2016111203163500000</td>
			<td>
			99.80
			</td>
			<td>
				
					
					
					
					
					已取消
					
				
			</td>     
			<td>
				
					余额支付
					
					
					
				
			</td>   
			<td>
				<a href="<%=path%>/user/order/order!detail.html?id=2">
					<button>明细</button>
				</a>
				
				
			</td>
        </tr>
     
        <tr>
            <td>3</td>
            <td>2016111203182600000</td>
			<td>
			299.40
			</td>
			<td>
				
					
					
					
					
					已取消
					
				
			</td>     
			<td>
				
					余额支付
					
					
					
				
			</td>   
			<td>
				<a href="<%=path%>/user/order/order!detail.html?id=3">
					<button>明细</button>
				</a>
				
				
			</td>
        </tr>
     
        <tr>
            <td>4</td>
            <td>2016111203265600000</td>
			<td>
			99.80
			</td>
			<td>
				
					
					已付款
					
					
					
					
				
			</td>     
			<td>
				
					余额支付
					
					
					
				
			</td>   
			<td>
				<a href="<%=path%>/user/order/order!detail.html?id=4">
					<button>明细</button>
				</a>
				
					<button onclick="cancelOrder(4);">取消</button>
				
				
			</td>
        </tr>
        
    </tbody>
</table>
提示：已经发货的订单不允许取消，如有疑问请联系官方客服。

<script type="text/javascript">
function cancelOrder(id){
	layer.confirm('您真的要取消订单吗？', {
			btn: ['我意已决','我再想想'] //按钮
		}, function(){
			window.location.href="<%=path%>/user/order/order!cancel.html?id="+id;
		}, function(){
			
		});
}
</script>

  </body>
</html>
