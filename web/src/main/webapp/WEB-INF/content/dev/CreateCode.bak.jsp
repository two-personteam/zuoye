<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>代码生成器</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=path%>/assets/amazeui/css/amazeui.min.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/assets/layer/skin/layer.css">
	<script type="text/javascript" src="<%=path%>/assets/libs/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="<%=path%>/assets/amazeui/js/amazeui.min.js"></script>
	<script type="text/javascript" src="<%=path%>/assets/layer/layer.js"></script>

<style type="text/css">
.container{
  	width:700px;margin-left:auto;margin-right:auto;
}
.am-input-group{
	width:100%;
}
.am-input-group > .am-input-group-label{
	width: 150px;
}
.am-input-group{
 margin-bottom: 5px;
}
</style>
  </head>
  
  <body>

<%-- 导航条-Begin --%>
<header class="am-topbar">
  <h1 class="am-topbar-brand">
    <a href="#">Amaze UI</a>
  </h1>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#doc-topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="doc-topbar-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav">
      <li class="am-active"><a href="#">首页</a></li>
      <li><a href="#">项目</a></li>
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          下拉 <span class="am-icon-caret-down"></span>
        </a>
        <ul class="am-dropdown-content">
          <li class="am-dropdown-header">标题</li>
          <li><a href="#">1. 去月球</a></li>
          <li class="am-active"><a href="#">2. 去火星</a></li>
          <li><a href="#">3. 还是回地球</a></li>
          <li class="am-disabled"><a href="#">4. 下地狱</a></li>
          <li class="am-divider"></li>
          <li><a href="#">5. 桥头一回首</a></li>
        </ul>
      </li>
    </ul>

    <form class="am-topbar-form am-topbar-left am-form-inline" role="search">
      <div class="am-form-group">
        <input type="text" class="am-form-field am-input-sm" placeholder="搜索">
      </div>
    </form>

    <div class="am-topbar-right">
      <div class="am-dropdown" data-am-dropdown="{boundary: '.am-topbar'}">
        <button class="am-btn am-btn-secondary am-topbar-btn am-btn-sm am-dropdown-toggle" data-am-dropdown-toggle>其他 <span class="am-icon-caret-down"></span></button>
        <ul class="am-dropdown-content">
          <li><a href="#">注册</a></li>
          <li><a href="#">随便看看</a></li>
        </ul>
      </div>
    </div>

    <div class="am-topbar-right">
      <button class="am-btn am-btn-primary am-topbar-btn am-btn-sm">登录</button>
    </div>
  </div>
</header>
<%-- 导航条-End --%>

<div class="container">

<form id="ccf" data-am-validator class="am-form" 
	action="<%=path %>/code/create.do" method="post">
	
	<div class="am-input-group">
	  <span class="am-input-group-label">
	  	<i class="am-icon-user am-icon-fw"></i> 
	  	类名称 
	  </span>
	  <input name="EntityName" class="am-form-field" 
	  placeholder="类名首字母必须大写，第二个字母必须小写"
	  required pattern="^[A-Z]{1,1}[a-z0-9]{1,1}[A-Za-z0-9]{1,}$">
	</div>
	
	<div class="am-input-group">
	  <span class="am-input-group-label">
	  	<i class="am-icon-user am-icon-fw"></i> 
	  	表前缀
	  </span>
	  <input name="TablePrefix" value="TB_" type="text" class="am-form-field" placeholder="数据库中表的前缀">
	</div>
	
	<div class="am-input-group">
		<span class="am-input-group-label">
			<i class="am-icon-user am-icon-fw"></i> 
			二级缓存
		</span>
	  	<select id="doc-select-1" name="SecondCache">
		  <option value="NONE">关闭</option>
		  <option value="NONSTRICT_READ_WRITE">不严格读写</option>
		  <option value="READ_ONLY">只读</option>
		  <option selected="selected" value="READ_WRITE">读写</option>
		  <option value="TRANSACTIONAL">事务</option>
		</select>
	</div>
	
	<hr>
<table id="ft" class="am-table am-table-bordered">
    <thead>
        <tr>
            <th>数据类型</th>
            <th>属性名称</th>
            <th>备注</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody>
        <tr>
			<td>
<select id="doc-select-1" name="fields">
  <option value="String">String</option>
  <option value="int">int</option>
  <option value="Date">Date</option>
  <option value="double">double</option>
</select>
			</td>
            <td><input name="fields" value="name" type="text" class="am-form-field am-radius" placeholder="请输入属性..." /></td>
            <td><input name="fields" value="名称" class="am-form-field am-radius" placeholder="请输入备注..." /></td>
            <td>
				<button type="button" class="am-btn am-btn-danger btn-del">删除</button>
			</td>
        </tr>
        
        
    </tbody>
</table>
<button id="bt1" type="button" class="am-btn am-btn-primary">添加属性</button>
<button id="bt2" type="button" class="am-btn am-btn-success">生成代码</button>

</form>
</div>

<script type="text/javascript">


$(function(){
	
	var ft = $("#ft");
	var tbody = ft.find("tbody");
	var tr = tbody.find("tr:eq(0)");	//第一个tr作为模板
	$("#bt1").click(function(){
		var el = tr.clone();	//克隆一行
		el.appendTo(tbody);
		el.find("input:eq(0)").val("");
		el.find("input:eq(1)").val("");
		el.find(".btn-del").click(function(){
			$(this).parent().parent().remove();
		});
	});
	
	$("#bt2").click(function(){
		layer.confirm('确定生成吗？确定后将下载代码！', {
			  btn: ['我意已决','朕再想想'] //按钮
			}, function(){
				$("#ccf").submit();
			}, function(){}
		);
	});
	
	
	
	
});

</script>

  </body>
</html>
