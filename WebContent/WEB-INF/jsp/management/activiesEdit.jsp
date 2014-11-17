<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
	<title>区域管理</title>
	<meta name="decorator" content="default"/>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link href="plugins/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.validate.js"></script>
    <script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript" src="plugins/datetimepicker/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="plugins/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			 var ue2 = UE.getEditor('content_id');
			 
			 $('#activieTime').datetimepicker({
					language:  'zh-CN',
				    format: 'yyyy-mm-dd',
				    minView: 2,
				    autoclose: 1
				});

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
			
			$("#publish").on('click',function(e){
				$("#status_id").val("1");
				$("#saveNews").submit();
				//e.preventDefault();
				//return;
				
			})
		}); 
		
		var ss = function (){
			
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="activieslist">信息列表</a></li>
		<li class="active"><c:choose><c:when test="${empty news.id}"><a href="addAc">添加信息</a>
			</c:when><c:otherwise><a href="addAc?id=${news.id}">修改信息</a></c:otherwise></c:choose></li>
	</ul><br/>
	<div class="row-fluid">
		<div >
			 <form:form id="saveAc" class="form-horizontal" method="post" action="saveAc" modelAttribute="activies">
			  	<form:hidden path="id"/>
		  		<%-- <form:hidden path="status" id="status_id"/> --%>
		 		  <div class="control-group">
				    <label class="control-label" for="title">标题:</label>
				    <div class="controls">
				      <form:input type="text" path="title" id="title" />
		   		 	</div>
		 		 </div>
		 		 <div class="control-group">
				    <label class="control-label" for="activieTime">活动时间: </label>
				    <div class="controls">
				    	<form:input type="text" path="activieTime" readOnly='true' id="activieTime" />
		   		 	</div>
		 		 </div>
		 		  <div class="control-group">
				    <label class="control-label" for="content">内容:</label>
				    <div class="controls">
				    	<form:textarea id="content_id" path="content" class="auto" style="width:1024px;height:500px;" ></form:textarea>
		   		 	</div>
		 		 </div>
		 		
	 		 <div class="form-actions">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
				<%--<button id="publish" class="btn btn-primary" >发布</button>--%>
				<a href="activieslist" id="btnCancel" class="btn" >返 回</a>
				<!-- <input id="btnCancel" class="btn" type="button" value="返 回" onclick="roominfo"/> -->
			</div>
	    </form:form>
		
		</div>
	</div>
</body>
</html>