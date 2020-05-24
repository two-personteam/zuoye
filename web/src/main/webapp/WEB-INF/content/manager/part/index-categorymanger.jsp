<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<div style="width: 100%;height: 100%;">
    <table id="dg-cate" title="类别管理" style="width:100%;height: 100%;"></table>
    
<div id="dlg-save-cate" style="width:500px;height:260px;padding:10px">
	<form id="ff-save-cate" method="post" >
	<table class="am-table am-table-bordered">
	    <tbody>
	        <tr>
	            <td>类别名称</td>
	            <td><input  name="name"></td>
	        </tr>
	        <tr>
	            <td>类别描述</td>
	            <td><input name="text"></td>
	        </tr>
	    </tbody>
	</table>
</form>
</div>

<%-- 修改类别信息 --%>
<div id="dlg-update-cate" style="width:500px;height:260px;padding:10px">
	<form id="ff-update-cate" method="post" >
	
	<table class="am-table am-table-bordered">
	    <tbody>
	        <tr>
	            <td>编号</td>
	            <td><input name="id" type="text" readonly="readonly" ></td>
	        </tr>
	        <tr>
	            <td>类别名称</td>
	            <td><input  name="name"></td>
	        </tr>
	        <tr>
	            <td>类别描述</td>
	            <td><input name="text"></td>
	        </tr>
	    </tbody>
	</table>
</form>
</div>


    <script type="text/javascript">
		$(function(){
			
			
			$("#dg-cate").datagrid({
				rownumbers:true,
				singleSelect:true,
				pagination:true,
				url:'<%=path%>/manager/category!json.html',
				method:'post',
				columns:[[    
				          {field:'id',title:'ID',width:100,hidden:true},    
				          {field:'name',title:'类别名称',width:100},    
				          {field:'text',title:'类别描述',width:150,align:'left',sortable:true}
				      ]],
				toolbar:[{
					text:'添加类别',
					iconCls:'icon-add',
					handler:function(){
						$("#dlg-save-cate").dialog("open");
					}
				},{
					text:'修改类别',
					iconCls:'icon-edit',
					handler:function(){
						
						var row = $("#dg-cate").datagrid("getSelected");
						if(row){
							$("#ff-update-cate").form("load",row);
							$("#dlg-update-cate").dialog("open");
						}else{
							layer.msg('请选择一条记录', {icon: 5});
						}
						
					}
				},{
					text:'删除类别',
					iconCls:'icon-cancel',
					handler:function(){
						var row = $("#dg-cate").datagrid("getSelected");
						if(row){
							layer.confirm('确定删除吗？', {
								  btn: ['确定删除','取消'] //按钮
								}, function(){
									$.post("<%=path%>/manager/user!del.html",
											{"id":row.id},function(data){
										if(data=="success"){
											layer.msg('删除成功', {icon: 1});
											$('#dg-cate').datagrid('reload');
										}else{
											layer.msg('删除失败，未知异常', {icon: 1});
										}
									});
									
							});
						}else{
							layer.msg('请选择一条记录', {icon: 5});
						}
						
					}
				}]
			});
			var pager = $('#dg-cate').datagrid().datagrid('getPager');	// get the pager of datagrid
			pager.pagination({
				beforePageText:'第',
				afterPageText:'页，共{pages}页',
				displayMsg:'当前从 {from} 到 {to} ，共 {total} 条'
			});
			
			
			$("#dlg-save-cate").dialog({
				title:"添加类别",
				iconCls: 'icon-save',
				closed:true,
				modal:true,
				buttons: [{
					text:'确定',
					iconCls:'icon-ok',
					handler:function(){
						$('#ff-save-cate').submit();
					}
				},{
					text:'取消',
					handler:function(){
						$("#dlg-save-cate").dialog("close");
					}
				}]
			});
			$("#dlg-update-cate").dialog({
				title:"修改类别",
				iconCls: 'icon-edit',
				closed:true,
				modal:true,
				buttons: [{
					text:'确定',
					iconCls:'icon-ok',
					handler:function(){
						$('#ff-update-cate').submit();
					}
				},{
					text:'取消',
					handler:function(){
						$("#dlg-update-cate").dialog("close");
					}
				}]
			});
			
			$("#city1").cityloader({});
			$("#city2").cityloader({});
			$("#ff-save-cate").form({
			    url:"<%=path%>/manager/category!save.html",
			    onSubmit: function(){
			    	return $("#ff-save-cate").form("validate");
			    },
			    success:function(data){
			    	$('#dg-cate').datagrid('reload');
			        alert(data);
			    }
			});
			$("#ff-update-cate").form({
			    url:"<%=path%>/manager/category!update.html",
			    onSubmit: function(){
			    	return $("#ff-update-cate").form("validate");
			    },
			    success:function(data){
			    	if(data=='success'){
			    		layer.msg('修改成功');
			    		$("#dlg-update-cate").dialog("close");
			    		$('#dg-cate').datagrid('reload');
			    	}else{
			    		layer.msg('修改失败，发生异常', {icon: 5});
			    	}
			    	
			    }    
			});
			
	});
	</script>
</div>