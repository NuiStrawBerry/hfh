
<html style="overflow-x:hidden;overflow-y:auto;" class="">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<title></title>
			
	<meta http-equiv="Cache-Control" content="no-store"><meta http-equiv="Pragma" content="no-cache"><meta http-equiv="Expires" content="0">
	<meta name="author" content="http://thinkgem.iteye.com"><meta http-equiv="X-UA-Compatible" content="IE=7,IE=9,IE=10">
	<script type="text/javascript" src="js/jquery.js"></script>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script src="js/bootstrap.min.js"></script>
	<!--[if lte IE 6]><link href="/jeesite_new/static/bootstrap/bsie/css/bootstrap-ie6.min.css" type="text/css" rel="stylesheet" />
	<script src="/jeesite_new/static/bootstrap/bsie/js/bootstrap-ie.min.js" type="text/javascript"></script><![endif]-->
	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]> <script src="/jeesite_new/static/common/html5.js"></script><![endif]-->

		
	
	<meta name="decorator" content="default">
	<script type="text/javascript"> 
		$(document).ready(function() {
			$(".accordion-heading a").click(function(){
				$('.accordion-toggle i').removeClass('icon-chevron-down');
				$('.accordion-toggle i').addClass('icon-chevron-right');
				if(!$($(this).attr('href')).hasClass('in')){
					$(this).children('i').removeClass('icon-chevron-right');
					$(this).children('i').addClass('icon-chevron-down');
				}
			});
			$(".accordion-body a").click(function(){
				$("#menu li").removeClass("active");
				$("#menu li i").removeClass("icon-white");
				$(this).parent().addClass("active");
				$(this).children("i").addClass("icon-white");
			});
			$(".accordion-body a:first i").click();
		});
	</script>

	<style type="text/css">.fancybox-margin{margin-right:0px;}</style><style type="text/css"></style></head>
	<body>
		
	<div class="accordion" id="menu">
		<div class="accordion-group">
		    <div class="accordion-heading">
		    	<a class="accordion-toggle" data-toggle="collapse" data-parent="#menu" href="#collapse13" title=""><i class="icon-chevron-down"></i>&nbsp;机构用户</a>
		    </div>
		    <div id="collapse13" class="accordion-body collapse in">
				<div class="accordion-inner">
					<ul class="nav nav-list">
						<li class="active"><a href="roominfo" target="mainFrame"><i class="icon-user icon-white"></i>&nbsp;信息发布</a></li>
					
						<li><a href="#" target="mainFrame"><i class="icon-th-large"></i>&nbsp;招聘信息</a></li>
					
						<li><a href="#" target="mainFrame"><i class="icon-th"></i>&nbsp;关于我们</a></li>
					</ul>
				</div>
		    </div>
		</div>
	
		<div class="accordion-group">
		    <div class="accordion-heading">
		    	<a class="accordion-toggle" data-toggle="collapse" data-parent="#menu" href="#collapse3" title=""><i class="icon-chevron-right"></i>&nbsp;系统设置</a>
		    </div>
		    <div id="collapse3" class="accordion-body collapse ">
				<div class="accordion-inner">
					<ul class="nav nav-list">
						<li><a href="#" target="mainFrame"><i class="icon-list-alt"></i>&nbsp;菜单管理</a></li>
					
						<li><a href="#" target="mainFrame"><i class="icon-lock"></i>&nbsp;角色管理</a></li>
					
						<li><a href="#" target="mainFrame"><i class="icon-th-list"></i>&nbsp;字典管理</a></li>
					</ul>
				</div>
		    </div>
		</div>
	
		<div class="accordion-group">
		    <div class="accordion-heading">
		    	<a class="accordion-toggle" data-toggle="collapse" data-parent="#menu" href="#collapse23" title=""><i class="icon-chevron-right"></i>&nbsp;关于帮助</a>
		    </div>
		    <div id="collapse23" class="accordion-body collapse ">
				<div class="accordion-inner">
					<ul class="nav nav-list">
						<li><a href="http://jeesite.com/" target="_blank"><i class="icon-circle-arrow-right"></i>&nbsp;项目首页</a></li>
					
						<li><a href="https://github.com/thinkgem/jeesite/wiki" target="_blank"><i class="icon-circle-arrow-right"></i>&nbsp;项目维基</a></li>
					
						<li><a href="https://github.com/thinkgem/jeesite/issues/new" target="_blank"><i class="icon-circle-arrow-right"></i>&nbsp;问题反馈</a></li>
					</ul>
				</div>
		    </div>
		</div>
	</div>

	

</body></html>