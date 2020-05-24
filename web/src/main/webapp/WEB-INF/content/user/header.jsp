<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<header class="am-topbar">
  <h1 class="am-topbar-brand">
    <a href="<%=path%>/index.html"> 华夏书城 </a>
  </h1>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#doc-topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="doc-topbar-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav">
      <li><a href="<%=path%>/index.html">首页</a></li>
      <li><a href="<%=path%>/user/shopping/ShopCart.jsp">购物车</a></li>
      <li><a href="<%=path%>/user/order/view.jsp">我的订单</a></li>
     
    </ul>

    <div class="am-topbar-right">
      <div class="am-dropdown" data-am-dropdown="{boundary: '.am-topbar'}">
        <button class="am-btn am-btn-secondary am-topbar-btn am-btn-sm am-dropdown-toggle" data-am-dropdown-toggle>
        	wukong <span class="am-icon-caret-down"></span>
        </button>
        <ul class="am-dropdown-content">
          <li><a href="#">个人中心</a></li>
          
          <li><a href="<%=path%>/manager/index.html">进入后台（管理员）</a></li>
          
          <li class="am-divider"></li>
          <li><a href="<%=path%>/login!exit.html">退出登录</a></li>
        </ul>
      </div>
    </div>

    <div class="am-topbar-right">
    
    </div>
  </div>
</header>