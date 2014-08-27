<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
	<title>区域管理</title>
	<meta name="decorator" content="default"/>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="js/upload/jquery.fileupload.css">
	<link rel="stylesheet" type="text/css"  href="css/jeesite.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/upload/vendor/jquery.ui.widget.js"></script>
	<script src="js/upload/jquery.fileupload.js"></script>
	<script src="js/jquery.validate.js"></script>
	<script src="js/tmpl.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#addhouseform").validate({
				rules: {
					//code: "required",
					title: "required",
					type: "required",
				//	bedroom: "number",
					//location: "",
					area:"number",
					leaseTrem:"number",
					rental: "number"
				},
				messages: {
				}
			});
			//loadfiles('${roominfo.id}');
			$('#fileupload').fileupload({
		        url: 'upload',
		        dataType: 'json',
		        type:'post',
		        formData:{'rId':'${roominfo.id}'},
		        autoUpload: true,
		        maxFileSize: 5000000, // 5 MB
		        disableImageResize: /Android(?!.*Chrome)|Opera/
		            .test(window.navigator.userAgent),
		        previewMaxWidth: 100,
		        previewMaxHeight: 100,
		        previewCrop: true
		    }).on('fileuploadadd', function (e, data) {
		    	
		    }).on('fileuploadprocessalways', function (e, data) {
		    	
		    }).on('fileuploadprogressall', function (e, data) {
		        var progress = parseInt(data.loaded / data.total * 100, 10);
		        $('#progress .progress-bar').css(
		            'width',
		            progress + '%'
		        );
		    }).on('fileuploaddone', function (e, data) {
		    	console.log(data.result[0],data.files);
		    //	$("#files-uTod").empty();
		    var file=data.result[0];
		    var html='<div class="row" id="${wid}" style="height:37px;" height="37px">'+
				'<div class="span6"><a href="#" title="asdasdasd" download="asdasda" >'+file.fileName+'</a></div>'+
					'<div class="span3">'+
						'<button class="btn btn-danger delete" onclick="deletef(\''+file.wid+'\',\''+file.roomInfoId+ '\',\''+file.changeName+ '\')>'+
			                    '<i class="glyphicon glyphicon-trash"></i>'+
			                    '<span>Delete</span>'+
			    		'</button>'+
					'</div>'+
				'</div>';
				$("#files-uTod").append(html);
		    
		        $.each(data.result, function (index, file) {
		        	
		        	console.log(file);
		            if (file.url) {
		                var link = $('<a>')
		                    .attr('target', '_blank')
		                    .prop('href', file.url);
		                $(data.context.children()[index])
		                    .wrap(link);
		            } else if (file.error) {
		                var error = $('<span class="text-danger"/>').text(file.error);
		                $(data.context.children()[index])
		                    .append('<br>')
		                    .append(error);
		            }
		        });
		    }).on('fileuploadfail', function (e, data) {
		        $.each(data.files, function (index, file) {
		            var error = $('<span class="text-danger"/>').text('File upload failed.');
		            $(data.context.children()[index])
		                .append('<br>')
		                .append(error);
		        });
		    }).prop('disabled', !$.support.fileInput)
		        .parent().addClass($.support.fileInput ? undefined : 'disabled');
		}); 
		var deletef = function(id, rid, cname) {
			console.log(id, rid);
			jQuery.ajax({
				type : "post",
				url : "removeFile",
				data : {
					rId : rid,
					id : id,
					cname : cname
				},
				success : function(msg) {
					console.log('=====', msg, '删除成功');
				if(msg.result=='success'){
					$('#'+id+'').empty();
					//$("#files-uTod").remove("#"+id);
					console.log('=====', msg, '删除成功');
				}
					//not1();
					//jQuery("#files-uTod").empty();
					//loadfiles(rid);

				},
				error : function(msg) {
					console.log('Data Saved failer:', '删除失败');
				}
			})

		};
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="roominfo">信息列表</a></li>
		<li class="active"><c:choose><c:when test="${t=='0'}"><a href="roomInfoAddEdit?t=0">添加信息</a>
			</c:when><c:otherwise><a href="roomInfoAddEdit?t=1&id=${roominfo.id}">修改信息</a></c:otherwise></c:choose></li>
	</ul><br/>
	<div class="row-fluid">
		<div class="span6 left" >
			 <form:form id="addhouseform" class="form-horizontal" method="post" action="addhouseinfo" modelAttribute="roominfo">
			  	<form:hidden path="id"/>
			  	<div class="control-group">
				    <label class="control-label" for="title">Code:</label>
				    <div class="controls">
				     <form:input type="text" path="code" id="code"/>
		   		 	</div>
		 		 </div>
		 		  <div class="control-group">
				    <label class="control-label" for="title">标题:</label>
				    <div class="controls">
				      <form:input type="text" path="title" id="title" />
		   		 	</div>
		 		 </div>
			 	  <div class="control-group">
				    <label class="control-label" for="type">类型:</label>
				    <div class="controls">
				      <form:select path="type">
				        <form:options items="${list}" />
				      </form:select>
		   		 	</div>
		 		 </div>
			 	  <div class="control-group">
				    <label class="control-label" for="bedroom">卧室数量:</label>
				    <div class="controls">
				     <form:input type="text" cssClass=" required" path="bedroom" id="bedroom" /></div><div class="clear">
		   		 	</div>
		 		 </div>
		 		 <div class="control-group">
				    <label class="control-label" for="location">地点:</label>
				    <div class="controls">
				     <form:input type="text"  path="location" id="location" /><div class="clear">
		   		 	</div>
		 		 </div>
		 		 </div>
		 		 <div class="control-group">
				    <label class="control-label" for="area">面积:</label>
				    <div class="controls">
				     <form:input type="text" path="area" id="area" /></div><div class="clear">
		   		 	</div>
		 		 </div>
		  		 <div class="control-group">
				    <label class="control-label" for="leaseTrem">租期:</label>
				    <div class="controls">
				     <form:input type="text"  path="leaseTrem" id="leaseTrem" /></div><div class="clear">
		   		 	</div>
		 		 </div>
			 	 <div class="control-group">
				    <label class="control-label" for="rental">租金:</label>
				    <div class="controls">
				     <form:input type="text"  path="rental" id="rental" /></div><div class="clear">
		   		 	</div>
		 		 </div>
		 		  <div class="control-group">
				    <label class="control-label" for="inputEmail">描述:</label>
				    <div class="controls">
				    	<form:textarea rows="8" cols="" path="destription" class="auto" ></form:textarea>
		   		 	</div>
		 		 </div>
	 		 <div class="form-actions">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
				<a href="roominfo" id="btnCancel" class="btn" >返 回</a>
				<!-- <input id="btnCancel" class="btn" type="button" value="返 回" onclick="roominfo"/> -->
			</div>
	    </form:form>
		
		</div>
		<div class="span6 right" >
		 	<div id="up-dlg" class="">
			    <span class="btn btn-success fileinput-button">
			        <i class="glyphicon glyphicon-plus"></i>
			        <span>上传图片</span>
			        <input id="fileupload" type="file" name="files[]" multiple>
			    </span>
			    <div id="files" class="files"></div>
			    
			    <div id="files-add"></div>
			
				<div id="files-uTod">
					<c:forEach items="${roominfo.images}" var="file">
						<div class="row" id="${file.wid}" style="height:37px;" height="37px">
							<div class="span6">
								 <a href="#" title="asdasdasd" download="asdasda" >${file.fileName }</a>
							</div>	
							<div class="span3">
								<button class="btn btn-danger delete" onclick="deletef('${file.wid }','${roominfo.id }','${file.changeName }')">
					                    <i class="glyphicon glyphicon-trash"></i>
					                    <span>Delete</span>
					    		</button>
							</div>
						</div>
					</c:forEach>
		     </div>
			</div>
		</div>
	</div>
</body>
</html>