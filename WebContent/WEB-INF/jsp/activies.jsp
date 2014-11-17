<!DOCTYPE html>
<html lang="zh-CN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp" />

<link href="css/home-style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.pagination.min.js"></script>
<style type="text/css">
.activies-box{
	border-bottom: 1px solid #DDD;
}

.activies-box ul li{
	margin-top: 11px;
}
.activies-box img{
	margin: 10px 0 10px 0;
}
.ac-detail{
	margin-top: 11px;
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
		<img src="images/About-us-2.jpg" />
	<div class="row-fluid clearfix">
		
		<div id="left_nav_menu"class="span3 bs-docs-example" >
			<ul class="nav nav-list">
				<li class="nav-header">
					 <legend>关于我们</legend> 
				</li>
				<li id="copmpanyinfo" class="active">
					<a href="javascript:void(0)">活动</a>
				</li>
				<li id="jobs">
					<a href="javascript:void(0)">合作商家</a>
				</li>
			</ul>
		</div>
		<div class="span9 bs-docs-example">
			<ul class="breadcrumb">
				<li>
					<a href="#">聚会活动</a> <span class="divider">/</span>
				</li>
				
				<li id="subchild" class="active">
					活动
				</li>
			</ul>
			<div>
				<div id='activies_list_id'></div>
				<div id="pager_ac" class="pagination  pagination-right">
					<ul></ul>
				</div>
		    </div>
		</div>
	</div>
	<input type="hidden" id="tabs-id" value="${tabs}" />
	</div>
	
 <script>
	var curTab = $("#tabs-id").val();
    $(function() {
    	var subchild = $('#subchild');
		$("#left_nav_menu").on('click','li',function(){
			$('#left_nav_menu li').removeClass('active');
			$(this).addClass('active');
			switch(this.id){
				case 'copmpanyinfo':
					subchild.text($(this).children().text());
					$('#company_descriptin_detial').show();
					$('#job_offers').hide();
					$('#service_detail').hide();
					$('') 
					break;
				case 'jobs':
					subchild.text($(this).children().text());
					break;
			}
		});
		
		$("#"+curTab).click();	
			getActivies(1,10);
    });
    
    var getActivies = function(pageNo,limit){
		$.ajax({
			  dataType: "json",
			  type:'post',
			  url: "getActiviesList",
			  data: {'limit':limit,'pageNo':pageNo?pageNo:1},
			  success:function(data){
				var html ='暂无活动';
				$("#activies_list_id").html(data.result.length?tmpl("tmpl-activies", data.result):html);
				 $("#pager_ac").twbsPagination({
					 totalPages:data.totalPage, //the number of pages (required, checked),
				    	// startPage:'',// the current page that show on start(default: 1),
				    	 visiblePages:10,// maximum visible pages (default: 5),
				    	// href :,//template for pagination links (default javascript:void(0);),
				    	// hrefVariable:'',// variable name in href template for page number (default {{number}}),
				    	 first:'首页',// text label// (default: 'First'),
				    	 prev:'上一页',// text label (default: 'Previous'),
				    	 next:'下一页',// text label (default: 'Next'),
				    	 last:'尾页', //text label (default: 'Last'),
				    	 onPageClick: function (event, page) {
				    		 getActivies(page,limit);
				         }
		    	    });
				
			
			  }
			});
    }
    
    
    
  </script>
  
  	<script type="text/x-tmpl" id="tmpl-activies">
{% for (var i=0, data; data=o[i]; i++) { %}

	<div class="row-fluid activies-box ">
		<div class="span3 left">
			<a><img src="/timgs/20140901153120_f805a164-31a9-11e4-b3ad-952efb376843.jpg" /></a>
		</div>
		<div class="span9 right ac-detail">
			<ul class="list-group">
			  <li class="list-group-item ac-title">
			   	 <a href="#">{%=data.title%}</a>
			  </li>
			  <li class="list-group-item ac-time">
			  	 时间：11月11日 周二 21:30||{%=data.cerateTime%}
			  </li>
			  <li class="list-group-item ac-addr">
			  	 地点：上海 徐汇区天钥桥路八万人体育馆GAGA酒吧||{%=data.locations%}
			  </li>
			</ul>
		</div>
	</div>

{% } %}
</script>
 <!--init for this page-->
		<script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
		<script type="text/javascript" src="js/SuperSlide.2.1.js"></script>
		<script type='text/javascript' src='js/jquery.browser.min.js'></script> 
		<script type='text/javascript' src='js/jquery.easing.1.3.js'></script> 
		<script type='text/javascript' src='js/camera.js'></script> 
		<script src="js/tmpl.min.js"></script>
		<script type="text/javascript" src="js/demo.js"></script>
		<jsp:include page="footer.jsp" />
</body>

</html>
