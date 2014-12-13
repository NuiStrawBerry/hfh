<!DOCTYPE html>
<html lang="zh-CN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp" />

<link href="css/home-style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
.about-us-description{
	font-family: "Helvetica","Microsoft Yahei";
	font-size: 18px;
	line-height: 40px;
}
</style>
<body>
  <!--[if lt IE 9]>
  <link rel="stylesheet" type="text/css" href="css/custom-theme/jquery.ui.1.9.2.ie.css"/>
  <![endif]-->
<div class="container-fluid" style="width:1170px;margin:0 auto;">
<script type="text/javascript">
	var indexNum=5;
	

</script>
	<!--menu-->
	<jsp:include page="menu.jsp" ></jsp:include>
	<div class="row-fluid clearfix">
		<div>
			<div>no comments</div>
			<div>
				<div> zhende he bucuo</div>
				<div><span>zhang san </span><span>3014-20-30</span></div>

			</div>
		</div>
		<div>
			<form>
				<textarea name="content" id="content_id" ></textarea>
				<input type="text" name="cuName" />
			</form>
		</div>
	</div>
	<input type="hidden" id="tabs-id" value="${tabs}" />
	</div>
	
 <script>
	var curTab = $("#tabs-id").val();
    $(function() {
    	 var ue2 = UE.getEditor('content_id',{
    		 
    	 });
    });
    

  </script>
 <!--init for this page-->
		<script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
		<script type="text/javascript" src="js/SuperSlide.2.1.js"></script>
		<script type='text/javascript' src='js/jquery.browser.min.js'></script> 
		<script type='text/javascript' src='js/jquery.easing.1.3.js'></script> 
		 <script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
    	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.min.js"> </script>
    	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
		<script type="text/javascript" src="js/demo.js"></script>
		<jsp:include page="footer.jsp" />
</body>

</html>
