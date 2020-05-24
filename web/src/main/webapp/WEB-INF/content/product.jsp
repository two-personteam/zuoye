<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
    
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


<table id="pros" class="am-table">
    <thead>
        <tr>
            <th>商品名称</th>
            <th>价格</th>
            <th>专柜价格</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody>
        <tr style="display: none;">
            <td>name</td>
            <td>price</td>
            <td>mallPrice</td>
            <td>
				<button type="button" class="am-btn am-btn-success">加入购物车</button>
			</td>
        </tr>
        
    </tbody>
</table>
<div id="page1"></div>
<script type="text/javascript">

$(function(){
	function refresh(p){
		$.getJSON("<%=path%>/hello!product.html",{
			page:p,rows:2
		},function(data){
			var tb=$("#pros tbody");
			var tr0 = tb.find("tr:eq(0)");
			tb.find("tr").not("tr:hidden").remove();
			$.each(data.list,function(n,obj){
				var ntr=tr0.clone().show().appendTo(tb);
				ntr.find("td:eq(0)").html(obj.name);
				ntr.find("td:eq(1)").html(obj.price);
				ntr.find("td:eq(2)").html(obj.mallPrice);
				ntr.find("td:eq(3)").find("button").click(function(){
					$.post('<%=path%>/user/shopping/cart!add.html',
							{id:obj.id},function(data){
								if(data=='success'){
									layer.msg('添加成功');
								}
								
							});
				});
			});

			//显示分页
		    laypage({
		        cont: 'page1', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>
		        pages: data.totalPage, //通过后台拿到的总页数
		        curr: data.now, //当前页
		        jump: function(obj, first){ //触发分页后的回调
		            if(!first){ //点击跳页触发函数自身，并传递当前页：obj.curr
		            	refresh(obj.curr);
		            }
		        }
		    });
		});
	}
	refresh(1);
	
});
</script>
  </body>
</html>
