<%@page import="org.apache.shiro.SecurityUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="cc" uri="/jeelite-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>菜单管理</title>

    <link href="${res}/hplus4.2/css/style.css?v=4.1.0" rel="stylesheet">
    <cc:base type="jquery,font-awesome,animate,bootstrap,jquery-easyui"></cc:base>
	
    
    <link href="${res}/0.1.5/webuploader.css" rel="stylesheet" type="text/css" >
    <script src="${res}/0.1.5/webuploader.min.js"></script>
    
    
<style type="text/css">
.datagrid-row {
    height: 35px;
}

</style>
</head>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<body class="gray-bg" style="height: 100%;">
<div id="menu_mg" style="height: 100%;">
    <table id="tt_menu" style="height: 100%;"></table>
    
    <!-- 添加数据 -->
    <div id="part_add" class="float-e-margins" style="display: none;">
	    <div class="ibox-content">
	        <form class="form-horizontal m-t" id="signupForm">
	        	<input name="color" type="hidden" >
	        	<div class="form-group">
	                <label class="col-sm-3 control-label">父级菜单：</label>
	                <div class="col-sm-8">
	                    <input name="parent_id" >
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-3 control-label">菜单文字：</label>
	                <div class="col-sm-8">
	                    <input name="text" class="form-control">
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-3 control-label">链接地址：</label>
	                <div class="col-sm-8">
	                    <input name="href" class="form-control">
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-3 control-label">排序权重：</label>
	                <div class="col-sm-8">
	                    <input type="number" name="sort" value="0" class="form-control">
	                </div>
	            </div>
	            <cc:fontIcon name="icon" onColorChange="
	            $('#part_add .icon-show icon').css('color','#'+hex);
	            $('#part_add [name=color]').val('#'+hex);
	            " ></cc:fontIcon>
	        </form>
	    </div>
	</div>
    <!-- 编辑数据 -->
    <div id="part_edit" class="float-e-margins" style="display: none;">
	    <div class="ibox-content">
	        <form class="form-horizontal m-t">
	        	<input type="hidden" name="id" >
	        	<input type="hidden" name="color" >
	        	<div class="form-group">
	                <label class="col-sm-3 control-label">父级菜单：</label>
	                <div class="col-sm-8">
	                    <input name="parent_id" >
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-3 control-label">菜单文字：</label>
	                <div class="col-sm-8">
	                    <input name="text" class="form-control">
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-3 control-label">链接地址：</label>
	                <div class="col-sm-8">
	                    <input name="href" class="form-control">
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-3 control-label">排序权重：</label>
	                <div class="col-sm-8">
	                    <input type="number" name="sort" class="form-control">
	                </div>
	            </div>
	            <cc:fontIcon name="icon" onColorChange="
	            $('#part_edit .icon-show icon').css('color','#'+hex);
	            $('#part_edit [name=color]').val('#'+hex);
	            " ></cc:fontIcon>
	        </form>
	    </div>
	</div>
</div>
    
    <script type="text/javascript">
    $(function(){
    	var box = $('#part_add');
    	var cbt = box.find('[name=parent_id]').eq(0);
    	box.dialog({    
            title: '添加数据',    
            width: 500,    
            closed: true,    
            resizable: true,    
            modal: true,
            buttons:[{
    			text:'保存',
    			handler:function(){
    		        $.post('${path}/manage/menu!save.html',
    		        	box.find('form').serialize()
    		        ,function(data){
    		        	if(data=='success'){
    		        		$.post('${path}/manage/menu!list.html',{},function(data){
    		        			$('#tt_menu').treegrid('load',data);
        		        		cbt.combotree('loadData',data);
    		        		});
    		        	}
    		        });
    			}
    		},{
    			text:'关闭',
    			handler:function(){
    				box.dialog('close');
    			}
    		}],
    		onOpen:function(){
    			var node=$('#tt_menu').treegrid('getSelected');
		        if(node){
		        	cbt.combotree('setValue',node.id);
		        }else{
		        	cbt.combotree('setValue',$('#tt_menu').treegrid('getRoot').id);
		        }
    		}
        });
    	cbt.combotree({
        	width:288,
            url: '${path}/manage/menu!list.html',    
            required: true   
        });
        
        

    });
    $(function(){ //编辑
    	var box = $('#part_edit');
    	var cbt = box.find('[name=parent_id]').eq(0);
    	box.dialog({    
            title: '编辑数据',    
            width: 500,    
            closed: true,    
            resizable: true,    
            modal: true,
            buttons:[{
    			text:'提交修改',
    			handler:function(){
    		        $.post('${path}/manage/menu!update.html',
    		        	box.find('form').serialize()
    		        ,function(data){
    		        	if(data=='success'){
    		        		$.post('${path}/manage/menu!list.html',{},function(data){
    		        			$('#tt_menu').treegrid('load',data);
        		        		cbt.combotree('loadData',data);
    		        		});
    		        	}
    		        });
    			}
    		},{
    			text:'关闭',
    			handler:function(){
    				box.dialog('close');
    			}
    		}],
    		onOpen:function(){
    			var node=$('#tt_menu').treegrid('getSelected');
		        if(node){
		        	$('#part_edit').find('form').form('load',node);
		        	var pnode = $('#tt_menu').treegrid('getParent',node.id);
		        	if(pnode){
		        		cbt.combotree('setValue',pnode.id);
		        	}else{
		        		cbt.combotree('setValue',$('#tt_menu').treegrid('getRoot').id);
		        	}
		        	
		        }
    		}
        });
    	cbt.combotree({
        	width:288,
            url: '${path}/manage/menu!list.html',    
            required: true   
        });
        
        

    });
    
    </script>

    <script type="text/javascript">
    
    $(function(){
    	$('#tt_menu').treegrid({
    	    url:'${path}/manage/menu!list.html',
    	    loadMsg:'正在加载，请稍候...',
    	    idField:'id',    
    	    treeField:'text',    
    	    columns:[[    
    	        {field:'text',title:'菜单文字',width:280}, 
    	        {field:'icon',title:'图标',width:46,align:'center',formatter: function(value,row,index){
	    				if (row.icon){
	    					return '<i class="'+row.icon+'" style="font-size:16px;color:'+row.color+';"></i>';
	    				}
	    			}
				}, 
    	        {field:'href',title:'链接地址',width:360},
    	        {field:'sort',title:'顺序',width:60,align:'center',formatter: function(value,row,index){
    	        		//var e = '<input value="'+row.sort+'" class="form-control"  >';
						return row.sort;
	    			}
    	        }
    	    ]],
    	    toolbar: [{
    	    	text:'添加数据',
    			iconCls: 'icon-add',
    			handler: function(){
    				var node=$('#tt_menu').treegrid('getSelected');
    				$('#part_add').dialog('open');
    			}
    		},'-',{
    			text:'编辑数据',
    			iconCls: 'icon-edit',
    			handler: function(){
    				var node=$('#tt_menu').treegrid('getSelected');
    		        if(node){
    		        	if(node.id==''){
    		        		swal(node.text+"不允许编辑", "", "error");
    		        	}else{
    		        		$('#part_edit').dialog('open');
    		        		$('#part_edit [name=icon]').val(node.icon).click(); //点击时会把input中的值显示到图标框进行预览
    		        	}
    		        	
    		        }else{
    		        	swal("请选择数据", "", "warning");
    		        }
    			}
    		},'-',{
    			text:'删除数据',
    			iconCls: 'icon-remove',
    			handler: function(){
    				var node=$('#tt_menu').treegrid('getSelected');
    		        if(node){
    		        	if(node.id==''){
    		        		swal(node.text+"不允许删除", "", "error");
    		        		return;
    		        	}
    		        	if(node.children.length>0){
    		        		swal("无法删除", "含有子数据，无法删除！", "error");
    		        		return;
    		        	}
    		        	swal({   
    		        		title: "确定删除吗?",   
    		        		text: "删除后将无法恢复!",
							type: "warning",   
							showCancelButton: true,   
							confirmButtonColor: "#DD6B55",   
							confirmButtonText: "确认删除!",   
							cancelButtonText: "取消",   
							closeOnConfirm: false 
						}, function(){   
							$.post('${path}/manage/menu!del.html',{
								'id':node.id
							},function(data){
								if(data=='success'){
									swal("删除成功!", "您已经成功删除了一个菜单.", "success");
									$('#tt_menu').treegrid('reload');
								}
							});
						});
    		        }else{
    		        	swal("请选择数据", "", "warning");
    		        }
    				
    			}
    		},'-',{
    			text:'刷新',
    			iconCls: 'icon-reload',
    			handler: function(){
    				$('#tt_menu').treegrid('reload');
    			}
    		}]
    	});  

	});
    
    </script>
    
<cc:base type="layer,sweetalert,colpick"></cc:base>

</body>

</html>
