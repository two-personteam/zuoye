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
	
	<%-- jQuery图像裁剪插件 --%>
	<script type="text/javascript" src="${res }/cropper/cropper.min.js"></script>
	<link rel="stylesheet" href="${res }/cropper/cropper.min.css">
	
	<!-- layer -->
    <link href="${res}/layer/skin/layer.css" rel="stylesheet">
    <script src="${res}/layer/layer.js" type="text/javascript"></script>
    
    <link href="${res}/sweetalert/sweetalert.css" rel="stylesheet">
    <script src="${res}/sweetalert/sweetalert.min.js"></script>
	
	<script type="text/javascript" src="${res}/canvas-to-blob.js"></script>
	
<style>
.img-circle{
	border: 5px solid #000;
	border-radius:50%;
	width:150px;
	height: 150px;
}
.img-rounded{
	border: 5px solid #000;
	border-radius:10px;
	width:150px;
	height: 150px;
}
.img-preview {
  margin-right: 10px;
  margin-bottom: 10px;
  overflow: hidden;
}

.img-preview > img {
  max-width: 100%;
}

.preview-lg {
  width: 263px;
  height: 148px;
}

.preview-md {
	width: 139px;
	height: 78px;
}

.preview-sm {
  width: 69px;
  height: 39px;
}

</style>

  </head>
  
  <body>
   
<script type="text/javascript">
$(function(){
	
	var $image = $('#txi');
	var $inputImage = $("input:file");
	var info = $(".docs-data");
	$image.cropper({
		  aspectRatio: 1 / 1,
		  preview:'.img-preview',
		  crop: function(e) {
		    info.find("input:eq(0)").val(e.x);
		    info.find("input:eq(1)").val(e.y);
		    info.find("input:eq(2)").val(e.width);
		    info.find("input:eq(3)").val(e.height);
		  }
		});
	
	
	$inputImage.change(function () {
	      var files = this.files;
	      var file;

	      if (!$image.data('cropper')) {
	        return;
	      }

	      if (files && files.length) {
	        file = files[0];

	        if (/^image\/\w+$/.test(file.type)) {
	          blobURL = URL.createObjectURL(file);
	          $image.one('built.cropper', function () {

	            // Revoke when load complete
	            URL.revokeObjectURL(blobURL);
	          }).cropper('reset').cropper('replace', blobURL);
	          $inputImage.val('');
	        } else {
	          window.alert('请选择一张图片.');
	        }
	      }
	    });
	
	$("#bt-sc").click(function(){
		var canvas = $image.cropper('getCroppedCanvas');
		if (canvas.toBlob) {
		    canvas.toBlob(
		        function (blob) {
		            var formData = new FormData();
		            formData.append('file', blob, "icon.png");
		            var ly = layer.msg('正在提交到服务器', {icon: 16,shade: 0.3,time:0});
		            $.ajax('<%=path%>/user!ajaxIcon.html', {
				    method: "POST",
				    data: formData,
				    processData: false,
				    contentType: false,
				    success: function (data) {
				    	layer.close(ly);
				    	if(data=='success'){
				    		//layer.msg('头像更新成功');
				    		//swal("头像更新成功！", "", "success");
				    		swal({
								title: "头像更新成功！",
								type:'success'
								},function(){
									parent.window.layer.close(parent.window.layer_user_icon_update);
								});
				    		$(parent.window.document).find('.utx').attr('src',canvas.toDataURL('image/jpeg'));
				    	}
				    },
			    error: function () {
			      console.log('Upload error');
			    }
		});
		        },
		        'image/jpeg'
		    );
		}
        
	});
});
</script>

<div class="img-container" style="height: 300px;width: 400px;float: left;margin-right: 10px;">
    <img id="txi" src="<%=path %>/upload/touxiang/default.jpg" alt="Picture" class="cropper-hidden" >
</div>
<div class="" style="height: 150px;margin-left: 10px;">
	<div class="img-preview preview-lg"></div>
	<div class="img-preview preview-md"></div>
	<div class="img-preview preview-sm"></div>
</div>

<hr style="clear: both;">

      <input type="file" name="file" accept="image/*" >
      <button type="button" class="btn btn-primary" id="bt-sc">确认上传</button>

  </body>
</html>
