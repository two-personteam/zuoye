<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html class="no-js fixed-layout">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>华夏书城后台首页</title>
  <meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
	<%-- 基础环境 --%>
	<script type="text/javascript" src="<%=path%>/assets/libs/jquery-1.10.1.min.js"></script>
	<%-- 妹子UI --%>
	<script src="<%=path%>/assets/amazeui/js/amazeui.min.js"></script>
  	<link rel="stylesheet" href="<%=path %>/assets/amazeui/css/amazeui.min.css"/>
  	<link rel="stylesheet" href="<%=path %>/assets/amazeui/css/admin.css">
	<script type="text/javascript">
	$.fn.amtabs = $.fn.tabs;
	</script>
	<%-- EasyUI --%>
	<link rel="stylesheet" type="text/css" href="<%=path%>/assets/jquery-easyui-1.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/assets/jquery-easyui-1.5/themes/icon.css">
	<script type="text/javascript" src="<%=path%>/assets/jquery-easyui-1.5/jquery.easyui.min.js"></script>
	<%-- Layer --%>
	<link rel="stylesheet" type="text/css" href="<%=path%>/assets/layer/skin/layer.css">
	<script type="text/javascript" src="<%=path%>/assets/layer/layer.js"></script>
	<%-- Others --%>
	<script type="text/javascript" src="<%=path%>/assets/cityloader/jquery.cityloader.static.cn.min.js"></script>
	
<style type="text/css">
.am-tabs-nav .am-icon-close {
    position: absolute;
    top: 5px;
    right: 10px;
    color: #888;
    cursor: pointer;
    z-index: 100;
  }
  .am-tabs-nav .am-icon-close ~ a {
    padding-right: 25px!important;
  }
</style>

</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

<header class="am-topbar am-topbar-inverse admin-header">
  <div class="am-topbar-brand">
    <strong>华夏商城</strong> <small>后台管理系统</small>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li><a href="<%=path%>/index.html">前台首页 </a></li>
      <li><a href="javascript:;"><span class="am-icon-envelope-o"></span> 收件箱 <span class="am-badge am-badge-warning">5</span></a></li>
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span> 管理员 <span class="am-icon-caret-down"></span>
        </a>
        <ul class="am-dropdown-content">
          <li><a href="#"><span class="am-icon-user"></span> 资料</a></li>
          <li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
          <li><a href="#"><span class="am-icon-power-off"></span> 退出</a></li>
        </ul>
      </li>
      <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <div class="admin-sidebar am-offcanvas" id="admin-offcanvas" 
   style="width: 200px;">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list">
        <li><a href="<%=path%>/manager/index.html"><span class="am-icon-home"></span> 首页</a></li>
        <li><a href="javascript:newTab('用户管理','<%=path%>/manager/part/index-usermanger.html');"><span class="am-icon-table"></span> 用户管理</a></li>
        <li><a href="javascript:newTab('类别管理','<%=path%>/manager/part/index-categorymanger.html');"><span class="am-icon-table"></span> 类别管理</a></li>
        <li><a href="javascript:newTab('商品管理','<%=path%>/manager/part/index-productmanger.html');"><span class="am-icon-pencil-square-o"></span> 商品管理</a></li>
        <li><a href="javascript:void(0);"><span class="am-icon-pencil-square-o"></span> 订单管理</a></li>
        <li><a href="#"><span class="am-icon-sign-out"></span> 注销</a></li>
      </ul>

      <div class="am-panel am-panel-default admin-sidebar-panel">
        <div class="am-panel-bd">
          <p><span class="am-icon-bookmark"></span> 公告</p>
          <p>时光静好，与君语；细水流年，与君同。</p>
        </div>
      </div>

      <div class="am-panel am-panel-default admin-sidebar-panel">
        <div class="am-panel-bd">
          <p><span class="am-icon-tag"></span> wiki</p>
          <p>Welcome to the Amaze UI wiki!</p>
        </div>
      </div>
    </div>
  </div>
  <!-- sidebar end -->
  
  <%--  --%>

<!-- content start -->
<div class="admin-content" style="overflow-y:hidden;">
	
<div class="am-tabs" id="MyTabs">
  <ul class="am-tabs-nav am-nav am-nav-tabs">
    <li class="am-active"><a href="javascript: void(0)">主页</a></li>
  </ul>

  <div class="am-tabs-bd am-tabs-bd-ofv" style="overflow-y:hidden;">
    <div class="am-tab-panel am-active" style="overflow-y:scroll;">
<jsp:include page="/WEB-INF/content/manager/part/default.jsp"></jsp:include>
    </div>
    
  </div>
</div>
	
</div>
<!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>




<script>

function newTab(title,src){
	var mts = $("#MyTabs");
	var se = mts.find("li [tit='"+title+"']");
	if(se.length>0){
		mts.amtabs('open',se);
		return;
	}

	var obj1=$('<li><span class="am-icon-close"></span><a href="javascript: void(0)">标题</a></li>');
	var obj2=$('<div class="am-tab-panel" style="width:100%;padding:0;overflow-y:scroll;"></div>');
	var $nav = mts.find(".am-tabs-nav").append(obj1);
	var $bd = mts.find(".am-tabs-bd").append(obj2);
	obj1.find("a").text(title).attr("tit",title);
	
	mts.amtabs('refresh');
	mts.amtabs('open',obj1);
	
	obj1.find("span").click(function(){
		var $item = $(this).parent();
		var index = $nav.children('li').index($item);
		if($item.hasClass('am-active')){
			mts.amtabs('open',0);
		}
		$item.remove();
		$bd.find(".am-tab-panel").eq(index).find("*").off();
		$bd.find(".am-tab-panel").eq(index).remove();
	});
	
	$(window).resize();
	
	$.get(src,{},function(data){
		obj2.html(data);
	});
}

$(window).resize(function(){
	var content = $(".admin-content");
	var tab = $("#MyTabs");
	var nav = tab.find("ul");
	var bd = tab.find(".am-tabs-bd");
	var ht = content.height() - nav.height();
	bd.height(ht);
	bd.find(".am-tab-panel").height(ht).css("overflow","scroll");;
});
$(window).resize();

  $(function() {

	  
	  
  });
  
  
  
</script>

</body>
</html>
