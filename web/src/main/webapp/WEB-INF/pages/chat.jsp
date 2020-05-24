<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="cc" uri="/jeelite-tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title>聊天测试</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<cc:base type="jquery,layui,sweetalert"></cc:base>
<script src="http://cdn.bootcss.com/web-socket-js/1.0.0/web_socket.min.js"></script>

	<script type="text/javascript" src="${path}/assets/im.client.js"></script>
<style type="text/css">
html,body{
	height: 100%;
}

.layim-chat-text{
	width:200px;
}

</style>
  </head>
  
  <body>
<a href="${path}/assets/layui.layim-v3.0.1/demo/index.html">demo-pc</a>
<a href="${path}/assets/layui.layim-v3.0.1/demo/mobile.html">demo-mobile</a>
<hr>
<div class="site-demo-button">
  <button class="layui-btn site-demo-layim" data-type="chat">自定义会话</button>
  <button class="layui-btn site-demo-layim" data-type="message">接受好友的消息</button>
  <button class="layui-btn site-demo-layim" data-type="messageAudio">接受音频消息</button>
  <button class="layui-btn site-demo-layim" data-type="messageVideo">接受视频消息</button>
  <button class="layui-btn site-demo-layim" data-type="messageTemp">接受临时会话消息</button>
  
  <br>
  
  <button class="layui-btn site-demo-layim" data-type="add">申请好友</button>
  <button class="layui-btn site-demo-layim" data-type="addqun">申请加群</button>
  <button class="layui-btn site-demo-layim" data-type="addFriend">同意好友</button>
  <button class="layui-btn site-demo-layim" data-type="addGroup">增加群组到主面板</button>
  <button class="layui-btn site-demo-layim" data-type="removeFriend">删除主面板好友</button>
  <button class="layui-btn site-demo-layim" data-type="removeGroup">删除主面板群组</button>
  
  <br>
  <button class="layui-btn site-demo-layim" data-type="setGray">置灰离线好友</button>
  <button class="layui-btn site-demo-layim" data-type="unGray">取消好友置灰</button>
  <a href="http://layim.layui.com/kefu.html" class="layui-btn site-demo-layim" target="_blank">客服模式</a>
  <button class="layui-btn site-demo-layim" data-type="mobile">移动端版本</button>
  <br>
  <button onclick="chat.login('123',function(data){console.log(data);});" >登录</button>
</div>               
          
<shiro:principal></shiro:principal>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>

var token = '${im_token}';

//检查浏览器是否支持WebSocket
if(window.WebSocket){
	console.log('This browser supports WebSocket');
}else{
	console.log('This browser does not supports WebSocket');
}
(function(window){
	
	
	
	layui.use(['layim','layer'], function(){
		var layim = layui.layim;
		var layer = layui.layer;
		layim.audio={
				online:new Audio("${path}/assets/layui/1.0.9/css/modules/layim/voice/online.mp3"),
				notice:new Audio("${path}/assets/layui/1.0.9/css/modules/layim/voice/default.mp3")
		}
		
		var socket ;
		//var token = '${sessionScope.im_person.id}' ; //PersonId
		function init(){
			console.log("正在连接WebSocket服务器...");
			socket = new WebSocket("ws://localhost:8376/");
			socket.onopen = function(evt) { 
			    console.log("成功建立WebSocket连接..");
			    if(token){
			    	socket.send(JSON.stringify({
						"order":"login",
						"token":token
					}));
			    }
			};
			socket.onclose = function(evt) {
				console.log("WebSocket已经断线，6秒后重新连接...");
				socket = null;
			};
			socket.onmessage = function(res) {
				console.log(res);
				//var obj = eval(   '('+res+')'   );
				console.log(res.data);
				res = JSON.parse(res.data);
				if(res.emit === 'ChatMessage'){
					layim.getMessage(res);
				}
				if(res.emit === 'FriendOffline'){
					layim.setFriendStatus(res.id, 'offline');
				}
				if(res.emit === 'FriendOnline'){
					layim.setFriendStatus(res.id, 'online');
					layim.audio.online.play();
				}

			};
		};
		init();
		window.setInterval(function(){
			if(socket)return;init();
		}, 6000);
		  
		function load(){
			//基础配置
			layim.config({
			    //初始化接口
			    init: {url: '${path}/im/init',type:'post',data: {"token":token}},
			    //查看群员接口
			    members: {
					url: '${path}/im/members'
					,data: {}
			    }
			    
			    ,uploadImage: {
			      url: '${path}/im/chat!uploadImage.html' //（返回的数据格式见下文）
			      ,type: '' //默认post
			    }
			    ,uploadFile: {
			      url: '' //（返回的数据格式见下文）
			      ,type: '' //默认post
			    }
			    
			    ,isAudio: true //开启聊天工具栏音频
			    ,isVideo: true //开启聊天工具栏视频
			    
			    //扩展工具栏
			    ,tool: [{
			      alias: 'code'
			      ,title: '代码'
			      ,icon: '&#xe64e;'
			    }]
			    
			    //,brief: true //是否简约模式（若开启则不显示主面板）
			    
			    //,title: 'WebIM' //自定义主面板最小化时的标题
			    //,right: '100px' //主面板相对浏览器右侧距离
			    //,minRight: '90px' //聊天面板最小化时相对浏览器右侧距离
			    ,initSkin: '3.jpg' //1-5 设置初始背景
			    //,skin: ['aaa.jpg'] //新增皮肤
			    //,isfriend: false //是否开启好友
			    //,isgroup: false //是否开启群组
			    //,min: true //是否始终最小化主面板，默认false
			    //,notice: true //是否开启桌面消息提醒，默认false
			    //,voice: false //声音提醒，默认开启，声音文件为：default.mp3
			    
			    ,msgbox: '/layim/demo/msgbox.html' //消息盒子页面地址，若不开启，剔除该项即可
			    ,find: '/layim/demo/find.html' //发现页面地址，若不开启，剔除该项即可
			    ,chatLog: '/layim/demo/chatLog.html' //聊天记录页面地址，若不开启，剔除该项即可
			    
			});
			
			
			
			
		}
		  
		layim.on('ready', function(options){
			console.log(options);
			
			/* socket.send(JSON.stringify({
				"order":"FriendsStatus",
				"token":token
			}));
			socket.send(JSON.stringify({
				"order":"GetOfflineMessage",
				"token":token
			})); */
		});
		//切换在线或隐身状态
		layim.on('online', function(status){//获得online或者hide
			/* socket.send(JSON.stringify({
				"order":"OnlineStatusChange",
				"token":token,
				"status":status
			})); */
			$.post('${path}/im/status',{'text':status},function(data){
				layer.msg('消息：'+data);
			});
		});
		//修改签名事件
		layim.on('sign', function(value){
			/* socket.send(JSON.stringify({
				"order":"SignChange",
				"token":token,
				"text":value
			})); */
			$.post('${path}/im/sign',{'text':value},function(data){
				layer.msg('消息：'+data);
			});
		});
		layim.on('sendMessage', function(res){
			var mine = res.mine; //包含我发送的消息及我的信息
			console.log(res);
			socket.send(JSON.stringify({
				"order":"send",
				"type":res.to.type,
				"from":res.mine.id,
				"to":res.to.id,
				"text":res.mine.content
			}));
		});
		//每次窗口打开或切换，即更新对方的状态
		layim.on('chatChange', function(res){
		  var type = res.data.type;
		  console.log(res);
		  if(type === 'friend'){
		    layim.setChatStatus('<span style="color:#FF5722;">在线1</span>'); //模拟标注好友在线状态
		  } else if(type === 'group'){
		    //模拟系统消息
			/*   layim.getMessage({
			      system: true //系统消息
			      ,id: res.data.id
			      ,type: "group"
			      ,content: '贤心加入群聊'
			    }); */
		  }
		});
		layim.on('setSkin', function(filename, src){
			console.log(filename); //获得文件名，如：1.jpg
			console.log(src); //获得背景路径，如：http://res.layui.com/layui/src/css/modules/layim/skin/1.jpg
		});
		
		load();
		/* swal({   
			title: "请您登录",
			  text: "请输入您的用户ID:",   
			  type: "input",   
			  showCancelButton: true,   
			  closeOnConfirm: false,
			  animation: "slide-from-top",   
			  inputPlaceholder: "请输入您的用户ID",
			  confirmButtonText: "安全登录",   
			  cancelButtonText: "取消",   
			}, function(inputValue){   
				if (inputValue === false) 
					return false;      
				if (inputValue === "") {     
					swal.showInputError("您必须填写用户ID才可以登录!");     
					return false   
				}
				token = inputValue;
				//swal("Nice!", "You wrote: " + inputValue, "success"); 
				load();
			});
		   */
	});
	
	
	
	
})(window);

$(function(){
	$('#layui-layim img').each(function(a,b,c){
		console.log(a);
		console.log(b);
		console.log(c);
	});
});

</script>

   
  </body>
</html>
