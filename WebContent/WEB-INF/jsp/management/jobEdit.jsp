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
 	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			 var ue2 = UE.getEditor('job_content_id');
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
		}); 
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="joblist">信息列表</a></li>
		<li class="active"><c:choose><c:when test="${empty job.id}"><a href="addJobs">添加信息</a>
			</c:when><c:otherwise><a href="addJobs?id=${roominfo.id}">修改信息</a></c:otherwise></c:choose></li>
	</ul><br/>
	<div class="row-fluid">
		<div >
			 <form:form id="saveJob" class="form-horizontal" method="post" action="saveJob" modelAttribute="job">
			  	<form:hidden path="id"/>
		 		  <div class="control-group">
				    <label class="control-label" for="title">标题:</label>
				    <div class="controls">
				      <form:input type="text" path="title" id="title" />
		   		 	</div>
		 		 </div>
		 		  <div class="control-group">
				    <label class="control-label" for="inputEmail">描述:</label>
				    <div class="controls">
				    	<form:textarea style="width:1024px;height:500px;" path="content" class="auto" id='job_content_id'></form:textarea>
		   		 	</div>
		 		 </div>
	 		 <div class="form-actions">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
				<a href="joblist" id="btnCancel" class="btn" >返 回</a>
				<!-- <input id="btnCancel" class="btn" type="button" value="返 回" onclick="roominfo"/> -->
			</div>
	    </form:form>
		
		</div>
	</div>
</body>
</html>