<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html style="overflow-x:auto;overflow-y:auto;">
<head>
	<title>机构管理</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" /><meta name="author" content="http://www.jeeplus.org/"/>
<meta name="renderer" content="webkit"><meta http-equiv="X-UA-Compatible" content="IE=9,IE=10" />
<meta http-equiv="Expires" content="0"><meta http-equiv="Cache-Control" content="no-cache"><meta http-equiv="Cache-Control" content="no-store">
<!-- 引入jquery插件 -->
<script src="http://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/jquery-migrate/3.0.0/jquery-migrate.min.js"></script>
<script type="text/javascript" src="/jeeplus/static/TableDnD/jquery.tablednd.js"></script>


<!-- 引入依赖的第三方插件 -->
<script src="http://cdn.bootcss.com/jQuery-slimScroll/1.3.8/jquery.slimscroll.min.js"></script>


<script src="/jeeplus/static/jquery-validation/1.14.0/jquery.validate.min.js" type="text/javascript"></script>
<script src="/jeeplus/static/jquery-validation/1.14.0/localization/messages_zh.min.js" type="text/javascript"></script>
<link href="/jeeplus/static/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
<script src="/jeeplus/static/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
<script src="/jeeplus/static/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="/jeeplus/static/pace/pace.min.js"></script>
<script src="/jeeplus/static/metisMenu/jquery.metisMenu.js"></script>
<link href="/jeeplus/static/iCheck/custom.css" rel="stylesheet" />
<script src="/jeeplus/static/iCheck/icheck.min.js"></script>
<script src="/jeeplus/static/iCheck/icheck-init.js"></script>

<link href="http://cdn.bootcss.com/datatables/1.10.13/css/dataTables.bootstrap.min.css" rel="stylesheet">
<script src="http://cdn.bootcss.com/datatables/1.10.13/js/jquery.dataTables.min.js"></script>
<script src="http://cdn.bootcss.com/datatables/1.10.13/js/dataTables.bootstrap.min.js"></script>




<!-- jeeplus -->
<link href="/jeeplus/static/common/jeeplus.css" type="text/css" rel="stylesheet" />
<script src="/jeeplus/static/common/jeeplus.js" type="text/javascript"></script>

<!-- jquery ui -->
<script src="/jeeplus/static/jquery-ui/jquery-ui.min.js"></script>

<!-- 引入bootstrap插件 -->
<!-- bootswatch主题效果不怎么好，停止切换，使用官网的默认版本，如果你想切换主题请访问http://bootswatch.com/下载最新版版主题，by刘高峰 -->
<link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="/jeeplus/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet" />

<!-- 引入layer插件 -->
<script src="http://cdn.bootcss.com/layer/3.0.1/layer.min.js"></script>
<script src="/jeeplus/static/layer-v2.3/layer/laydate/laydate.js"></script>

<!--引入webuploader-->
<link rel="stylesheet" type="text/css" href="/jeeplus/static/webuploader-0.1.5/webuploader.css">
<script type="text/javascript" src="/jeeplus/static/webuploader-0.1.5/webuploader.js"></script>


<!-- 引入自定义文件 -->
<script src="/jeeplus/static/common/mustache.min.js" type="text/javascript"></script>
<script src="/jeeplus/static/common/content.js" type="text/javascript"></script>
<link href="/jeeplus/static/common/css/login.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">var ctx = '/jeeplus/a', ctxStatic='/jeeplus/static';</script>








		
	
	
	<meta name="decorator" content="default"/>
<link href="http://cdn.bootcss.com/jquery-treetable/3.2.0/css/jquery.treetable.min.css" rel="stylesheet">
<script src="http://cdn.bootcss.com/jquery-treetable/3.2.0/jquery.treetable.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var tpl = $("#treeTableTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
			var data = [{"id":"e0ef8af9cae6416f8bb359714a1b4244","isNewRecord":false,"remarks":"","createDate":"2015-11-11 09:41:41","updateDate":"2015-11-11 09:41:55","parentIds":"0,1,","name":"行政部","sort":30,"area":{"id":"4d8ec70b0e0c4c97af07b97c9a906c40","isNewRecord":false,"remarks":null,"createDate":null,"updateDate":null,"parentIds":null,"name":null,"sort":30,"code":null,"type":null,"parentId":"0"},"code":"","type":"2","grade":"1","address":"","zipCode":"","master":"","phone":"","fax":"","email":"","useable":"1","primaryPerson":{"id":"","isNewRecord":true,"remarks":null,"createDate":null,"updateDate":null,"loginName":null,"no":null,"name":null,"email":null,"phone":null,"mobile":null,"userType":null,"loginIp":null,"loginDate":null,"loginFlag":"1","photo":null,"qrCode":null,"oldLoginName":null,"newPassword":null,"sign":null,"oldLoginIp":null,"oldLoginDate":null,"role":null,"admin":false,"roleNames":""},"deputyPerson":{"id":"","isNewRecord":true,"remarks":null,"createDate":null,"updateDate":null,"loginName":null,"no":null,"name":null,"email":null,"phone":null,"mobile":null,"userType":null,"loginIp":null,"loginDate":null,"loginFlag":"1","photo":null,"qrCode":null,"oldLoginName":null,"newPassword":null,"sign":null,"oldLoginIp":null,"oldLoginDate":null,"role":null,"admin":false,"roleNames":""},"childDeptList":null,"parentId":"1"},{"id":"6a642e140e40496a8d467c646b8e935e","isNewRecord":false,"remarks":"","createDate":"2015-12-03 10:10:13","updateDate":"2016-01-11 15:10:10","parentIds":"0,1,","name":"市场部","sort":30,"area":{"id":"17e8e72326574a0ea94b15d6eeddbb6d","isNewRecord":false,"remarks":null,"createDate":null,"updateDate":null,"parentIds":"0,1,c11497c3311a4be29253f29bd59ab485,364a832bee8a42afa333e338813330de,","name":"软件大道","sort":30,"code":null,"type":null,"parentId":"0"},"code":"1000","type":"2","grade":"1","address":"","zipCode":"","master":"","phone":"","fax":"","email":"","useable":"1","primaryPerson":{"id":"","isNewRecord":true,"remarks":null,"createDate":null,"updateDate":null,"loginName":null,"no":null,"name":null,"email":null,"phone":null,"mobile":null,"userType":null,"loginIp":null,"loginDate":null,"loginFlag":"1","photo":null,"qrCode":null,"oldLoginName":null,"newPassword":null,"sign":null,"oldLoginIp":null,"oldLoginDate":null,"role":null,"admin":false,"roleNames":""},"deputyPerson":{"id":"","isNewRecord":true,"remarks":null,"createDate":null,"updateDate":null,"loginName":null,"no":null,"name":null,"email":null,"phone":null,"mobile":null,"userType":null,"loginIp":null,"loginDate":null,"loginFlag":"1","photo":null,"qrCode":null,"oldLoginName":null,"newPassword":null,"sign":null,"oldLoginIp":null,"oldLoginDate":null,"role":null,"admin":false,"roleNames":""},"childDeptList":null,"parentId":"1"},{"id":"1","isNewRecord":false,"remarks":"","createDate":"2013-05-27 00:00:00","updateDate":"2015-11-11 09:40:49","parentIds":"0,","name":"总公司","sort":10,"area":{"id":"4d8ec70b0e0c4c97af07b97c9a906c40","isNewRecord":false,"remarks":null,"createDate":null,"updateDate":null,"parentIds":null,"name":null,"sort":30,"code":null,"type":null,"parentId":"0"},"code":"100000","type":"1","grade":"1","address":"","zipCode":"","master":"","phone":"","fax":"","email":"","useable":"1","primaryPerson":{"id":"","isNewRecord":true,"remarks":null,"createDate":null,"updateDate":null,"loginName":null,"no":null,"name":null,"email":null,"phone":null,"mobile":null,"userType":null,"loginIp":null,"loginDate":null,"loginFlag":"1","photo":null,"qrCode":null,"oldLoginName":null,"newPassword":null,"sign":null,"oldLoginIp":null,"oldLoginDate":null,"role":null,"admin":false,"roleNames":""},"deputyPerson":{"id":"","isNewRecord":true,"remarks":null,"createDate":null,"updateDate":null,"loginName":null,"no":null,"name":null,"email":null,"phone":null,"mobile":null,"userType":null,"loginIp":null,"loginDate":null,"loginFlag":"1","photo":null,"qrCode":null,"oldLoginName":null,"newPassword":null,"sign":null,"oldLoginIp":null,"oldLoginDate":null,"role":null,"admin":false,"roleNames":""},"childDeptList":null,"parentId":"0"},{"id":"4","isNewRecord":false,"remarks":"","createDate":"2013-05-27 00:00:00","updateDate":"2016-01-11 15:10:27","parentIds":"0,1,","name":"财务部","sort":30,"area":{"id":"17e8e72326574a0ea94b15d6eeddbb6d","isNewRecord":false,"remarks":null,"createDate":null,"updateDate":null,"parentIds":"0,1,c11497c3311a4be29253f29bd59ab485,364a832bee8a42afa333e338813330de,","name":"软件大道","sort":30,"code":null,"type":null,"parentId":"0"},"code":"100003","type":"2","grade":"1","address":"","zipCode":"","master":"","phone":"","fax":"","email":"","useable":"1","primaryPerson":{"id":"","isNewRecord":true,"remarks":null,"createDate":null,"updateDate":null,"loginName":null,"no":null,"name":null,"email":null,"phone":null,"mobile":null,"userType":null,"loginIp":null,"loginDate":null,"loginFlag":"1","photo":null,"qrCode":null,"oldLoginName":null,"newPassword":null,"sign":null,"oldLoginIp":null,"oldLoginDate":null,"role":null,"admin":false,"roleNames":""},"deputyPerson":{"id":"","isNewRecord":true,"remarks":null,"createDate":null,"updateDate":null,"loginName":null,"no":null,"name":null,"email":null,"phone":null,"mobile":null,"userType":null,"loginIp":null,"loginDate":null,"loginFlag":"1","photo":null,"qrCode":null,"oldLoginName":null,"newPassword":null,"sign":null,"oldLoginIp":null,"oldLoginDate":null,"role":null,"admin":false,"roleNames":""},"childDeptList":null,"parentId":"1"},{"id":"5","isNewRecord":false,"remarks":null,"createDate":"2013-05-27 00:00:00","updateDate":"2013-05-27 00:00:00","parentIds":"0,1,","name":"技术部","sort":40,"area":{"id":"2","isNewRecord":false,"remarks":null,"createDate":null,"updateDate":null,"parentIds":null,"name":null,"sort":30,"code":null,"type":null,"parentId":"0"},"code":"100004","type":"2","grade":"1","address":null,"zipCode":null,"master":null,"phone":null,"fax":null,"email":null,"useable":"1","primaryPerson":null,"deputyPerson":null,"childDeptList":null,"parentId":"1"}], rootId = "0";
			addRow("#treeTableList", tpl, data, rootId, true);
			$("#treeTable").treeTable({expandLevel : 5});
		});
		function addRow(list, tpl, data, pid, root){
			for (var i=0; i<data.length; i++){
				var row = data[i];
				if ((!row?'':!row.parentId?'':row.parentId) == pid){
					$(list).append(Mustache.render(tpl, {
						dict: {
							type: getDictLabel([{"id":"21","isNewRecord":false,"remarks":null,"createDate":"2013-05-27 00:00:00","updateDate":"2013-05-27 00:00:00","value":"1","label":"公司","type":"sys_office_type","description":"机构类型","sort":60,"parentId":"0"},{"id":"22","isNewRecord":false,"remarks":null,"createDate":"2013-05-27 00:00:00","updateDate":"2013-05-27 00:00:00","value":"2","label":"部门","type":"sys_office_type","description":"机构类型","sort":70,"parentId":"0"},{"id":"23","isNewRecord":false,"remarks":null,"createDate":"2013-05-27 00:00:00","updateDate":"2013-05-27 00:00:00","value":"3","label":"小组","type":"sys_office_type","description":"机构类型","sort":80,"parentId":"0"},{"id":"24","isNewRecord":false,"remarks":null,"createDate":"2013-05-27 00:00:00","updateDate":"2013-05-27 00:00:00","value":"4","label":"其它","type":"sys_office_type","description":"机构类型","sort":90,"parentId":"0"}], row.type)
						}, pid: (root?0:pid), row: row
					}));
					addRow(list, tpl, data, row.id);
				}
			}
		}
		function refresh(){//刷新或者排序，页码不清零
    		
			window.location="/jeeplus/a/sys/office/list";
    	}
	</script>

</head>
<body id="" class=""  style="">
	
	<div class="wrapper wrapper-content">
	













<!-- 0:隐藏tip, 1隐藏box,不设置显示全部 -->


<script type="text/javascript">top.$.jBox.closeTip();</script>

		<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12">
		<div class="pull-left">
			
				



















<button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="add()" title="添加"><i class="fa fa-plus"></i> 添加</button>

<script type="text/javascript">
	function add(){
		openDialog("新增"+'机构',"/jeeplus/a/sys/office/form?parent.id=","800px", "620px","officeContent");
	}
</script><!-- 增加按钮 -->
			
	        <button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="refresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>
			</div>
	</div>
	</div>
	<table id="treeTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
		<thead><tr><th>机构名称</th><th>归属区域</th><th>机构编码</th><th>机构类型</th><th>备注</th><th>操作</th></tr></thead>
		<tbody id="treeTableList"></tbody>
	</table>
	</div>
	<script type="text/template" id="treeTableTpl">
		<tr id="{{row.id}}" pId="{{pid}}">
			<td><a  href="#" onclick="openDialogView('查看机构', '/jeeplus/a/sys/office/form?id={{row.id}}','800px', '620px')">{{row.name}}</a></td>
			<td>{{row.area.name}}</td>
			<td>{{row.code}}</td>
			<td>{{dict.type}}</td>
			<td>{{row.remarks}}</td>
			<td>
				
					<a href="#" onclick="openDialogView('查看机构', '/jeeplus/a/sys/office/form?id={{row.id}}','800px', '620px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>
				
				
					<a href="#" onclick="openDialog('修改机构', '/jeeplus/a/sys/office/form?id={{row.id}}','800px', '620px', 'officeContent')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 修改</a>
				
				
					<a href="/jeeplus/a/sys/office/delete?id={{row.id}}" onclick="return confirmx('要删除该机构及所有子机构项吗？', this.href)" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>
				
				
					<a href="#" onclick="openDialog('添加下级机构', '/jeeplus/a/sys/office/form?parent.id={{row.id}}','800px', '620px', 'officeContent')" class="btn  btn-primary btn-xs"><i class="fa fa-plus"></i> 添加下级机构</a>
				
			</td>
		</tr>
	</script>

	<script type="text/javascript">//<!-- 无框架时，左上角显示菜单图标按钮。
		if(!(self.frameElement && self.frameElement.tagName=="IFRAME")){
			$("body").prepend("<i id=\"btnMenu\" class=\"icon-th-list\" style=\"cursor:pointer;float:right;margin:10px;\"></i><div id=\"menuContent\"></div>");
			$("#btnMenu").click(function(){

				top.layer.open({
				    type: 2, 
				    area:['300px','350px'],
				    content: 'get:/jeeplus/a/sys/menu/treeselect;JSESSIONID=c95e4a67705046289967cba72e6814dc' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
				});
				//top.$.jBox('get:/jeeplus/a/sys/menu/treeselect;JSESSIONID=c95e4a67705046289967cba72e6814dc', {title:'选择菜单', buttons:{'关闭':true}, width:300, height: 350, top:10});
				//if ($("#menuContent").html()==""){$.get("/jeeplus/a/sys/menu/treeselect", function(data){$("#menuContent").html(data);});}else{$("#menuContent").toggle(100);}
			});
		}//-->
	</script>
</body>
</html>