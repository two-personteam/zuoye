<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改头像</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<%-- 基础环境 --%>
	<script type="text/javascript" src="${res }/jquery-1.10.1.min.js"></script>
	
	<%-- Bootstrap --%>
	<link href="${res}/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="${res}/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- layer -->
    <link href="${res}/layer/skin/layer.css" rel="stylesheet">
    <script src="${res}/layer/layer.js" type="text/javascript"></script>
    
    <link href="${res}/sweetalert/sweetalert.css" rel="stylesheet">
    <script src="${res}/sweetalert/sweetalert.min.js"></script>
	
	<script type="text/javascript" src="${res}/canvas-to-blob.js"></script>
	
	<link href="http://cdn.bootcss.com/codemirror/5.24.2/codemirror.min.css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/codemirror/5.24.2/codemirror.min.js"></script>
    
    <%-- 
    
    <script src="http://cdn.bootcss.com/codemirror/5.24.2/addon/hint/javascript-hint.min.js"></script>
    <script src="http://cdn.bootcss.com/codemirror/5.24.2/addon/lint/javascript-lint.min.js"></script>
    
	--%>
	<!-- 代码高亮 -->
	<script src="http://cdn.bootcss.com/codemirror/5.24.2/mode/clike/clike.min.js"></script>
	
	<!--括号匹配-->
	<script src="http://cdn.bootcss.com/codemirror/5.24.2/addon/edit/matchbrackets.min.js"></script>
	
	<!-- 编辑器风格 -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/codemirror/5.24.2/theme/eclipse.css">
	<link rel="stylesheet" href="http://cdn.bootcss.com/codemirror/5.24.2/theme/seti.css">
	<link rel="stylesheet" href="http://cdn.bootcss.com/codemirror/5.24.2/theme/dracula.css">
	
	<!--全屏模式-->
	<link rel="stylesheet" href="http://cdn.bootcss.com/codemirror/5.24.2/addon/display/fullscreen.css">
	<script src="http://cdn.bootcss.com/codemirror/5.24.2/addon/display/fullscreen.js"></script>
	
	<link rel="stylesheet" href="http://cdn.bootcss.com/codemirror/5.24.2/addon/dialog/dialog.css">  
	<script src="http://cdn.bootcss.com/codemirror/5.24.2/keymap/vim.js"></script>  
	<script src="http://cdn.bootcss.com/codemirror/5.24.2/addon/search/searchcursor.js"></script>  
	<!--改善vim输入命令时的样式-->  
	<script src="http://cdn.bootcss.com/codemirror/5.24.2/addon/dialog/dialog.js"></script>
	
	<!-- 自动补全 -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/codemirror/5.24.2/addon/hint/show-hint.min.css">
	<script src="http://cdn.bootcss.com/codemirror/5.24.2/addon/hint/show-hint.min.js"></script>
	<script src="http://cdn.bootcss.com/codemirror/5.24.2/mode/javascript/javascript.min.js"></script>
	<script src="http://cdn.bootcss.com/codemirror/5.24.2/addon/hint/javascript-hint.min.js"></script>
	<script src="http://cdn.bootcss.com/codemirror/5.24.2/addon/hint/css-hint.min.js"></script>
	
  </head>
  
  <body>
  <h1>编辑器</h1>
  <textarea id="code"></textarea>
   
<script type="text/javascript">



var editor=CodeMirror.fromTextArea(document.getElementById("code"),{
	lineNumbers:true,
    mode:"javascript",
    theme:"eclipse",
    lineWrapping:true,
    fullScreen:true,
    matchBrackets:true,
    indentUnit:4,			//缩进
    smartIndent: true,	//自动缩进，设置是否根据上下文自动缩进（和上一行相同的缩进量）。默认为true。
    tabSize: 4,				//tab字符的宽度，默认为4
    //keyMap: "sublime",
    extraKeys:{
    	"Alt-Space":"autocomplete"
    }//ctrl-space唤起智能提示
});
//editor.setSize('auto','100px');
function keydown(keyCode){
	var e = jQuery.Event("keydown");//模拟一个键盘事件
	e.keyCode = keyCode;//keyCode=13是回车
	$(editor).tigger(e);//模拟按下回车
}
editor.append=function(text){
	editor.setValue(editor.getValue()+text);
}
editor.on('change', function(instance,obj) { 
	var ci = editor.getCursor();
	if(obj.text=='('){
		editor.replaceSelection(")");
		editor.setCursor(ci);
	}
	if(obj.text=='{'){
		editor.replaceSelection("}");
		editor.setCursor(ci);
	}
});
editor.on('beforeChange', function(instance,obj) { 
	console.log(obj);
	if(obj.text.length==2&&obj.text[0]==obj.text[1]){ //回车
		obj.text[0]='';
		obj.text[1]='\t';
		obj.text[2]='';
	}
});
editor.on('keypress', function() {  
	
});  


$(function(){
	
	
	
});

</script>


  </body>
</html>
