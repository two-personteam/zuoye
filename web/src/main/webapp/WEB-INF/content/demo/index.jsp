<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" type="text/css" href="<%=path%>/assets/jquery-easyui-1.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/assets/jquery-easyui-1.5/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/assets/jquery-easyui-1.5/demo/demo.css">
	
	<script type="text/javascript" src="<%=path%>/assets/libs/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="<%=path%>/assets/jquery-easyui-1.5/jquery.easyui.min.js"></script>

  </head>
  
  <body style="height: 1000px;">
  <input type="button" value="点这里" onclick="$('#dlg').dialog('center');" >
    
	<div id="dlg" ></div>
	
	<script type="text/javascript">
	/*
	jQuery插件接口：
		-- 初始化参数(属性)
		-- 内置事件
		-- 支持动作（方法）
	*/
	$(function(){
		
		//属性的使用
		$("#dlg").dialog({
			title:"我的窗口666",
			width:500,
			height:300,
			left:200,
			top:100,
			collapsible:true,
			resizable:true,
			modal:false,
			toolbar:[{
				text:'修改',
				iconCls:'icon-edit',
				handler:function(){
					alert('edit toolbar')
				}
			},{
				text:'这是啥',
				iconCls:'icon-help',
				handler:function(){
					alert('help toolbar')
				}
			}],
			buttons:[{
				text:'保存',
				handler:function(){ }
			},{
				text:'关闭',
				handler:function(){ }
			}],
			onResize:function(w,h){
				console.log(w+" , "+h);
			},
			onMove:function(left,top){
				console.log("move:"+left+","+top)
			}
		});
		
		
		
	});
	
	</script>

  </body>
</html>
