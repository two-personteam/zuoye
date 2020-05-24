<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="cc" uri="/jeelite-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>UserManager</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<cc:base type="jquery,jquery-easyui,layui,cityloader"></cc:base>
	
	<script type="text/javascript" src="${res}/DateFormatPlugin.js"></script>
	
	
	
  </head>
  
  <body style="height: 100%;">
<div id="user-box">
    <table id="dg-user" title="用户管理" style="width:100%;height:450px"></table>
    
</div>
	<div id="w_add" title="添加新数据" style="width:800px;height:500px;padding:10px;display:none;">

<form class="layui-form layui-form-pane" action="">
  <div class="layui-form-item">
    <label class="layui-form-label">账号</label>
    <div class="layui-input-inline">
      <input type="text" name="username" lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-inline">
      <input type="text" name="password" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">姓名</label>
    <div class="layui-input-inline">
      <input type="text" name="realname" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">邮箱</label>
    <div class="layui-input-inline">
      <input type="text" name="email" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">状态</label>
    <div class="layui-input-inline">
      <select name="state">
        <option value="0">未激活(0)</option>
        <option value="1">正常(1)</option>
        <option value="2">被屏蔽(2)</option>
      </select>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">生日</label>
    <div class="layui-input-inline">
	  <input name="createTime" class="layui-input" placeholder="自定义日期格式" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
	</div>
  </div>

<!--   <div class="layui-form-item">
    <label class="layui-form-label">单选框</label>
    <div class="layui-input-block">
      <input type="radio" name="sex" value="0" title="未激活" checked>
      <input type="radio" name="sex" value="1" title="正常">
      <input type="radio" name="sex" value="2" title="被屏蔽">
    </div>
  </div> -->
  
</form>

	</div>
<div id="xx"></div>
	
	<script type="text/javascript">
		$(function(){
			layui.use(['form', 'layedit', 'laydate']);
			
			$('.cityloader').cityloader({});
			
			var grid = $("#dg-user");
			grid.datagrid({
				rowStyler: function(index,row){
					if (row.state==2){
						return 'background-color:#CC6666;';
					}
				},
				rownumbers:true,
				checkOnSelect: false,
				selectOnCheck: false,
				singleSelect: true,
				pagination:true,
				url:'<%=path%>/manager/user!json.html',
				method:'post',
				loadMsg:"正在处理数据，请稍候...",
				columns:[[
						  {field:'',checkbox:true},
				          {field:'id',title:'ID',width:100,type:'int'},
				          {field:'username',title:'账号',width:100,type:'String'},
				          {field:'password',title:'密码',width:100},
				          {field:'realname',title:'真实姓名',width:100},
				          {field:'email',title:'邮箱',width:200},
				          {field:'createTime',title:'创建时间',width:200},
				          {field:'state',title:'状态',width:100,
				  			formatter: function(value,row,index){
								if (row.state==0){
									return "整数："+row.state;
								}
							}
						  }   
				      ]],
				toolbar: [
				          {text:"添加",iconCls:'icon-add',plain:true,handler: add},
				          {text:"修改",iconCls:'icon-edit',plain:true,handler: edit},
				          {text:"删除",iconCls:'icon-cancel',plain:true,handler: remove},'-',
				      ]
			});
			grid.datagrid('getPager').pagination({
				pageList: [10,20,50,100],
				beforePageText:"第",
				afterPageText:"页，共{pages}页",
				displayMsg:"当前从 {from} 到 {to} ，共 {total} 条记录"
			});
			
			function add(){
				var box = $('#w_add');
				box.dialog({
					modal:true,closed:true,iconCls:'icon-save',
					top:30,height:$(window).height()-80,
					buttons: [{
						text:'确定',iconCls:'icon-ok',
						handler:function(){
							var fo = '';
							box.find("input,select").each(function(){
								fo += '&'+this.name+'='+this.value;console.log(this);
							});
							$.post('${path}/manager/user!save.html',fo,function(data){
								console.log(data);
							});
						}
					},{
						text:'取消',iconCls:'icon-cancel',
						handler:function(){
							box.dialog('close');
						}
					}]
				}).dialog('open');
			
			}
			function edit(){
				var row = grid.datagrid('getSelected');
				if(!row){
					row = grid.datagrid('getChecked')[0];
					var index=grid.datagrid('getRowIndex',row);
					grid.datagrid('selectRow',index);
				}
				if(!row){
					layer.msg('请选择一条数据',function(){ });
				}else{
					console.log(row);
				}
			}
			function remove(){
				var rows = grid.datagrid('getChecked');
				if(rows.length==0){
					layer.msg('请勾选数据',function(){ });
				}else{
					layer.confirm('确定删除吗？共'+rows.length+'条数据', {
						  	btn: ['确定','取消'] //按钮
							,closeBtn: 0
						}, function(index){
							grid.datagrid('loading');
							layer.close(index);
							var fo = "";
							for(var n in rows){
								fo += "&id="+rows[n].id;
							}
							$.post('${path}/manager/user!del.html',fo,function(data){
								if(data=="success"){
									grid.datagrid('loaded');
									grid.datagrid('reload');
								}
							});
							
					});
					
				}
			}
			
			
			
		})
	</script>
    
    
  </body>
</html>
