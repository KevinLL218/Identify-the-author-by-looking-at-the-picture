<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html><meta charset="UTF-8">
<script src="jquery-3.5.1.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>看图识作者</title>
</head>

<style type="text/css">
	#parent{width:550px; height:10px; border:2px solid #09F;}
	#son {
		width:0;
		height:100%;
		border-radius:10px;
		background-color:#e94829;
		text-align:center;
		line-height:20px;
		font-size:15px;
		color:white;
		font-weight:bold;
	} 

	#content_div{
		position:absolute;
		left:0px;
		top:0px;
		right:0px;
		bottom:0px;
		text-align:center
	}
  
	.upload_dialog_div{
		position:fixed;
		left:0px;
		right:0px;
		top:0px;
		bottom:0px;
		overflow:auto; 
		visibility:hidden;
		background-color: rgba(60,60,60,0.5);
		z-index:99;
	}
	.style_content_div{
		position:relative;
		margin:auto;
		margin-top:160px;
		width:400px;
		height:160px;
		background:#F5F5DC;
	}
	.style_content_upper_div{
		position:absolute;
		left:0px;
		top:0px;
		width:400px;
		height:100px;
		background:#F5F5DC;
	}
	.style_content_lower_div{
		position:absolute;
		left:0px;
		top:100px;
		width:400px;
		height:60px;
		background:#F5FFDC;
	}
  
	.style_content_file_div{
		position:absolute;
		left:15px;
		top:20px;
		width:380px;
		height:60px;
	}
	.style_file_span{
		float:left;
		width:120px;
		height:36px;
		font-size:24px;
		text-align:right;
	}
	.style_file_content{
		margin-top:5px;
	}
	.style_content_prog_div{
		position:absolute;
		left:18px;
		top:57px;
		width:360px;
		height:40px;
	}
	.style_prog_span_hit{
		color:#ff0000;
	}
	.style_prog_content{
		width:360px;
		visibility:hidden;
	}
	.style_content_span{
		width:200px;
		height:60px;
		line-height:60px;
		display:inline-block;
		float:left;
		font-size:32px;
		text-align:center;
		cursor: pointer;
	}
 
	.style_copyright_a{
		text-decoration:none;
		color:#cc00cc;
	}
	.pictures{
		width: 900px;
		height: 500px;
		border: 1px solid green;
		position:absolute;
		top:50%;
		left:50%;
		margin:-225px 0 0 -400px;
	}
	.img{
			border: 1px solid green;

		width:100%;
		height:100%;
	}
	.rightarea{
        float: left;
        width: 350px;
        height: 400px;
    }
    .leftarea{
        float: left;
        width: 450px;
        height: 400px;
    }
	.backgroundimg{
		background-color: antiquewhite;
	}
  
</style>

<script>
//js部分

function uploadFile(){
    var pic = $("#pic").get(0).files[0];
    var formData = new FormData();
	console.log("uploading");
	if(pic != null){
		formData.append("file" , pic);        
		$.ajax({
			type: "POST",
			url: "http://localhost:8080/reading/upload_renovate.action", //此处是与服务器连接的地址
			data: formData ,
			processData : false, //必须false才会自动加上正确的Content-Type
			dataType: 'json',
			contentType : false ,//必须false才会避开jQuery对 formdata 的默认处理 
			xhr: function(){
				var xhr = $.ajaxSettings.xhr();
				if(onprogress && xhr.upload) {
					xhr.upload.addEventListener("progress" , onprogress, false);
					return xhr;
				}
			},
			success: function(res) {
				console.log(res);
				$("#versionsize").val(res.filesize);
				$("#versionurl").val(res.url);
        }

    });
			alert("上传成功");
			hideUploadDialog();
	}
	document.getElementById("upload_tip_id").innerText="未选择文件";
	console.log("over");
	}   
function showUploadDialog(){
	var up_dialog=document.getElementById("upload_dialog");
	document.getElementById("upload_tip_id").innerText="请选择要上传的文件";
	up_dialog.style.visibility="visible";	
}
 function hideUploadDialog(){
	var up_dialog=document.getElementById("upload_dialog");
	up_dialog.style.visibility="hidden";
 }
 //鼠标悬停事件
$(document).ready(function(){
	$(".Mover").hide();
	$(".ellipsis").mouseover(function(e){
		$(this).next(".Mover").css({
			"position":"absolute",
			"left":e.clientX+1,
			"top":e.clientY+1
		}).show();
	});
	$(".ellipsis").mouseover(function(e){
		$(this).next(".Mover").css({
			"color":"#fff;",
			"position":"absolute;",
			"opacity":"0.9;",
			"width":"600px;",
			"cursor":"default;",
			"top":";",
			"left":"1;"
		});
	});
	$(".ellipsis").mouseout(function(){
		$(this).next(".Mover").hide();
	});

});


$(document).ready(function(){
	$(".us").hide();
	$(".contact").mouseover(function(){
		$(".us").show("slow");
		$(".contact").mouseout(function(){
			$(".us").hide();
		});
	});
});



</script>

<body>
  <div id="content_div" class="backgroundimg">
	  <br>
	  <br>
	  <div>
		<marquee scrollAmount=4 witdh=300>
			欢迎使用本软件,此处正在测试
		</marquee>
	  </div>
		 <br>
		 <div class="ellipsis">悬停
		 </div>
		 <div class="Mover">这是隐藏的内容，测试ing</div>
		 <br>
		 <br>

	  <div class="pictures" ><div style="margin-top:25px;">
		<table style="margin-left:50px">
			<tr>
				<th class="ellipsis">
					<div class="leftarea" class="ellipsis"><img class="img" src="img.jpg" /><div>
				</th>
				<th>
					<div class="rightarea" style="border: 1px solid green;overflow-y: scroll;" class="ellipsis">
						文森特·威廉·梵高，荷兰后印象派画家。代表作有《星月夜》、自画像系列、向日葵系列等。
				梵高出生于1853年3月30日荷兰乡村津德尔特的一个新教牧师家庭，早年的他做过职员和商行经纪人，还当过矿区的传教士最后他投身于绘画。他早期画风写实，受到荷兰传统绘画及法国写实主义画派的影响。1886年，他来到巴黎，结识印象派和新印象派画家，并接触到日本浮世绘的作品，视野的扩展使其画风巨变。1888年，来到法国南部小镇阿尔，创作《阿尔的吊桥》；同年与画家保罗·高更交往，但由于二人性格的冲突和观念的分歧，合作很快便告失败。此后，梵高的疯病（有人记载是“癫痫病”）时常发作，但神志清醒时他仍然坚持作画。1889年创作《星月夜》。1890年7月，梵高在精神错乱中开枪自杀，年仅37岁。
				文森特·威廉·梵高，荷兰后印象派画家。代表作有《星月夜》、自画像系列、向日葵系列等。
				梵高出生于1853年3月30日荷兰乡村津德尔特的一个新教牧师家庭，早年的他做过职员和商行经纪人，还当过矿区的传教士最后他投身于绘画。他早期画风写实，受到荷兰传统绘画及法国写实主义画派的影响。1886年，他来到巴黎，结识印象派和新印象派画家，并接触到日本浮世绘的作品，视野的扩展使其画风巨变。1888年，来到法国南部小镇阿尔，创作《阿尔的吊桥》；同年与画家保罗·高更交往，但由于二人性格的冲突和观念的分歧，合作很快便告失败。此后，梵高的疯病（有人记载是“癫痫病”）时常发作，但神志清醒时他仍然坚持作画。1889年创作《星月夜》。1890年7月，梵高在精神错乱中开枪自杀，年仅37岁。
						</div>
				</th>
			</tr>
		 </table>
	  </div>
   	 	<br>
		<br>
   	  <a class="style_copyright_a" href="javascript:void(0);"  onclick="showUploadDialog()">上传新文件</a>
   </div>
   <div id="upload_dialog" class="upload_dialog_div"> 
   	    <div class="style_content_div">
  	  	  <div class="style_content_upper_div">
  	  	  	  <div class="style_content_file_div">
  	  	  	  	 <span class="style_file_span"> 文件路径：</span>
				 <input type="file" id="pic" name="pic" οnchange="style_file_content">
  	  	  	  </div>
  	  	  	  <div class="style_content_prog_div">
  	  	  	  	 <span class="style_prog_span_hit" id="upload_tip_id"> 请选择要上传的文件 </span>
  	  	  	  </div>
  	  	  </div>
  	  	  <div class="style_content_lower_div">
  	  	  	   <span class="style_content_span" onmouseover="this.style.background='#cccccc'" onmouseout="this.style.background=''" onclick="hideUploadDialog()">取消</span>
  	  	  	   <span class="style_content_span" onmouseover="this.style.background='#F5CCDC'" onmouseout="this.style.background=''" onclick="uploadFile()">确定</span>
  	  	  </div>
  	  </div>
   </div>
</body>

 
</html>
