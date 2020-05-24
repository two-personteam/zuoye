<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="/jeelite-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<script src="http://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="${path }/assets/jquery-easyui-1.5.4.2/themes/default/easyui.css" type="text/css"></link>
<link rel="stylesheet" href="${path }/assets/jquery-easyui-1.5.4.2/themes/icon.css" type="text/css"></link>
<link rel="stylesheet" href="${path }/assets/jquery-easyui-1.5.4.2/demo/demo.css" type="text/css" ></link>
<script src="${path }/assets/jquery-easyui-1.5.4.2/jquery.easyui.min.js" type="text/javascript" ></script>
<link href="https://cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.js"></script>
</head>
<body>

<table id="dg" title="用户信息管理" style="width:100%;height:650px" ></table>

<!-- 添加用户 -->
<div id="dd-add">
	<form>
		<table class="am-table am-table-bordered">
    <tbody>
        <tr>
            <td>账号</td>
            <td><input name="username" type="text" class="am-form-field" placeholder="请输入用户名"></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input name="password" type="password" class="am-form-field" placeholder="请输入密码"></td>
        </tr>
        <tr>
            <td>邮箱</td>
            <td><input name="email" type="text" class="am-form-field" placeholder="请输入电子邮箱"></td>
        </tr>
        <tr>
            <td>手机</td>
            <td><input name="phone" type="text" class="am-form-field" placeholder="请输入手机号"></td>
        </tr>
        <tr>
            <td>状态</td>
            <td>
	            <select name="state" class="am-form-field">
			      <option value="0">未激活</option>
			      <option value="1">正常</option>
			      <option value="2">被屏蔽</option>
			    </select>
		    </td>
        </tr>
       
    </tbody>
</table>
	</form>

</div>

<!-- 编辑用户 -->
<div id="dd-edit">
	<form>
	<input name="id" type="hidden">
		<table class="am-table am-table-bordered">
    <tbody>
        <tr>
            <td>账号</td>
            <td><input name="username" type="text" class="am-form-field" placeholder="请输入用户名"></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input name="password" type="password" class="am-form-field" placeholder="请输入密码"></td>
        </tr>
        <tr>
            <td>邮箱</td>
            <td><input name="email" type="text" class="am-form-field" placeholder="请输入电子邮箱"></td>
        </tr>
        <tr>
            <td>手机</td>
            <td><input name="phone" type="text" class="am-form-field" placeholder="请输入手机号"></td>
        </tr>
        <tr>
            <td>状态</td>
            <td>
	            <select name="state" class="am-form-field">
			      <option value="0">未激活</option>
			      <option value="1">正常</option>
			      <option value="2">被屏蔽</option>
			    </select>
		    </td>
        </tr>
       
    </tbody>
</table>
	</form>

</div>


<script type="text/javascript">
	$(function(){
		
		var url={
				save:		'${path}/admin/usermgr/save',
				update:		'${path}/admin/usermgr/update',
				list:		'${path}/admin/usermgr/list',
				remove:		'${path}/admin/usermgr/remove'
		}
		
		$('#dd-add').dialog({
		    title: '添加用户',
		    width: 600,
		    height: 400,
		    closed: true,
		    modal: true,
		    buttons:[{
				text:'保存',
				handler:function(){
					var param = $('#dd-add form').serialize();
					$.post(url.save,param,function(data){
						if(data.text=='success'){
							$.messager.show({
								title:'系统消息',
								msg:'成功添加一个新用户',
								timeout:3000,
								showType:'slide'
							});
							$('#dd-add').dialog('close');
							$('#dg').datagrid('reload');
						}
					});
				}
			},{
				text:'关闭',
				handler:function(){$('#dd-add').dialog('close');}
			}]
		});
		$('#dd-edit').dialog({
		    title: '编辑用户',
		    width: 600,
		    height: 400,
		    closed: true,
		    modal: true,
		    buttons:[{
				text:'确认修改',
				handler:function(){
					var param = $('#dd-edit form').serialize();
					$.post(url.update,param,function(data){
						if(data.text=='success'){
							$.messager.show({
								title:'系统消息',
								msg:'用户信息修改成功',
								timeout:3000,
								showType:'slide'
							});
							$('#dd-edit').dialog('close');
							$('#dg').datagrid('reload');
						}
					});
				}
			},{
				text:'关闭',
				handler:function(){$('#dd-add').dialog('close');}
			}]
		});
		
		
		
		function StateFormatter(value,row,index){
			if(row.state==0)return '未激活';
        	if(row.state==1)return '正常';
        	if(row.state==2)return '被屏蔽';
		}
		
		
		$('#dg').datagrid({
			rownumbers:true,
			singleSelect:true,
			pagination:true,
			url:url.list,
			method:'post',
			loadMsg:'正在处理，请稍候...',
		    columns:[[
		        //{field:'id',title:'ID',width:100},
		        {field:'username',title:'用户名',width:100},
		        {field:'email',title:'邮箱',width:200},
		        {field:'phone',title:'手机',width:100},
		        {field:'state',title:'状态',width:100,formatter:StateFormatter}
		    ]],
		    toolbar: [{
		    	text:'添加用户',
				iconCls: 'icon-add',
				handler: function(){
					$('#dd-add').dialog('open');
				}
			},{
				text:'编辑用户',
				iconCls: 'icon-edit',
				handler: function(){
					var row = $('#dg').datagrid('getSelected');
					if(!row){ //false,null,undefined,''
						swal("请先选择一个用户！")
						return;
					}
					$('#dd-edit form').form('load',row);
					$('#dd-edit').dialog('open');
					
				}
			},{
				text:'删除用户',
				iconCls: 'icon-remove',
				handler: function(){
					var row = $('#dg').datagrid('getSelected');
					if(!row){ //false,null,undefined,''
						swal("请先选择一个用户！")
						return;
					}
					swal({ 
						  title: "确定删除吗？", 
						  text: "用户删除后，将无法恢复！", 
						  type: "warning",
						  showCancelButton: true, 
						  confirmButtonColor: "#DD6B55",
						  confirmButtonText: "确定删除！", 
						  closeOnConfirm: true
						},
						function(){
							$('#dg').datagrid('loading');
							$.post(url.remove,{'id':row.id},function(data){

								if(data.text=='success'){
									//swal("删除成功！", "用户已经被删除。", "success"); 
									$.messager.show({
										title:'系统消息',
										msg:'删除成功',
										timeout:2000,
										showType:'slide'
									});
								}
								$('#dg').datagrid('reload');
							});
						});
					
				}
			},'-',{
				text:'帮助',
				iconCls: 'icon-help',
				handler: function(){alert('帮助按钮')}
			}]

		});
		
		var pager = $('#dg').datagrid().datagrid('getPager');	//取出表格中的分页组件
		pager.pagination({
			beforePageText:'第',
			afterPageText:'页，共{pages}页',
			displayMsg:'正在显示 {from} 到 {to} 条，共有 {total} 条记录',
			buttons:[{
				iconCls:'icon-search',
				handler:function(){
					alert('search');
				}
			},{
				iconCls:'icon-add',
				handler:function(){
					alert('add');
				}
			},{
				iconCls:'icon-edit',
				handler:function(){
					alert('edit');
				}
			}]
		});			
	})
</script>

</body>
</html>