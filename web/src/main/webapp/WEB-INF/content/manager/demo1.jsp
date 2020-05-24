<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@ taglib prefix="f" uri="/jeelite-tags" %>
<f:base type="jquery,jquery-storage-api,font-awesome,jquery-easyui,layui"></f:base>
<f:base type="jquery-cookie"></f:base>


<!-- 
<script type="text/javascript" src="plug-in/mutiLang/zh-cn.js"></script>
<script type="text/javascript" src="plug-in/tools/dataformat.js"></script>
<script type="text/javascript" src="plug-in/easyui/locale/zh-cn.js"></script>
<script type="text/javascript" src="plug-in/tools/syUtil.js"></script>
<script type="text/javascript" src="plug-in/easyui/extends/datagrid-scrollview.js"></script>
<script type="text/javascript" src="plug-in/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="plug-in/tools/css/metrole/common.css" type="text/css"></link>
<script type="text/javascript" src="plug-in/lhgDialog/lhgdialog.min.js?skin=metrole"></script>
<script type="text/javascript" src="plug-in/ace/js/bootstrap-tab.js"></script>
<script type="text/javascript" src="plug-in/tools/curdtools_zh-cn.js"></script>
<script type="text/javascript" src="plug-in/tools/easyuiextend.js"></script>
<script type="text/javascript" src="plug-in/jquery-plugs/hftable/jquery-hftable.js"></script>
<script type="text/javascript" src="plug-in/tools/json2.js"></script>
 -->

<script type="text/javascript">
	$(function() {
		storage = $.localStorage;
		if (!storage)
			storage = $.cookieStorage;
		$('#userList').datagrid(
						{
							idField : 'id',
							title : '操作',
							url : 'userController.do?datagrid&field=id,userName,userOrgList.tsDepart.departname,realName,userKey,createBy,createDate,updateBy,updateDate,status,',
							fit : true,
							queryParams : {},
							loadMsg : '数据加载中...',
							pageSize : 10,
							pagination : true,
							pageList : [ 10, 20, 30 ],
							sortName : 'id',
							sortOrder : 'desc',
							rownumbers : true,
							singleSelect : true,
							fitColumns : true,
							striped : true,
							showFooter : true,
							frozenColumns : [ [] ],
							columns : [ [
									{
										field : 'id',
										title : '编号',
										hidden : true,
										sortable : true
									},
									{
										field : 'userName',
										title : '用户名'
									},
									{
										field : 'userOrgList.tsDepart.departname',
										title : '组织机构'
									},
									{
										field : 'realName',
										title : '真实姓名',
										sortable : true
									},
									{
										field : 'userKey',
										title : '角色',
										sortable : true
									},
									{
										field : 'createBy',
										title : '创建人',
										hidden : true,
										sortable : true
									},
									{
										field : 'createDate',
										title : '创建时间',
										hidden : true,
										sortable : true,
										formatter : function(value, rec, index) {
											return new Date().format(
													'yyyy-MM-dd', value);
										}
									},
									{
										field : 'updateBy',
										title : '修改人',
										hidden : true,
										sortable : true
									},
									{
										field : 'updateDate',
										title : '修改时间',
										hidden : true,
										sortable : true,
										formatter : function(value, rec, index) {
											return new Date().format(
													'yyyy-MM-dd', value);
										}
									},
									{
										field : 'status',
										title : '状态',
										sortable : true,
										formatter : function(value, rec, index) {
											if (value == undefined)
												return '';
											var valArray = value.split(',');
											if (valArray.length > 1) {
												var checkboxValue = '';
												for (var k = 0; k < valArray.length; k++) {
													if (valArray[k] == '1') {
														checkboxValue = checkboxValue
																+ '激活' + ',';
													}
													if (valArray[k] == '0') {
														checkboxValue = checkboxValue
																+ '未激活' + ',';
													}
													if (valArray[k] == '-1') {
														checkboxValue = checkboxValue
																+ '超级管理员' + ',';
													}
												}
												return checkboxValue
														.substring(
																0,
																checkboxValue.length - 1);
											} else {
												if (value == '1') {
													return '激活';
												}
												if (value == '0') {
													return '未激活';
												}
												if (value == '-1') {
													return '超级管理员';
												} else {
													return value;
												}
											}
										}
									},
									{
										field : 'opt',
										title : '操作',
										width : 100,
										formatter : function(value, rec, index) {
											if (!rec.id) {
												return '';
											}
											var href = '';
											href += "<a href='#'   class='ace_button'  onclick=deleteDialog('"
													+ rec.id
													+ "','"
													+ index
													+ "')>  <i class=' fa fa-trash-o'></i>";
											href += "删除</a>&nbsp;";
											return href;
										}
									} ] ],
							onLoadSuccess : function(data) {
								$("#userList").datagrid("clearSelections");
							},
							onClickRow : function(rowIndex, rowData) {
								rowid = rowData.id;
								gridname = 'userList';
							}
						});
		$('#userList').datagrid('getPager').pagination({
			beforePageText : '',
			afterPageText : '/{pages}',
			displayMsg : '{from}-{to}共 {total}条',
			showPageList : true,
			showRefresh : true
		});
		$('#userList').datagrid('getPager').pagination({
			onBeforeRefresh : function(pageNumber, pageSize) {
				$(this).pagination('loading');
				$(this).pagination('loaded');
			}
		});
		try {
			restoreheader();
		} catch (ex) {
		}
	});
	function reloadTable() {
		try {
			$('#' + gridname).datagrid('reload');
			$('#' + gridname).treegrid('reload');
		} catch (ex) {
		}
	}
	function reloaduserList() {
		$('#userList').datagrid('reload');
	}
	function getuserListSelected(field) {
		return getSelected(field);
	}
	function getSelected(field) {
		var row = $('#' + gridname).datagrid('getSelected');
		if (row != null) {
			value = row[field];
		} else {
			value = '';
		}
		return value;
	}
	function getuserListSelections(field) {
		var ids = [];
		var rows = $('#userList').datagrid('getSelections');
		for (var i = 0; i < rows.length; i++) {
			ids.push(rows[i][field]);
		}
		ids.join(',');
		return ids
	};
	function getSelectRows() {
		return $('#userList').datagrid('getChecked');
	}
	function saveHeader() {
		var columnsFields = null;
		var easyextends = false;
		try {
			columnsFields = $('#userList').datagrid('getColumns');
			easyextends = true;
		} catch (e) {
			columnsFields = $('#userList').datagrid('getColumnFields');
		}
		var cols = storage.get('userListhiddenColumns');
		var init = true;
		if (cols) {
			init = false;
		}
		var hiddencolumns = [];
		for (var i = 0; i < columnsFields.length; i++) {
			if (easyextends) {
				hiddencolumns.push({
					field : columnsFields[i].field,
					hidden : columnsFields[i].hidden
				});
			} else {
				var columsDetail = $('#userList').datagrid("getColumnOption",
						columnsFields[i]);
				if (init) {
					hiddencolumns.push({
						field : columsDetail.field,
						hidden : columsDetail.hidden,
						visible : (columsDetail.hidden == true ? false : true)
					});
				} else {
					for (var j = 0; j < cols.length; j++) {
						if (cols[j].field == columsDetail.field) {
							hiddencolumns.push({
								field : columsDetail.field,
								hidden : columsDetail.hidden,
								visible : cols[j].visible
							});
						}
					}
				}
			}
		}
		storage.set('userListhiddenColumns', JSON.stringify(hiddencolumns));
	}
	function isShowBut() {
		var isShowSearchId = $('#isShowSearchId').val();
		if (isShowSearchId == "true") {
			$("#searchColums").hide();
			$('#isShowSearchId').val("false");
			$('#columsShow').remove("src");
			$('#columsShow')
					.attr("src",
							"plug-in/easyui/themes/default/images/accordion_expand.png");
		} else {
			$("#searchColums").show();
			$('#isShowSearchId').val("true");
			$('#columsShow').remove("src");
			$('#columsShow')
					.attr("src",
							"plug-in/easyui/themes/default/images/accordion_collapse.png");
		}
	}
	function restoreheader() {
		var cols = storage.get('userListhiddenColumns');
		if (!cols)
			return;
		for (var i = 0; i < cols.length; i++) {
			try {
				if (cols.visible != false)
					$('#userList').datagrid(
							(cols[i].hidden == true ? 'hideColumn'
									: 'showColumn'), cols[i].field);
			} catch (e) {
			}
		}
	}
	function resetheader() {
		var cols = storage.get('userListhiddenColumns');
		if (!cols)
			return;
		for (var i = 0; i < cols.length; i++) {
			try {
				$('#userList').datagrid(
						(cols.visible == false ? 'hideColumn' : 'showColumn'),
						cols[i].field);
			} catch (e) {
			}
		}
	}
	function userListsearch() {
		try {
			if (!$("#userListForm").Validform({
				tiptype : 3
			}).check()) {
				return false;
			}
		} catch (e) {
		}
		if (true) {
			var queryParams = $('#userList').datagrid('options').queryParams;
			$('#userListtb').find('*').each(function() {
				queryParams[$(this).attr('name')] = $(this).val();
			});
			$('#userList')
					.datagrid(
							{
								url : 'userController.do?datagrid&field=id,userName,userOrgList.tsDepart.departname,realName,userKey,createBy,createDate,updateBy,updateDate,status,',
								pageNumber : 1
							});
		}
	}
	function dosearch(params) {
		var jsonparams = $.parseJSON(params);
		$('#userList')
				.datagrid(
						{
							url : 'userController.do?datagrid&field=id,userName,userOrgList.tsDepart.departname,realName,userKey,createBy,createDate,updateBy,updateDate,status,',
							queryParams : jsonparams
						});
	}
	function userListsearchbox(value, name) {
		var queryParams = $('#userList').datagrid('options').queryParams;
		queryParams[name] = value;
		queryParams.searchfield = name;
		$('#userList').datagrid('reload');
	}
	$('#userListsearchbox').searchbox({
		searcher : function(value, name) {
			userListsearchbox(value, name);
		},
		menu : '#userListmm',
		prompt : '请输入查询关键字'
	});
	function EnterPress(e) {
		var e = e || window.event;
		if (e.keyCode == 13) {
			userListsearch();
		}
	}
	function searchReset(name) {
		$("#" + name + "tb").find(":input").val("");
		var queryParams = $('#userList').datagrid('options').queryParams;
		$('#userListtb').find('*').each(function() {
			queryParams[$(this).attr('name')] = $(this).val();
		});
		$('#userList')
				.datagrid(
						{
							url : 'userController.do?datagrid&field=id,userName,userOrgList.tsDepart.departname,realName,userKey,createBy,createDate,updateBy,updateDate,status,',
							pageNumber : 1
						});
	}
</script>
<table width="100%" id="userList" toolbar="#userListtb"></table>
<div id="userListtb" style="padding:3px; height: auto">
	<div name="searchColums" id="searchColums">
		<input id="isShowSearchId" type="hidden" value="false" /><input
			id="_sqlbuilder" name="sqlbuilder" type="hidden" />
		<form
			onkeydown='if(event.keyCode==13){userListsearch();return false;}'
			id='userListForm'>
			<link rel="stylesheet" href="plug-in/Validform/css/style.css" type="text/css">
			<link rel="stylesheet" href="plug-in/Validform/css/tablefrom.css" type="text/css">
			<script type="text/javascript" src="plug-in/Validform/js/Validform_v5.3.1_min_zh-cn.js"></script>
			<script type="text/javascript" src="plug-in/Validform/js/Validform_Datatype_zh-cn.js"></script>
			<script type="text/javascript" src="plug-in/Validform/js/datatype_zh-cn.js"></script>
			<span style="display:-moz-inline-box;display:inline-block;">
			<span style="vertical-align:middle;display:-moz-inline-box;display:inline-block;width: 80px;text-align:right;text-overflow:ellipsis;-o-text-overflow:ellipsis; overflow: hidden;white-space:nowrap; "
				title="用户名">用户名：</span>
				<input onkeypress="EnterPress(event)" onkeydown="EnterPress()" type="text" name="userName" class="inuptxt" style="width: 100px" />
			</span>
		</form>
	</div>
	<div style="height:30px;" class="datagrid-toolbar">
		<span style="float:left;">
			<a href="#" class="easyui-linkbutton" plain="true" icon="fa fa-plus" onclick="add('用户录入','userController.do?addorupdate','userList',null,null)">用户录入</a>
			<a href="#" class="easyui-linkbutton" plain="true" icon="fa fa-edit" onclick="update('用户编辑','userController.do?addorupdate','userList',null,null)">用户编辑</a>
			<a href="#" class="easyui-linkbutton" plain="true" icon="fa fa-repeat" onclick="update('密码重置','userController.do?changepasswordforuser','userList',null,null)">密码重置</a>
			<a href="#" class="easyui-linkbutton" plain="true" icon="fa fa-lock" onclick="lockObj('锁定用户','userController.do?lock&lockvalue=0','userList',null,null)">锁定用户</a>
			<a href="#" class="easyui-linkbutton" plain="true" icon="fa fa-user" onclick="unlockObj('激活用户','userController.do?lock&lockvalue=1','userList',null,null)">激活用户</a>
			<a href="#" class="easyui-linkbutton" plain="true" icon="fa fa-sign-in" onclick="ImportXls('导入','null','userList',null,null)">导入</a>
			<a href="#" class="easyui-linkbutton" plain="true" icon="fa fa-sign-out" onclick="ExportXls('导出','null','userList',null,null)">导出</a>
			<a href="#" class="easyui-linkbutton" plain="true" icon="fa fa-download" onclick="ExportXlsByT('模板下载','null','userList',null,null)">模板下载</a>
		</span>
		<span style="float:right">
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="userListsearch()">查询</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-reload" onclick="searchReset('userList')">重置</a>
		</span>
	</div>
	<script>
		$(function() {
			var datagrid = $("#userListtb");
			//datagrid.find("div[name='searchColums']").append($("#tempSearchColums div[name='searchColums']").html());
			datagrid
					.find("div[name='searchColums']")
					.find("form#userListForm")
					.append(
							$(
									"#realNameSearchColums div[name='searchColumsRealName']")
									.html());
			$("#realNameSearchColums").html('');
			datagrid.find("div[name='searchColums']").find("form#userListForm")
					.append(
							$("#tempSearchColums div[name='searchColums']")
									.html());
			$("#tempSearchColums").html('');
		});
	</script>
	<div id="realNameSearchColums" style="display: none;">
		<div name="searchColumsRealName">
			<span style="display:-moz-inline-box;display:inline-block;"><span
				style="vertical-align:middle;display:-moz-inline-box;display:inline-block;width: 80px;text-align:right;"
				title="真实姓名" />真实姓名：</span>
				<input readonly="true" type="text" id="realName" name="realName" style="width: 200px" onclick="openUserSelect()"></span>
			<script type="text/javascript">
				function openUserSelect() {
					$.dialog.setting.zIndex = 9999;
					$.dialog({
						content : 'url:userController.do?userSelect',
						zIndex : 2100,
						title : '用户列表',
						lock : true,
						width : '1000px',
						height : '600px',
						opacity : 0.4,
						button : [ {
							name : '确定',
							callback : callbackUserSelect,
							focus : true
						}, {
							name : '取消',
							callback : function() {
							}
						} ]
					}).zindex();
				}
				function callbackUserSelect() {
					var iframe = this.iframe.contentWindow;
					var rowsData = iframe.$('#userList1').datagrid(
							'getSelections');
					if (!rowsData || rowsData.length == 0) {
						tip('<t:mutiLang langKey="common.please.select.edit.item"/>');
						return;
					}
					var names = rowsData[0].realName;
					$('#realName').val(names);
					$('#realName').blur();
				}
			</script>
		</div>
	</div>
	<div id="tempSearchColums" style="display: none;">
		<div name="searchColums">
			<span style="display:-moz-inline-box;display:inline-block;"><span
				style="vertical-align:middle;display:-moz-inline-box;display:inline-block;width: 80px;text-align:right;"
				title="组织机构" />组织机构：</span><input readonly="true" type="text"
				id="departname" name="departname" style="width: 300px"
				onclick="openDepartmentSelect()" /><input id="orgIds"
				name="orgIds" type="hidden"></span>
			<script type="text/javascript">
				function openDepartmentSelect() {
					$.dialog.setting.zIndex = 9999;
					$.dialog({
						content : 'url:departController.do?departSelect',
						zIndex : 2100,
						title : '组织机构列表',
						lock : true,
						width : '400px',
						height : '350px',
						opacity : 0.4,
						button : [ {
							name : '确定',
							callback : callbackDepartmentSelect,
							focus : true
						}, {
							name : '取消',
							callback : function() {
							}
						} ]
					}).zindex();
				}
				function callbackDepartmentSelect() {
					var iframe = this.iframe.contentWindow;
					var treeObj = iframe.$.fn.zTree.getZTreeObj("departSelect");
					var nodes = treeObj.getCheckedNodes(true);
					if (nodes.length > 0) {
						var ids = '', names = '';
						for (i = 0; i < nodes.length; i++) {
							var node = nodes[i];
							ids += node.id + ',';
							names += node.name + ',';
						}
						$('#departname').val(names);
						$('#departname').blur();
						$('#orgIds').val(ids);
					}
				}
			</script>
		</div>
	</div>
	<script type="text/javascript">
		function deleteDialog(id) {
			var url = "userController.do?deleteDialog&id=" + id
			createwindow("删除模式", url, 200, 100);
		}
		function lockObj(title, url, id) {

			gridname = id;
			var rowsData = $('#' + id).datagrid('getSelections');
			if (!rowsData || rowsData.length == 0) {
				tip('请选择编辑项目');
				return;
			}
			url += '&id=' + rowsData[0].id;

			$.dialog.confirm('确定锁定用户吗', function() {
				lockuploadify(url, '&id');
			}, function() {
			});
		}
		function unlockObj(title, url, id) {

			gridname = id;
			var rowsData = $('#' + id).datagrid('getSelections');
			if (!rowsData || rowsData.length == 0) {
				tip('请选择编辑项目');
				return;
			}
			url += '&id=' + rowsData[0].id;

			$.dialog.confirm('确定激活用户吗', function() {
				lockuploadify(url, '&id');
			}, function() {
			});
		}

		function lockuploadify(url, id) {
			$.ajax({
				async : false,
				cache : false,
				type : 'POST',
				url : url,// 请求的action路径
				error : function() {// 请求失败处理函数

				},
				success : function(data) {
					var d = $.parseJSON(data);
					if (d.success) {
						var msg = d.msg;
						tip(msg);
						reloadTable();
					}

				}
			});
		}
	</script>


	<script type="text/javascript">
		//    var windowapi = frameElement.api, W = windowapi.opener;
		function choose_297e201048183a730148183ad85c0001() {
			if (typeof (windowapi) == 'undefined') {
				$
						.dialog({
							content : 'url:departController.do?departSelect',
							zIndex : 2100,
							title : '组织机构列表',
							lock : true,
							width : 400,
							height : 350,
							opacity : 0.4,
							button : [
									{
										name : '确定',
										callback : clickcallback_297e201048183a730148183ad85c0001,
										focus : true
									}, {
										name : '取消',
										callback : function() {
										}
									} ]
						});
			} else {
				$
						.dialog({
							content : 'url:departController.do?departSelect',
							zIndex : 2100,
							title : '组织机构列表',
							lock : true,
							parent : windowapi,
							width : 400,
							height : 350,
							left : '85%',
							top : '65%',
							opacity : 0.4,
							button : [
									{
										name : '确定',
										callback : clickcallback_297e201048183a730148183ad85c0001,
										focus : true
									}, {
										name : '取消',
										callback : function() {
										}
									} ]
						});
			}
		}
		function clearAll_297e201048183a730148183ad85c0001() {
			if ($('#departname').length >= 1) {
				$('#departname').val('');
				$('#departname').blur();
			}
			if ($("input[name='departname']").length >= 1) {
				$("input[name='departname']").val('');
				$("input[name='departname']").blur();
			}
			$('#orgIds').val("");
		}
		function clickcallback_297e201048183a730148183ad85c0001() {
			iframe = this.iframe.contentWindow;
			var departname = iframe.getdepartListSelections('text');
			if ($('#departname').length >= 1) {
				$('#departname').val(departname);
				$('#departname').blur();
			}
			if ($("input[name='departname']").length >= 1) {
				$("input[name='departname']").val(departname);
				$("input[name='departname']").blur();
			}
			var id = iframe.getdepartListSelections('id');
			if (id !== undefined && id != "") {
				$('#orgIds').val(id);
				$("input[name='orgIds']").val(id);
			}
		}

		//导入
		function ImportXls() {
			openuploadwin('Excel导入', 'userController.do?upload', "userList");
		}

		//导出
		function ExportXls() {
			JeecgExcelExport("userController.do?exportXls", "userList");
		}

		//模板下载
		function ExportXlsByT() {
			JeecgExcelExport("userController.do?exportXlsByT", "userList");
		}
	</script>