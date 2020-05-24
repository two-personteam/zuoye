<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="cc" uri="/jeelite-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>阿里云对象存储OSS上传演示</title>
<cc:base type="jquery"></cc:base>
<script src="http://gosspublic.alicdn.com/aliyun-oss-sdk-4.4.4.min.js"></script>

</head>
<body>

<hr>
<button type="button" id="btn1" >刷新列表</button>
<ul id="filelist"></ul>

<hr>
上传到目录：<input id="dir" value="/"><br>
文件名称：<input id="name" value="default-file-name" style="width:300px;"><br>
<input type="file" id="file" >
<button type="button" id="btn2" >上传文件</button>

	<script type="text/javascript">
	var client = null;
	OSS.urllib.request("${basePath}/oss!sts.html", {
		method : 'GET'
	}, function(err, response) {
		if (err) {
			return alert(err);
		}
		try {
			result = JSON.parse(response);
		} catch (e) {
			errmsg = 'parse sts response info error: ' + e.message;
			return alert(errmsg);
		}
		console.log(result);
		
		client = new OSS.Wrapper({
            accessKeyId: result.AccessKeyId,
            accessKeySecret: result.AccessKeySecret,
            stsToken: result.SecurityToken,
            endpoint: 'oss-cn-beijing.aliyuncs.com',
            bucket: 'snxy'
        });
		
		$('#btn1').click();
        
	});
	
	
	$(function(){
		//刷新文件列表
		$('#btn1').click(function(){
			client.list({
		        'max-keys': 10
		    }).then(function (result) {
		        console.log(result);
		        $('#filelist > *').remove();
		        $.each(result.objects,function(){
		        	$('#filelist').append('<li>'+this.url+'<a href="javascript:void(0);" res="'+this.name+'">打开</a></li>');
		        });
		        $('#filelist a').click(function(){
		        	var w = window.open(); //异步无法打开窗口，所以先创建一个，等异步结果回来之后设置路径即可
	        		$.post('${path}/oss!acc.html','bucket=snxy&expires=60&key='+$(this).attr('res'),function(data){
	        			w.location.href=data;
	        		});
	        	});
		        
		    }).catch(function (err) {
		        console.log(err);
		    });
		});
		//上传文件
		$('#btn2').click(function(){
			var file = $('#file')[0].files[0];
			var filename = $('#dir').val()+$('#name').val();
			client.multipartUpload(filename, file).then(function (result) {
	            console.log(result);
	            $('#btn1').click();
	        }).catch(function (e) {
	            console.log(e);
	        });
		});
		$('#file').change(function(){
			var filename=this.value.replace(/^.+?\\([^\\]+?)(\.[^\.\\]*?)?$/gi,"$1");  //正则表达式获取文件名，不带后缀
			  var fileExt=this.value.replace(/.+\./,"");   //正则表达式获取后缀
			$('#name').val(filename+"."+fileExt);
		});
	});
	
	</script>

</body>
</html>