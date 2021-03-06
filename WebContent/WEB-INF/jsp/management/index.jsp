<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>鸿富管理端</title>
	<meta name="decorator" content="default"/>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"  href="css/jeesite.min.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	
	<style type="text/css">
		#main {padding:0;margin:0;} #main .container-fluid{padding:0 7px 0 10px;}
		#header {margin:0 0 10px;position:static;} #header li {font-size:14px;_font-size:12px;}
		#header .brand {font-family:Helvetica, Georgia, Arial, sans-serif, 黑体;font-size:26px;padding-left:33px;}
		#footer {margin:8px 0 0 0;padding:3px 0 0 0;font-size:11px;text-align:center;border-top:2px solid #0663A2;}
		#footer, #footer a {color:#999;} 
	</style>
		<div id="main" style="width: auto;">
		<div id="header" class="navbar navbar-fixed-top">
	      <div class="navbar-inner">
	      	 <div class="brand">HomeFromHomeRealstate</div>
	         <div class="nav-collapse">
	           <ul id="menu" class="nav">
					<!-- <li class="menu"><a class="menu" href="#" target="menuFrame">我的面板</a></li>
					<li class="menu"><a class="menu" href="#" target="menuFrame">内容管理</a></li> -->
					<li class="menu active"><a class="menu" href="javascript:void(0);" target="menuFrame">系统管理</a></li>
					<!-- <li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">默认站点<b class="caret"></b></a>
						<ul class="dropdown-menu">
						<li><a href="#">默认站点</a></li><li><a href="#">子站点测试</a></li>
						</ul>
					</li> -->
	           </ul>
	           <ul class="nav pull-right">
				 <li><a href="../index" target="_blank" title="访问网站主页"><i class="icon-home"></i></a></li>
			  	 <li class="dropdown">
				    <a class="dropdown-toggle" data-toggle="dropdown" title="个人信息">您好, 管理员</a>
				   <!--  <ul class="dropdown-menu">
				      <li><a href="#" target="mainFrame"><i class="icon-user"></i>&nbsp; 个人信息</a></li>
				      <li><a href="#" target="mainFrame"><i class="icon-lock"></i>&nbsp;  修改密码</a></li>
				    </ul> -->
			  	 </li>
			  	 <li><a href="logout" title="退出登录">退出</a></li>
			  	 <li>&nbsp;</li>
	           </ul>
	         </div><!--/.nav-collapse -->
	      </div>
	    </div>
	    <div class="container-fluid">
			<div id="content" class="row-fluid">
				<div id="left" style="width: 160px;">
					<iframe id="menuFrame" name="menuFrame" src="menu" style="overflow: visible; height: 407px;" scrolling="yes" frameborder="no" width="100%" height="650"></iframe>
				</div>
				<div id="openClose" class="close" style="height: 402px;">&nbsp;</div>
				<div id="right" style="width: 1730px;">
					<iframe id="mainFrame" name="mainFrame" src="" style="overflow: visible; height: 407px;" scrolling="yes" frameborder="no" width="100%" height="650"></iframe>
				</div>
			</div>
		    <div id="footer" class="row-fluid">
	            Copyright © 2012-2013 Home from home - Powered By <a href="https://github.com/thinkgem/jeesite" target="_blank">Jonas</a> V1.1.0
			</div>
		</div>
	</div>
	<script type="text/javascript"> 
		var leftWidth = "160"; // 左侧窗口大小
		function wSize(){
			var minHeight = 500, minWidth = 980;
			var strs=getWindowSize().toString().split(",");
			$("#menuFrame, #mainFrame, #openClose").height((strs[0]<minHeight?minHeight:strs[0])-$("#header").height()-$("#footer").height()-32);
			$("#openClose").height($("#openClose").height()-5);
			if(strs[1]<minWidth){
				$("#main").css("width",minWidth-10);
				$("html,body").css({"overflow":"auto","overflow-x":"auto","overflow-y":"auto"});
			}else{
				$("#main").css("width","auto");
				$("html,body").css({"overflow":"hidden","overflow-x":"hidden","overflow-y":"hidden"});
			}
			$("#right").width($("#content").width()-$("#left").width()-$("#openClose").width()-5);
		}
	</script>
	<script type="text/javascript" src="js/wsize.js"></script>
</body>
</html>