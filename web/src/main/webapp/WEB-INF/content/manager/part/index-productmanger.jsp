<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<div style="width: 100%;height: 100%;">
    <table id="dg-product" title="商品管理" style="width:100%;height: 100%;"></table>

<div id="dlg-save-product" style="width:500px;height:460px;padding:10px">
	<form id="ff-save-product" method="post" >
	<table class="am-table am-table-bordered">
	    <tbody>
	    	<tr>
	            <td>所属类别</td>
	            <td>
					<input name="category.id" >
				</td>
	        </tr>
	        <tr>
	            <td>商品名称</td>
	            <td><input  name="name"></td>
	        </tr>
	        <tr>
	            <td>宣传语</td>
	            <td><input name="title"></td>
	        </tr>
	        <tr>
	            <td>单价</td>
	            <td><input name="price"></td>
	        </tr>
	        <tr>
	            <td>专柜价格</td>
	            <td><input name="mallPrice"></td>
	        </tr>
	        <tr>
	            <td>库存</td>
	            <td><input name="stock"></td>
	        </tr>
	        <tr>
	            <td>详细介绍</td>
	            <td><input name="details"></td>
	        </tr>
	        <tr>
	            <td>总销量</td>
	            <td><input name="sales"></td>
	        </tr>
	    </tbody>
	</table>
</form>
</div>

<%-- 修改商品信息 --%>
<div id="dlg-update-product" style="width:500px;height:260px;padding:10px">
	<form id="ff-update-product" method="post" >
	
	<table class="am-table am-table-bordered">
	    <tbody>
	        <tr>
	            <td>编号</td>
	            <td><input name="id" type="text" readonly="readonly" ></td>
	        </tr>
	        <tr>
	            <td>所属类别</td>
	            <td>
					<input class="easyui-combobox" data-options="    
        valueField: 'id',    
        textField: 'text',    
        url: 'get_data1.php',    
        onSelect: function(rec){    
            console.log('hello');
        }" />
				</td>
	        </tr>
	        <tr>
	            <td>商品名称</td>
	            <td><input  name="name"></td>
	        </tr>
	        <tr>
	            <td>宣传语</td>
	            <td><input name="title"></td>
	        </tr>
	        <tr>
	            <td>单价</td>
	            <td><input name="price"></td>
	        </tr>
	        <tr>
	            <td>专柜价格</td>
	            <td><input name="mallPrice"></td>
	        </tr>
	        <tr>
	            <td>库存</td>
	            <td><input name="stock"></td>
	        </tr>
	        <tr>
	            <td>详细介绍</td>
	            <td><input name="details"></td>
	        </tr>
	        <tr>
	            <td>总销量</td>
	            <td><input name="sales"></td>
	        </tr>
	    </tbody>
	</table>
</form>
</div>


    <script type="text/javascript">
		$(function(){
			
			
			$("#dg-product").datagrid({
				rownumbers:true,
				singleSelect:true,
				pagination:true,
				url:'<%=path%>/manager/product!json.html',
				method:'post',
				columns:[[    
				          {field:'id',title:'ID',width:100,hidden:true},    
				          {field:'name',title:'商品名称',width:100},    
				          {field:'category',title:'类别',width:100,formatter: function(value,row,index){
								return value.name;
								
							}
},    
				          {field:'title',title:'副标题',width:150,align:'left',sortable:true},
				          {field:'price',title:'单价',width:100},
				          {field:'mallPrice',title:'专柜价格',width:100},
				          {field:'stock',title:'库存',width:100},
				          {field:'details',title:'详细介绍',width:100},
				          {field:'sales',title:'销量',width:100}
				    ]],
				toolbar:[{
					text:'添加商品',
					iconCls:'icon-add',
					handler:function(){
						$("#ff-save-product").find('[name="category.id"]').combobox({    
						    url:'<%=path%>/manager/category!list.html?page=1&rows=99',    
						    valueField:'id',    
						    textField:'name'
						});
						$("#dlg-save-product").dialog("open");
					}
				},{
					text:'修改商品',
					iconCls:'icon-edit',
					handler:function(){
						
						var row = $("#dg-product").datagrid("getSelected");
						if(row){
							$("#ff-update-product").form("load",row);
							$("#ff-update-product").find("[name='password']").val("");
							$("#dlg-update-product").dialog("open");
						}else{
							layer.msg('请选择一条记录', {icon: 5});
						}
						
					}
				},{
					text:'删除商品',
					iconCls:'icon-cancel',
					handler:function(){
						var row = $("#dg-product").datagrid("getSelected");
						if(row){
							layer.confirm('确定删除吗？', {
								  btn: ['确定删除','取消'] //按钮
								}, function(){
									$.post("<%=path%>/manager/user!del.html",
											{"id":row.id},function(data){
										if(data=="success"){
											layer.msg('删除成功', {icon: 1});
											$('#dg-product').datagrid('reload');
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
			var pager = $('#dg-product').datagrid().datagrid('getPager');	// get the pager of datagrid
			pager.pagination({
				beforePageText:'第',
				afterPageText:'页，共{pages}页',
				displayMsg:'当前从 {from} 到 {to} ，共 {total} 条'
			});
			
			
			$("#dlg-save-product").dialog({
				title:"添加商品",
				iconCls: 'icon-save',
				closed:true,
				modal:true,
				buttons: [{
					text:'确定',
					iconCls:'icon-ok',
					handler:function(){
						$('#ff-save-product').submit();
					}
				},{
					text:'取消',
					handler:function(){
						$("#dlg-save-product").dialog("close");
					}
				}]
			});
			$("#dlg-update-product").dialog({
				title:"修改商品",
				iconCls: 'icon-edit',
				closed:true,
				modal:true,
				buttons: [{
					text:'确定',
					iconCls:'icon-ok',
					handler:function(){
						$('#ff-update-product').submit();
					}
				},{
					text:'取消',
					handler:function(){
						$("#dlg-update-product").dialog("close");
					}
				}]
			});
			
			$("#city1").cityloader({});
			$("#city2").cityloader({});
			$("#ff-save-product").form({    
			    url:"<%=path%>/manager/product!save.html",
			    onSubmit: function(){    
			    	return $("#ff-save-product").form("validate");
			    },    
			    success:function(data){    
			        alert(data);
			    }    
			});
			$("#ff-update-product").form({    
			    url:"<%=path%>/manager/category!update.html",
			    onSubmit: function(){    
			    	return $("#ff-update-product").form("validate");
			    },
			    success:function(data){
			    	if(data=='success'){
			    		layer.msg('修改成功');
			    		$("#dlg-update-product").dialog("close");
			    		$('#dg-product').datagrid('reload');
			    	}else{
			    		layer.msg('修改失败，发生异常', {icon: 5});
			    	}
			    	
			    }    
			});
			/* ------ 添加商品:表单验证 */
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
//验证商品名是否可用   
$.extend($.fn.validatebox.defaults.rules, {    
    checkname: {    
        validator: $.fn.validatebox.defaults.rules.remote.validator,    
        message: '商品名已经存在'   
    }    
});

			$("#ff-save-product").find("[name='username']").validatebox({
				required:true,
				validType: ['username[3,20]','checkname["<%=path%>/manager/user!checkName.html","username"]'],
				missingMessage:"账号不能为空"
			});
			

	});
	</script>
</div>