<!DOCTYPE html>
<html lang="zh-CN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />

<link rel="stylesheet" type="text/css"	href="css/jquery-ui-1.9.2.custom.css" />
<link href="css/home-style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"	href="css/bootstrap-responsive.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

<link rel='stylesheet' id='camera-css' href='css/camera.css' type='text/css' media='all'>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/tmpl.min.js"></script>
<!-- <script src="js/pager.js"></script> -->
<script src="js/jquery.pagination.min.js"></script>
<style type="text/css">




.house-infobox div img{
	/*height: 170px;*/
}
</style>
<body>
	<!--[if lt IE 9]>
  <link rel="stylesheet" type="text/css" href="css/custom-theme/jquery.ui.1.9.2.ie.css"/>
  <![endif]-->
	<div class="container-fluid container-content">
		<script type="text/javascript">
	var indexNum=1;

</script>
		<!--menu-->
		<jsp:include page="menu.jsp"></jsp:include>

		<!--flu pic -->
		<div class="row-fluid">
			<div class="camera_wrap camera_azure_skin" id="camera_wrap_1">
				<div data-src="img/example-slide-1.jpg">
					<div class="camera_caption fadeFromBottom">
						Camera is a responsive/adaptive slideshow. <em>Try to resize
							the browser window</em>
					</div>
				</div>
				<div data-src="img/example-slide-2.jpg">
					<div class="camera_caption fadeFromBottom">
						It uses a light version of jQuery mobile, <em>navigate the
							slides by swiping with your fingers</em>
					</div>
				</div>
				<div data-src="img/example-slide-3.jpg">
					<div class="camera_caption fadeFromBottom">
						<em>It's completely free</em> (even if a donation is appreciated)
					</div>
				</div>
				<div data-src="img/example-slide-4.jpg">
					<div class="camera_caption fadeFromBottom">
						Camera slideshow provides many options <em>to customize your
							project</em> as more as possible
					</div>
				</div>
				<div data-src="img/example-slide-1.jpg">
					<div class="camera_caption fadeFromBottom">
						It supports captions, HTML elements and videos and <em>it's
							validated in HTML5</em> (<a href="#" target="_blank">have a look</a>)
					</div>
				</div>
			</div>
		</div>
		<div class="row-fluid clearfix">
			<div id="left_nav_menu" class="span3 bs-docs-example">
				<ul class="nav nav-list">
					<li class="nav-header"><legend>涉外租赁</legend></li>
					<li id="aparent" class="active"><a href="javascript:void(0)" style="height: 30px;/* font-size: 22px; */font-family:"Helvetica","Microsoft Yahei"><img
							src="images/aparent_24.png" /><span>高档公寓</span></a></li>
					<li id="villa"><a href="javascript:void(0)"><img
							src="images/villa_24.png" />别墅</a></li>
					<li id="obuilding"><a href="javascript:void(0)"><img
							src="images/obuilding_24.png" />写字楼</a></li>
				</ul>
			</div>
			<div class="span8 ">
				<ul class="breadcrumb">
					<li><a href="#">涉外租赁</a> <span class="divider">/</span></li>
					<li id="subchild" class="active">高档公寓</li>
				</ul>
				<input type="hidden" id="b_tabs" value="${tabs }">
				<!-- 信息列表 -->
				<div id='houseInfolist7'>

				</div>
				<!-- 分页  -->
				<div id="pager_id" class="pagination  pagination-right">
					<ul>
					</ul>
				</div>
			</div>
		</div>

	</div>

	<script type="text/x-tmpl" id="tmpl-demo">
{% for (var i=0, data; data=o[i]; i++) { %}
<div id="infobox" style="height: 260px;">
	<div  class="well well-small">
		<span><img id="icon-h" src="images/{%=data.type%}_24.png" /></span>
		<span><strong><a href="${pageContext.request.contextPath}/houseInfoDetailPage?id={%=data.id%}">{%=data.title%}</a></strong></span>
		<span class="fnt99">in&nbsp;&nbsp;<strong>{%=data.location%}</strong></span> 
						<!--  <span>hot</span>-->
	</div>
	<div class="span4 left" >
		<!--<img width="260" height="170" src="{%=data.iurl%}">-->
<img width="260" height="170" src="{%=(data.imagesName?'timgs/'+data.imagesName:'images/no_image.png')%}">

	</div>
	<div class="span6 right">
		<div class="listbtm">
			<div>
				<span class="room-detail-items"><span>Property ID:</span><strong class="bluefnt">{%=data.code%}</strong></span>
				<span class="room-detail-items"><span>Type:</span><strong class="bluefnt">{%=data.type%}</strong></span>
				<span class="room-detail-items"><span>Floor:</span><strong class="bluefnt">{%=data.floorSize%}</strong></span>
			</div>
			<div>
				<span class="room-detail-items"><span>Bedrooms:</span><strong class="bluefnt">{%=data.bedroom%}</strong></span>
				<span class="room-detail-items"><span>Area:</span><strong class="bluefnt">{%=data.area%}</strong>Sqm </span>
				<span class="room-detail-items"><span>Rental:</span><span class="bluefnt" style="font-family:vivaldi; font-size:16px;">{%=data.rental%}</span></span>
			</div>
		</div>


		<!--<div class="listbtm" style="line-height: 20px;">
			<p>Property ID:<strong class="bluefnt">{%=data.code%}</strong>
				Type: <strong class="bluefnt">{%=data.type%}</strong>Br 
                Floor: <strong class="bluefnt">{%=data.floorSize%}</strong><br>
				Area：<strong class="bluefnt">{%=data.bedroom%}</strong>Sqm 
                Rental:<span class="bluefnt" style="font-family:vivaldi; font-size:16px;">{%=data.rental%}</span>
			</p>
			<p>{%=data.descr%}</p>
		</div> -->
		<div class="room-detail-footer">
			<a href="mailto:kyle.tan@homefromhomerealestate.com">
				<i class="icon-envelope"></i>联系我们
			</a>
			<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=312416704&site=qq&menu=yes">
					<img border="0" src="images/chat.png" alt="QQ 交谈" title="QQ 交谈"/> 
				在线联系
			</a>
			<a href="${pageContext.request.contextPath}/houseInfoDetailPage?id={%=data.id%}" target="_blank">
				<i class="icon-info-sign"></i>详情
			</a>
		</div>
	</div>
</div>
{% } %}

</script>
	<script>
	var step=2,perShow =10;
    $(function() {
    	var total = 0;
    	var subchild = $('#subchild'),type='',curtabs=$("#b_tabs").val();
		$("#left_nav_menu").on('click','li',function(){
			$('#left_nav_menu li').removeClass('active');
			$(this).addClass('active');
			switch(this.id){
				case 'aparent':
					subchild.text($(this).children().text());
					t(this.id);
					break;
				case 'villa':
					subchild.text($(this).children().text());
					t(this.id);
					break;
				case 'obuilding':
					subchild.text($(this).children().text());
					t(this.id);
					break;

			}
			
		});
		var t = function(type,page){
			$.ajax({
			  dataType: "json",
			  type:'post',
			  url: "getHibt",
			  data: {'type':type,'page':page?page:1},
			  success:function(data){
				console.log(data);
			//	$('#houseInfolist7').empty();
				$('#houseInfolist7').append(tmpl("tmpl-demo", data.result));
				var inco=type=='obuilding'?'images/office_24.png':type=='villa'?'images/villa_24.png':'images/apartment_24.png';
				total = data.totalPage; //$('#icon-h').attr('src',inco);
				//new Pager('',total,step,perShow,type).init();
			  	 $("#pager_id").twbsPagination({
		    	        totalPages:total, //the number of pages (required, checked),
				    	// startPage:'',// the current page that show on start(default: 1),
				    	 visiblePages:6,// maximum visible pages (default: 5),
				    	// href :,//template for pagination links (default javascript:void(0);),
				    	// hrefVariable:'',// variable name in href template for page number (default {{number}}),
				    	 first:'首页',// text label// (default: 'First'),
				    	 prev:'上一页',// text label (default: 'Previous'),
				    	 next:'下一页',// text label (default: 'Next'),
				    	 last:'尾页', //text label (default: 'Last'),
				    	 onPageClick: function (event, page) {
				             t(type,page);
				         }
				    	// paginationClass:'', //the root style for pagination component (default: 'pagination'),		
		    	    });
			  }
			});
		};
		$("#"+curtabs).click();
    });
  </script>
	<!--init for this page-->
	<jsp:include page="footer.jsp" />
</body>

</html>
