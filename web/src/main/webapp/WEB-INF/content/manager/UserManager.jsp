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

    <title>用户管理</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link href="${res}/hplus4.2/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="${res}/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${res}/0.1.5/webuploader.css" rel="stylesheet" type="text/css" >
    <cc:base type="jquery,bootstrap,font-awesome,animate,bootstrap-table,layer"></cc:base>
    
    
</head>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        
        <!-- Panel Other -->
        <div class="ibox float-e-margins">

            <div class="ibox-content">
                <div class="row row-lg">

                    <div class="col-sm-12">
                        <!-- Example Events -->
                        <div class="example-wrap">
                            <div class="example">
                                <div class="btn-group hidden-xs" id="toolbar" role="group">
                                <%-- <shiro:hasPermission name="manage:user:save"> --%>
                                    <button type="button" class="btn btn-outline btn-default">
                                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
										新建
                                    </button>
                                <%-- </shiro:hasPermission> --%>
                                    <button type="button" class="btn btn-outline btn-default">
                                        <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>
										修改
                                    </button>
                                    <button type="button" class="btn btn-outline btn-default">
                                        <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
										删除
                                    </button>
                                    <button type="button" class="btn btn-outline btn-default">
                                        <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
										批量导入
                                    </button>
                                    <button type="button" class="btn btn-outline btn-default">
                                        <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
										重置密码
                                    </button>
                                </div>
                                <table id="tb_user" data-height="400" data-mobile-responsive="true"></table>
                            </div>
                        </div>
                        <!-- End Example Events -->
                    </div>
                </div>
            </div>
        </div>
        <!-- End Panel Other -->
    </div>
    
    
    <!-- 添加数据 -->
    <div id="part_add" class="ibox float-e-margins" style="display: none;">
	    <div class="ibox-content">
	        <form class="form-horizontal m-t" id="signupForm">
	            <div class="form-group">
	                <label class="col-sm-3 control-label">账号：</label>
	                <div class="col-sm-8">
	                    <input id="username" name="username" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error">
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-3 control-label">密码：</label>
	                <div class="col-sm-8">
	                    <input id="password" name="password" class="form-control" type="password">
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-3 control-label">姓名：</label>
	                <div class="col-sm-8">
	                    <input id="username" name="realname" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error">
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-3 control-label">邮箱：</label>
	                <div class="col-sm-8">
	                    <input id="email" name="email" class="form-control" type="email">
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-3 control-label">邮箱：</label>
	                <div class="col-sm-8">
	                    <select class="form-control m-b" name="state">
							<option value="0">未激活</option>
							<option value="1">正常</option>
							<option value="2">被屏蔽</option>
						</select>
	                </div>
	            </div>
	            <div class="form-group">
	                <div class="col-sm-8 col-sm-offset-3">
	                    <button class="btn btn-primary submit" type="button">提交</button>
	                    <button class="btn btn-primary" type="reset">重置</button>
	                </div>
	            </div>
	        </form>
	    </div>
	</div>
    <!-- 修改数据 -->
    <div id="part_edit" class="ibox float-e-margins" style="display: none;">
	    <div class="ibox-content">
	        <form class="form-horizontal m-t" id="signupForm">
	        	<input type="hidden" name="id" >
	            <div class="form-group">
	                <label class="col-sm-3 control-label">账号：</label>
	                <div class="col-sm-8">
	                    <input id="username" name="username" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error" 
	                    readonly="readonly" style="cursor: not-allowed;">
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-3 control-label">姓名：</label>
	                <div class="col-sm-8">
	                    <input id="username" name="realname" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error">
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-3 control-label">邮箱：</label>
	                <div class="col-sm-8">
	                    <input id="email" name="email" class="form-control" type="email">
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-3 control-label">邮箱：</label>
	                <div class="col-sm-8">
	                    <select class="form-control m-b" name="state">
							<option value="0">未激活</option>
							<option value="1">正常</option>
							<option value="2">被屏蔽</option>
						</select>
	                </div>
	            </div>
	            <div class="form-group">
	                <div class="col-sm-8 col-sm-offset-3">
	                    <button class="btn btn-primary submit" type="button">提交修改</button>
	                </div>
	            </div>
	        </form>
	    </div>
	</div>
    <!-- 批量上传 -->
    <div id="part_batch" class="ibox float-e-margins" style="display: none;">
	    <div class="ibox-content">
            <div class="page-container">
				<a href="javascript:window.open('${path}/upload/user.xls','_blank');">下载Excel模板文件</a><br><br><br>
				<input type="file" accept=".xls" >
				<button type="button" class="btn btn-default">批量上传</button>
				<script type="text/javascript">
					$('#part_batch').find('button:eq(0)').click(function(){
						var fd = new FormData();
					    fd.append("upload", 1);
					    fd.append("file", $(this).parent().find(':file')[0].files[0]);
					    $.ajax({
					        url: "${path}/manage/user!batch.html",
					        type: "POST",
					        processData: false,
					        contentType: false,
					        data: fd,
					        success: function(d) {
					            console.log(d);
					        }
					    });
					});
				</script>
            </div>
        </div>
	</div>

    <!-- 全局js -->
    <script src="${res}/hplus4.2/js/jquery.min.js?v=2.1.4"></script>
    <script src="${res}/3.3.7/js/bootstrap.min.js"></script>

    <!-- 自定义js -->
    <script src="${res}/hplus4.2/js/content.js?v=1.0.0"></script>


    <!-- Bootstrap table -->
    <script src="${res}/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
    <script src="${res}/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.js"></script>
    
    <script src="${res}/layer/layer.js" type="text/javascript"></script>
    
    <!-- Sweet alert -->
    <script src="${res}/sweetalert/sweetalert.min.js"></script>
    <script src="${res}/0.1.5/webuploader.min.js"></script>

    <script type="text/javascript">
    
    $(function(){
    
    var cc = {
	    "username":"string",
	    "password":"string",
	    "realname":"string",
	    "email":"string",
	    "createTime":"date",
	    "state":"int",
	    "salt":"int",
	    "icon":"string"
    };
    
		var queryParams = function (params) {
			 return { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
				order: params.order,
				ordername: params.sort,
				page:parseInt(params.offset/params.limit)+1,
				rows:params.limit
			 };
		};
    
    	function StateFormatter(value,row,index){
			if(value=='0')return '未激活';
			if(value=='1')return '正常';
			if(value=='2')return '被屏蔽';
		}

		var table =
		$('#tb_user').bootstrapTable({
			url: '${path}/manage/user!json.html', //请求后台的URL（*）
			method: 'get', //请求方式（*）
			toolbar: '#toolbar', //工具按钮用哪个容器
			striped: false, //是否显示行间隔色
			cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination: true, //是否显示分页（*）
			sortable: true, //是否启用排序
			sortOrder: "asc", //排序方式
			queryParams: queryParams,//传递参数（*）
			sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
			pageNumber:1, //初始化加载第一页，默认第一页
			pageSize: 25, //每页的记录行数（*）
			pageList: [10, 25, 50, 100], //可供选择的每页的行数（*）
			search: true, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			strictSearch: true,
			showColumns: true, //是否显示所有的列
			showRefresh: true, //是否显示刷新按钮
			minimumCountColumns: 2, //最少允许的列数
			clickToSelect: true, //是否启用点击选中行
			height: 580, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
			uniqueId: "ID", //每一行的唯一标识，一般为主键列
			showToggle:true, //是否显示详细视图和列表视图的切换按钮
			cardView: false, //是否显示详细视图
			detailView: false, //是否显示父子表
			columns: [{checkbox: true}, 
				{field: 'username',title: '账号'},
				{field: 'realname',title: '姓名'},
				{field: 'email',title: '邮箱'},
				{field: 'createTime',title: '创建时间'},
				{field: 'state',title: '状态',formatter:StateFormatter}
			]
		});
		
		//添加数据按钮
		$("#toolbar > button:eq(0)").click(function(){
		    layer.open({
		      type: 1,
		      title: '添加数据',
		      shadeClose: false,
		      shade: 0.3,
		      maxmin: true, //开启最大化最小化按钮
		      area: ['500px', '450px'],
		      content: $("#part_add").show()
		    });
		});
		
		$("#toolbar > button:eq(2)").click(function(){
		    var rows = table.bootstrapTable("getSelections");
	    	if(rows.length==0){
	    		layer.msg('请选择要删除的数据', function(){ });
	    		return;
	    	}
		    swal({
		        title: "您确定要删除这些数据吗",
		        text: "删除后将无法恢复，请谨慎操作！",
		        type: "warning",
		        showCancelButton: true,
		        confirmButtonColor: "#DD6B55",
		        confirmButtonText: "删除",
		        cancelButtonText:'取消',
		        closeOnConfirm: false
		    }, function () {
		    	var data = '';
		    	for(var n in rows){
		    		data += 'ids='+rows[n].id+'&';
		    	}
		    	$.post('${path}/manage/user!delete.html',data,function(data){
		    		if(data=='success'){
		    			table.bootstrapTable("refresh");
		    			swal("删除成功！", "您已经删除了这条信息。", "success");
		    		}else{
		    			layer.msg('添加失败', function(){ });
		    		}
		    	});
		        
		    });
		});
		
		//Excel批量导入
		$("#toolbar > button:eq(3)").click(function(){ 
			layer.open({
		      type: 1,
		      title: '使用Excel批量导入数据',
		      shadeClose: false,
		      shade: 0.3,
		      maxmin: true, //开启最大化最小化按钮
		      area: ['600px', '300px'],
		      content: $("#part_batch").show()
		    });
			
		});
		//添加数据
		$("#part_add .submit").click(function(){
	    	var data = $("#part_add form").serialize()
	    	var ly = layer.msg('正在提交到服务器', {icon: 16,shade: 0.3});
	    	$.post('${path}/manage/user!save.html',data,function(data){
	    		layer.close(ly);
	    		if(data=='success'){
	    			table.bootstrapTable("refresh");
	    			layer.msg('数据添加成功');
	    		}else{
	    			layer.msg('添加失败', function(){ });
	    		}
	    	});
	    });
		//编辑数据
		var panel = $("#part_edit");
		$("#toolbar > button:eq(1)").click(function(){
			var rows = table.bootstrapTable("getSelections");
			if(rows.length==0){
				layer.msg('请选择要删除的数据', function(){ });
				return;
			}
			if(rows.length>1){
				layer.msg('只能对一条数据进行编辑', function(){ });
				return;
			}
			$.each(rows[0],function(field,value){
				var o=panel.find("[name='"+field+"']").val(value);
				if(o.length==0){
					if(!(Object.prototype.toString.call(o)=='[object Array]')){
						panel.find('form').append($('<input type="hidden">').attr('name',field).val(value));
					}
				}
			});
		    layer.open({
		      type: 1,
		      title: '修改数据',
		      shadeClose: false,
		      shade: 0.3,
		      maxmin: true, //开启最大化最小化按钮
		      area: ['600px', '450px'],
		      content: panel.show()
		    });
		});
		panel.find(".submit").click(function(){
	    	var data = panel.find("form").serialize()
	    	var ly = layer.msg('正在提交到服务器', {icon: 16,shade: 0.3});
	    	$.post('${path}/manage/user!edit.html',data,function(data){
	    		layer.close(ly);
	    		if(data=='success'){
	    			table.bootstrapTable("refresh");
	    			layer.msg('数据修改成功');
	    		}else{
	    			layer.msg('添加失败', function(){ });
	    		}
	    	});
	    });
	    //重置密码为123456
	    $("#toolbar > button:eq(4)").click(function(){
		    var rows = table.bootstrapTable("getSelections");
	    	if(rows.length==0){
	    		layer.msg('请选择数据', function(){ });
	    		return;
	    	}
		    swal({
		        title: "您确定要将这些用户重置密码？",
		        text: "重置后密码为123456！",
		        type: "warning",
		        showCancelButton: true,
		        confirmButtonColor: "#DD6B55",
		        confirmButtonText: "确定重置",
		        cancelButtonText:'取消',
		        closeOnConfirm: false
		    }, function () {
		    	var data = '';
		    	for(var n in rows){
		    		data += 'ids='+rows[n].id+'&';
		    	}
		    	$.post('${path}/manage/user!resetpw.html',data,function(data){
		    		if(data=='success'){
		    			table.bootstrapTable("refresh");
		    			swal("重置成功！", "用户密码已经重置为123456。", "success");
		    		}else{
		    			layer.msg('通讯异常', function(){ });
		    		}
		    	});
		        
		    });
		});
	    
	    var uploader = WebUploader.create({
		    // swf文件路径
		    swf: '${res}/0.1.5/Uploader.swf',
		    // 文件接收服务端。
		    server: '',
		    // 选择文件的按钮。可选。
		    // 内部根据当前运行时创建，可能是input元素，也可能是flash.
		    pick: '#picker',
		    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		    resize: false,
		    accept: {
		        title: '选择Excel文件',
		        extensions: 'xls'
		    }
		});
		
	});
    
    </script>

</body>

</html>
