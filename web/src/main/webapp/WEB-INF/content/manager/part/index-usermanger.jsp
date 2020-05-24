<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<div style="width: 100%;height: 100%;">
    <table id="dg-user" title="用户管理" style="width:100%;height: 100%;"></table>
    
<div id="dlg-save-user" style="width:500px;height:430px;padding:10px">
	<form id="ff-save-user" method="post" >
	<input type="hidden" name="touxiang" value="default.jpg" >
	<table class="am-table am-table-bordered">
	    <tbody>
	        <tr>
	            <td>账号</td>
	            <td><input  name="username"></td>
	        </tr>
	        <tr>
	            <td>密码</td>
	            <td><input name="password"></td>
	        </tr>
	        <tr>
	            <td>邮箱</td>
	            <td><input name="email"></td>
	        </tr>
	        <tr>
	            <td>余额</td>
	            <td><input name="money" value="0"></td>
	        </tr>
	        <tr>
	            <td>姓名</td>
	            <td><input name="realname"></td>
	        </tr>
	        <tr>
	            <td>地区</td>
	            <td id="city1">
					<select name="sheng"></select>
					<select name="shi"></select>
					<select name="qu"></select>
				</td>
	        </tr>
	        <tr>
	            <td>地址</td>
	            <td><input name="addr"></td>
	        </tr>
	        <tr>
	            <td>电话</td>
	            <td><input name="phone"></td>
	        </tr>
	        <tr>
	            <td>状态</td>
	            <td>
					<select id="cc" name="state">   
					    <option value="0">未激活</option>   
					    <option value="1">已激活</option>   
					    <option value="2">被屏蔽</option>    
					</select>
				</td>
	        </tr>
	        <tr>
	            <td>管理</td>
	            <td>
					是<input type="radio" name="isAdmin" value="1" >
					否<input type="radio" name="isAdmin" value="0" checked >
				</td>
	        </tr>
	    </tbody>
	</table>
</form>
</div>

<%-- 修改用户信息 --%>
<div id="dlg-update-user" style="width:500px;height:430px;padding:10px">
	<form id="ff-update-user" method="post" >
	
	<table class="am-table am-table-bordered">
	    <tbody>
	        <tr>
	            <td>编号</td>
	            <td><input name="id" type="text" readonly="readonly" style="background-color: #ddf" ></td>
	        </tr>
	        <tr>
	            <td>账号</td>
	            <td><input  name="username"></td>
	        </tr>
	        <tr>
	            <td>密码</td>
	            <td><input name="password">不修改请留空</td>
	        </tr>
	        <tr>
	            <td>邮箱</td>
	            <td><input name="email"></td>
	        </tr>
	        <tr>
	            <td>余额</td>
	            <td><input name="money" value="0"></td>
	        </tr>
	        <tr>
	            <td>姓名</td>
	            <td><input name="realname"></td>
	        </tr>
	        <tr>
	            <td>地区</td>
	            <td id="city2">
					<select name="sheng"></select>
					<select name="shi"></select>
					<select name="qu"></select>
				</td>
	        </tr>
	        <tr>
	            <td>地址</td>
	            <td><input name="addr"></td>
	        </tr>
	        <tr>
	            <td>电话</td>
	            <td><input name="phone"></td>
	        </tr>
	        <tr>
	            <td>状态</td>
	            <td>
					<select id="cc" name="state">   
					    <option value="0">未激活</option>   
					    <option value="1">已激活</option>   
					    <option value="2">被屏蔽</option>    
					</select>
				</td>
	        </tr>
	        <tr>
	            <td>管理</td>
	            <td>
					是<input type="radio" name="isAdmin" value="1" >
					否<input type="radio" name="isAdmin" value="0" checked >
				</td>
	        </tr>
	    </tbody>
	</table>
</form>
</div>


    <script type="text/javascript">
		$(function(){
			
			var stateFormatter = function(value,row,index){
				switch(value){
				case 0:return '未激活';
				case 1:return '已激活';
				case 2:return '被屏蔽';
				}
			}
			
			$("#dg-user").datagrid({
				rownumbers:true,
				singleSelect:true,
				pagination:true,
				url:'<%=path%>/manager/user!json.html',
				method:'post',
				columns:[[    
				          {field:'id',title:'ID',width:100,hidden:true},    
				          {field:'username',title:'账号',width:100},    
				          {field:'email',title:'邮箱',width:150,align:'left',sortable:true},    
				          {field:'money',title:'余额',width:100,align:'center'},
				          {field:'realname',title:'真实姓名',width:100,align:'center'},  
				          {field:'phone',title:'联系电话',width:100,align:'center'},  
				          {field:'state',title:'状态',width:100,align:'center',formatter: stateFormatter}
				      ]],
				rowStyler: function(index,row){
				  		if (row.state==2){
				  			return 'background-color:#FFCCCC;';
				  		}
				},

				toolbar:[{
					text:'添加用户',
					iconCls:'icon-add',
					handler:function(){
						$("#dlg-save-user").dialog("open");
					}
				},{
					text:'修改用户',
					iconCls:'icon-edit',
					handler:function(){
						
						var row = $("#dg-user").datagrid("getSelected");
						if(row){
							$("#ff-update-user").form("load",row);
							$("#ff-update-user").find("[name='password']").val("");
							$("#dlg-update-user").dialog("open");
						}else{
							layer.msg('请选择一条记录', {icon: 5});
						}
						
					}
				},{
					text:'删除用户',
					iconCls:'icon-cancel',
					handler:function(){
						var row = $("#dg-user").datagrid("getSelected");
						if(row){
							layer.confirm('确定删除吗？', {
								  btn: ['确定删除','取消'] //按钮
								}, function(){
									$.post("<%=path%>/manager/user!del.html",
											{"id":row.id},function(data){
										if(data=="success"){
											layer.msg('删除成功', {icon: 1});
											$('#dg-user').datagrid('reload');
										}else{
											layer.msg('删除失败，未知异常', {icon: 1});
										}
									});
									
							});
						}else{
							layer.msg('请选择一条记录', {icon: 5});
						}
						
					}
				},'-',{
					text:'批量导入',
					iconCls:'icon-save',
					handler:function(){}
				}]
			});
			var pager = $('#dg-user').datagrid().datagrid('getPager');	// get the pager of datagrid
			pager.pagination({
				beforePageText:'第',
				pageList: [10,20,30,50],
				afterPageText:'页，共{pages}页',
				displayMsg:'当前从 {from} 到 {to} ，共 {total} 条'
			});
			
			
			$("#dlg-save-user").dialog({
				title:"添加用户",
				iconCls: 'icon-save',
				closed:true,
				modal:true,
				buttons: [{
					text:'确定',
					iconCls:'icon-ok',
					handler:function(){
						$('#ff-save-user').submit();
					}
				},{
					text:'取消',
					handler:function(){
						$("#dlg-save-user").dialog("close");
					}
				}]
			});
			$("#dlg-update-user").dialog({
				title:"修改用户",
				iconCls: 'icon-edit',
				closed:true,
				modal:true,
				buttons: [{
					text:'确定',
					iconCls:'icon-ok',
					handler:function(){
						$('#ff-update-user').submit();
					}
				},{
					text:'取消',
					handler:function(){
						$("#dlg-update-user").dialog("close");
					}
				}]
			});
			
			$("#city1").cityloader({});
			$("#city2").cityloader({});
			$("#ff-save-user").form({    
			    url:"<%=path%>/manager/user!save.html",
			    onSubmit: function(){    
			    	return $("#ff-save-user").form("validate");
			    },    
			    success:function(data){    
			        alert(data);
			    }    
			});
			$("#ff-update-user").form({    
			    url:"<%=path%>/manager/user!update.html",
			    onSubmit: function(){    
			    	return $("#ff-update-user").form("validate");
			    },
			    success:function(data){
			    	if(data=='success'){
			    		layer.msg('修改成功');
			    		$("#dlg-update-user").dialog("close");
			    		$('#dg-user').datagrid('reload');
			    	}else{
			    		layer.msg('修改失败，发生异常', {icon: 5});
			    	}
			    	
			    }    
			});
			/* ------ 添加用户:表单验证 */
//账号规则验证器   
$.extend($.fn.validatebox.defaults.rules, {    
    username: {    
        validator: function(value,param){
        	var min = param[0];
        	var max = param[1];
            return value.match("^[0-9a-zA-Z]{"+min+","+max+"}$");    
        },    
        message: '账号只能填写数字与字母，长度在{0}-{1}之间'   
    }    
});
//密码规则验证器   
$.extend($.fn.validatebox.defaults.rules, {    
    password: {    
        validator: function(value,param){
        	var min = param[0];
        	var max = param[1];
            return value.match("^[0-9a-zA-Z]{"+min+","+max+"}$");    
        },    
        message: '密码只能填写数字与字母，长度在{0}-{1}之间'   
    }    
});
//验证用户名是否可用   
$.extend($.fn.validatebox.defaults.rules, {    
    checkname: {    
        validator: $.fn.validatebox.defaults.rules.remote.validator,    
        message: '用户名已经存在'   
    }    
});

			$("#ff-save-user").find("[name='username']").validatebox({
				required:true,
				validType: ['username[3,20]','checkname["<%=path%>/manager/user!checkName.html","username"]'],
				missingMessage:"账号不能为空"
			});
			$("#ff-update-user").find("[name='username']").validatebox({
				required:true,
				validType: ['username[3,20]'],
				missingMessage:"账号不能为空"
			});
			$("#ff-save-user").find("[name='password']").validatebox({
				required:true,
				validType: 'password[6,20]',
				missingMessage:"密码不能为空"
			});
			$("#ff-update-user").find("[name='password']").validatebox({
				required:false,
				validType: 'password[6,20]',
				missingMessage:"密码不能为空"
			});
			$("#ff-save-user,#ff-update-user").find("[name='email']").validatebox({
				required: true,
			    validType: 'email',
			    missingMessage:"邮箱不能为空",
			    invalidMessage:"邮箱格式不正确"
			});
			$("#ff-save-user,#ff-update-user").find("[name='money']").numberbox({    
				required: true,
				min: 0,max:999999999,
				precision:3,
			    editable: true,
			    missingMessage:"余额不能为空",
			});

	});
	</script>
</div>