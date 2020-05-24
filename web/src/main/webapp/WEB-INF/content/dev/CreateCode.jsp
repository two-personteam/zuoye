<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>新代码生成器</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script src="http://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	
	<link href="http://cdn.bootcss.com/amazeui/2.7.2/css/amazeui.min.css" rel="stylesheet">
	<script src="http://cdn.bootcss.com/amazeui/2.7.2/js/amazeui.min.js"></script>
	
	<link href="http://cdn.bootcss.com/layer/3.0.1/skin/default/layer.css" rel="stylesheet">
	<script src="http://cdn.bootcss.com/layer/3.0.1/layer.min.js"></script>
	
	<script src="http://cdn.bootcss.com/jquery-storage-api/1.9.4/jquery.storageapi.min.js"></script>

<style type="text/css">
.container{
  	width:900px;margin-left:auto;margin-right:auto;
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
    <a href="#">代码生成器</a>
  </h1>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#doc-topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="doc-topbar-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav">
      <li class="am-active"><a href="#">首页</a></li>
    </ul>

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
	  <input tx name="EntityName" class="am-form-field" 
	  placeholder="类名首字母必须大写，第二个字母必须小写"
	  required pattern="^[A-Z]{1,1}[a-z0-9]{1,1}[A-Za-z0-9]{1,}$">
	</div>
	
	<div class="am-input-group">
	  <span class="am-input-group-label">
	  	<i class="am-icon-user am-icon-fw"></i> 
	  	表前缀
	  </span>
	  <input tx name="TablePrefix" value="TB_" type="text" class="am-form-field" placeholder="数据库中表的前缀">
	</div>
	
	<div class="am-input-group">
		<span class="am-input-group-label">
			<i class="am-icon-user am-icon-fw"></i> 
			二级缓存
		</span>
	  	<select tx id="doc-select-1" name="SecondCache">
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
            <th style="width:120px;">映射方式</th>
            <th style="width:170px;">数据类型</th>
            <th>属性名称</th>
            <th>备注</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody>
    	<%-- tr隐藏，只是作为一个模板 --%>
        <tr style="display:none;">
			<td>
<select tx id="doc-select-1" name="fields">
  <option value="Column">基本类型</option>
  <option value="ManyToOne">多对一</option>
  <option value="OneToMany">一对多List</option>
  <option value="OneToOne">一对一(无效)</option>
  <option value="ManyToMany">多对多(无效)</option>
</select>
			</td>
            <td>
<select tx id="doc-select-1" name="fields" style="width:150px;">
  <option value="String">String</option>
  <option value="int">int</option>
  <option value="Date">Date</option>
  <option value="double">double</option>
</select>
<input tx name="fields" value="Object" type="text" class="am-form-field am-radius" placeholder="数据类型" style="width:150px;display: none;" />
			</td>
            <td><input tx name="fields" value="name" type="text" class="am-form-field am-radius" placeholder="属性名称" required /></td>
            <td><input tx name="fields" value="名称" class="am-form-field am-radius" placeholder="请输入备注..." /></td>
            <td>
				<button type="button" class="am-btn am-btn-danger btn-del">删除</button>
			</td>
        </tr>
        
        
    </tbody>
</table>
<button id="bt1" type="button" class="am-btn am-btn-primary">添加属性</button>
<button id="bt2" type="button" class="am-btn am-btn-success">生成代码</button>
<button id="bt3" type="button" class="am-btn am-btn-success" style="display: none;">下载代码</button>

</form>
</div>

<script type="text/javascript">
function openwin(url) {
    var a = document.createElement("a");
    a.setAttribute("href", url);
    a.setAttribute("target", "_blank");
    a.setAttribute("id", "camnpr");
    document.body.appendChild(a);
    a.click();
}
$(function(){
	
	var storage=$.localStorage;

	
	function newline(dept,type,field,note){
		var tbody = $("#ft tbody");
		var tr = tbody.find("tr:eq(0)");	//第一个tr作为模板
		var el = tr.clone();	//克隆一行
		el.appendTo(tbody).show();
		el.find("td:eq(2) > input:eq(0)").val(field); //属性名称
		el.find("td:eq(3) > input:eq(0)").val(note); //备注
		el.find(".btn-del").click(function(){
			$(this).parent().parent().remove();
		});
		el.find("td:eq(0) > select").change(function(){
			if($(this).val()=="Column"){
				el.find("td:eq(1) > select").show().val(type);
				el.find("td:eq(1) > input").hide();
			}else{
				el.find("td:eq(1) > select").hide();
				el.find("td:eq(1) > input").show().val(type);
			}
		}).val(dept).change();
	}
	newline("Column","String","name","名称");
	//newline("OneToMany","User","host","主人");
	$("#bt1").click(function(){
		newline("Column","String","","");
	});
	var lay2 = null;	//是否确定生成代码
	var lay3 = null;	//确定生成后的加载层
	$("#bt2").click(function(){
		if( !$("#ccf").validator('isFormValid') ){ //表单验证是否通过
			return;
		}
		lay2=layer.confirm('确定生成吗？确定后将下载代码！', {
			  btn: ['我意已决','朕再想想'] //按钮
			}, function(){
				var param = "";
				$("[tx]:visible").each(function(){
					var e = $(this);
					var n = e.attr("name");
					param+="&"+n+"="+e.val();
				});
				$.post('<%=path %>/createcode.html',param,function(data){
					layer.close(lay3);
					if(data=="success"){
						$("#bt3").show();
					}else{
						layer.msg('生成失败，程序异常。');
					}
				});
				layer.close(lay2);
				//loading层
				lay3 = layer.load(2, {
				  shade: [0.5,'#333'] //0.1透明度的白色背景
				});
			}, function(){}
		);
	});
	
	$("#bt3").click(function(){
		openwin('<%=path%>/downloadcode.html');
	});
	
	//页面表单数据自动存储，加载页面时自动还原
	{
		if(!storage.isEmpty('createcode.formdata')){
			var fd=storage.get('createcode.formdata');
			var txs = $("[tx]:visible");
			for(var i=0;i<fd.length;i++){
				if(i<txs.length){
					txs.eq(i).val(fd[i]);
				}else{
					newline(fd[i],fd[i+1],fd[i+2],fd[i+3]);
					i+=3;
				}
				
			}
		}
		function beifen(){
			var formdata = [];
			$("[tx]:visible").each(function(){
				formdata.push(this.value);
			});
			storage.set('createcode.formdata',formdata);
		}
		window.setInterval(beifen,500);
	}
});

</script>

  </body>
</html>
