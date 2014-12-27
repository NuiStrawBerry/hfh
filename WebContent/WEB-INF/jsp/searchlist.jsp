<!DOCTYPE html>
<html lang="zh-CN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />


<link href="css/home-style.css" rel="stylesheet" type="text/css" />
<link rel='stylesheet' id='camera-css'  href='css/camera.css' type='text/css' media='all'> 
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/tmpl.min.js" ></script>
<style type="text/css">
.fnt99 {
    color: #990000;
    font-size: 10px;
}
.bluefnt {
    color: #0033FF;
}
.listbtm {
    border-bottom: 1px dashed #CCCCCC;
}

.infobox {
    height: 260px;
}
.listbtm p span{
	width:160px;
	 margin-right: 15px;
}

.conn-det a{
	margin-right: 28px;
}
.descip{
	height: 80px;
}
</style>
<body>
  <!--[if lt IE 9]>
  <link rel="stylesheet" type="text/css" href="css/custom-theme/jquery.ui.1.9.2.ie.css"/>
  <![endif]-->
<div class="container-fluid" style="width:1170px;margin:0 auto;">
<script type="text/javascript">
	var indexNum='';

</script>
	<!--menu-->
	<jsp:include page="menu.jsp" ></jsp:include>
		<!--flu pic -->
		<div class="row-fluid">
			 <div class="camera_wrap camera_azure_skin" id="camera_wrap_1">
	            <div data-src="img/example-slide-1.jpg">
	                <div class="camera_caption fadeFromBottom">
	                    Camera is a responsive/adaptive slideshow. <em>Try to resize the browser window</em>
	                </div>
	            </div>
	            <div data-src="img/example-slide-2.jpg">
	                <div class="camera_caption fadeFromBottom">
	                    It uses a light version of jQuery mobile, <em>navigate the slides by swiping with your fingers</em>
	                </div>
	            </div>
	            <div data-src="img/example-slide-3.jpg">
	                <div class="camera_caption fadeFromBottom">
	                    <em>It's completely free</em> (even if a donation is appreciated)
	                </div>
	            </div>
	            <div data-src="img/example-slide-4.jpg">
	                <div class="camera_caption fadeFromBottom">
	                    Camera slideshow provides many options <em>to customize your project</em> as more as possible
	                </div>
	            </div>
	            <div data-src="img/example-slide-1.jpg">
	                <div class="camera_caption fadeFromBottom">
	                    It supports captions, HTML elements and videos and <em>it's validated in HTML5</em> (<a href="#" target="_blank">have a look</a>)
	                </div>
	            </div>
	        </div>
		</div>
	<div class="row-fluid clearfix">
		<div id="left_nav_menu"class="span3 bs-docs-example" >
			<!--  <ul class="nav nav-list">
				<li class="nav-header">
					 <legend>涉外租赁</legend> 
				</li>
				<li id="aparent" class="active">
					<a href="javascript:void(0)"><img src="images/apartment_24.png"/>高档公寓</a>
				</li>
				<li id="villa">
					<a href="javascript:void(0)"><img src="images/villa_24.png"/>别墅</a>
				</li>   
				<li id="obuilding">
					<a href="javascript:void(0)"><img src="images/office_24.png"/>写字楼</a>
				</li>
			</ul>-->
		</div>
		<div class="span8 ">
		<!-- search -->
			<jsp:include page="search.jsp"></jsp:include>
			
			<div class="breadcrumb">搜索结果：</div>
			<!-- <ul class="breadcrumb">
				<li>
					<a href="#">涉外租赁</a> <span class="divider">/</span>
				</li>
				<li id="subchild" class="active">
					高档公寓
				</li>
			</ul>  --> 
			<div id='houseInfolist7'>
				<c:forEach items="${result }" var="list">
					<div id="infobox" style="height: 260px;">
						<div  class="well well-small">
							<span><img src="images/${list.type}_24.png" /></span>
							<span><strong><a href="${pageContext.request.contextPath}/houseInfoDetailPage?id=${list.id}">${list.title}</a></strong></span>
							<span class="fnt99">in&nbsp;&nbsp;<strong>${list.location}</strong></span> 
											<!--  <span>hot</span>-->
						</div>
						<div class="span4 left" >
							<c:choose>
								<c:when test="${list.imagesName !=null }">
									<img width="260" height="170" src="timgs/${list.imagesName }">
								</c:when>
								<c:otherwise>
									<img width="260" height="170" src="images/no_image.png">
								</c:otherwise>
							</c:choose>
							
						</div>
						<div class="span6 right">
							<div class="listbtm" style="line-height: 20px;">
								<p>
									<span>Property ID:<strong class="bluefnt">${list.code}</strong></span>
									<span>Type: <strong class="bluefnt">${list.type}</strong>Br </span>
					               <span> Floor: <strong class="bluefnt">${list.floorSize}</strong></span><br>
									<span>Area：<strong class="bluefnt">${list.area}</strong>Sqm </span>
					               <span> Rental:<strong class="bluefnt">${list.rental}</strong></span>
								</p>
								<!--  <div height="75px"><p class="descip">${list.destription}</p></div>-->
								
							</div>
							<div class="conn-det">
								<a href="mailto:yyz201000@163.com">
									<i class="icon-envelope"></i>联系我们
								</a>
								<a href="#">
									<i class="icon-envelope"></i>在线联系
								</a>
								<a href="${pageContext.request.contextPath}/houseInfoDetailPage?id=${list.id}" target="_blank">
									<i class="icon-info-sign"></i>详情
								</a>
							</div>
						</div>
					</div>
				</c:forEach>
			
			</div>
		    
			<div class="pagination  pagination-right">
			<ul>
				<li><a href="javascript:void(0)" onclick="page(${curPage-1<=0?1:curPage-1},${start },${end})" class="disabled">«</a></li>
				<c:choose>
					<c:when test="${totalPage <=6}">
						<c:forEach var="pageNum" begin="1" end="${totalPage}" step="1">
				    		<li><a href="#" <c:if test="${curPage == pageNum }"> class="active"</c:if>>${pageNum}</a></li>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach var="pageNum" begin="${start }" end="${end}" step="1">
					   			 <li <c:if test="${curPage eq pageNum }"> class="active"</c:if>><a href="javascript:void(0)" onclick="page(${pageNum},${start },${end})">${pageNum}</a></li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<li><a href="javascript:void(0)" onclick="page(${curPage+1>totalPage?totalPage:curPage+1},${start },${end})">»</a></li>
			</ul>
			</div>
		</div>
	</div>

	</div>
 <script>
 
 
 
 
 var page = function(pn,sn,en){
	 $("#pn").val(pn);
	 $("#endNum_id").val(en);
	 $("#startNum_id").val(sn);
	 $("#searchForm").submit();
	 
 }
    $(function() {
    	var subchild = $('#subchild'),type='';
		$("#left_nav_menu").on('click','li',function(){
			console.log('===1=',this.id,$(this).children().text());
			$('#left_nav_menu li').removeClass('active');
			$(this).addClass('active');
			switch(this.id){
				case 'aparent':
					subchild.text($(this).children().text());
					type='aparent'
					t();
					console.log('====','copmpanyinfo');
					break;
				case 'villa':
					subchild.text($(this).children().text());
					console.log('====','jobs');
					type='villa';
					t();
					break;
				case 'obuilding':
					subchild.text($(this).children().text());
					console.log('====','service');
					type='obuilding';
					t();
					break;

			}
			
		});
    });
  </script>
 <!--init for this page-->
		<script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
		<script type="text/javascript" src="js/SuperSlide.2.1.js"></script>
		<script type='text/javascript' src='js/jquery.browser.min.js'></script> 
		<script type='text/javascript' src='js/jquery.easing.1.3.js'></script> 
		<script type='text/javascript' src='js/camera.js'></script> 
		<script type="text/javascript" src="js/demo.js"></script>
		<jsp:include page="footer.jsp" />
</body>

</html>
