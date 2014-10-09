<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>

<jsp:include page="header.jsp"></jsp:include>
<link href="css/home-style.css" rel="stylesheet" type="text/css" />
<link rel='stylesheet' id='camera-css'  href='css/camera.css' type='text/css' media='all'> 
<script src="js/jquery.js"></script>

<body>
  <!--[if lt IE 9]>
  <link rel="stylesheet" type="text/css" href="css/custom-theme/jquery.ui.1.9.2.ie.css"/>
  <![endif]-->
<div class="container-fluid" style="width:1170px;margin:0 auto;">
<script type="text/javascript">
	var indexNum=0;

</script>
<style type="text/css">
.propoint a {
    color: #DC0606;
    font-size: 16px;
    text-decoration: none;
}
.propoint a:hover {
    text-decoration: underline;
}
</style>
	<!-- menu -->
	<jsp:include page="menu.jsp" ></jsp:include>
	
	<!--flu pic -->
	<div class="row-fluid">
		 <div class="camera_wrap camera_azure_skin" id="camera_wrap_1">
        </div>
	</div>

	<div class="row-fluid" >
		<div class="span3 left">
			<div class="bs-docs-example" id="RentalContact">
				 <legend><spring:message code="index.contact"/></legend> 
				 <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=891833977&site=qq&menu=yes">
				 	<img border="0" src="images/qq.png" alt="QQ 交谈" title="QQ 交谈"/>&nbsp;&nbsp;QQ 交谈
			 	</a><br/>
				 <img alt="" src="images/phone_24.png">&nbsp;&nbsp;123123123<br/>
				 <img alt="" src="images/email_24.png">&nbsp;&nbsp;12312312312
			</div>

			<!--thidr-->
			<div class="bs-docs-example">
			<legend>Hot Property Listing.</legend>
			<ul>
				<li>Jiacheng Apartment 3-0-0Br 130Sqm ￥4300 </li>
				<li>Jiacheng Apartment 3-0-0Br 130Sqm ￥4300</li>
				<li>Jiacheng Apartment 3-0-0Br 130Sqm ￥4300</li>
				<li>Jiacheng Apartment 3-0-0Br 130Sqm ￥4300</li>
				<li>Jiacheng Apartment 3-0-0Br 130Sqm ￥4300</li>
			</ul>
		</div>
			<!--thidr-->
			<div class="bs-docs-example">
			<legend>
				Real Estate News
			</legend>
			<ul>
				<li>Jiacheng Apartment 3-0-0Br 130Sqm ￥4300 </li>
				<li>Jiacheng Apartment 3-0-0Br 130Sqm ￥4300</li>
				<li>Jiacheng Apartment 3-0-0Br 130Sqm ￥4300</li>
				<li>Jiacheng Apartment 3-0-0Br 130Sqm ￥4300</li>
				<li>Jiacheng Apartment 3-0-0Br 130Sqm ￥4300</li>
			</ul>
		</div>
			<!--thidr-->
			<div class="bs-docs-example">
			<legend>
				Weekly Expats Events
			</legend>
			<ul>
				<li>Jiacheng Apartment 3-0-0Br 130Sqm ￥4300 </li>
				<li>Jiacheng Apartment 3-0-0Br 130Sqm ￥4300</li>
				<li>Jiacheng Apartment 3-0-0Br 130Sqm ￥4300</li>
				<li>Jiacheng Apartment 3-0-0Br 130Sqm ￥4300</li>
				<li>Jiacheng Apartment 3-0-0Br 130Sqm ￥4300</li>
			</ul>
		</div>

		</div>
		<div class="span9 rigth">
			<!-- search -->
			<jsp:include page="search.jsp"></jsp:include>
			
			<!-- apartment -->
			<div id='apartment_list' class="bs-docs-example" style="height:550px;">
				<legend class="propoint"><span class="span10"><a href="rentalist?tabs=aparent">Apartment for Rent (高档公寓)</a></span><span><a href="rentalist?tabs=aparent">More</a></span> </legend>
			</div>
			<!--ob -->
			<div id='ob_list' class="bs-docs-example" style="height:350px;">
				<legend class="propoint"><span class="span10"><a href="rentalist?tabs=obuilding">Villa for Rent(写字楼)</a></span><span><a href="rentalist?tabs=aparent">More</a></span> </legend>
				
			</div>
			<!--villia -->
			<div id='villia_list' class="bs-docs-example" style="height:350px;">
					<legend class="propoint"><span class="span10"><a href="rentalist?tabs=villa">House for Rent(别墅)</a></span><span><a href="rentalist?tabs=aparent">More</a></span> </legend>
			</div>
		</div>
	</div>
</div>
<script type="text/x-tmpl" id="tmpl-homebox">
{% for (var i=0, data; data=o[i]; i++) { %}
			<div class="probox">
					<div class="pimg">
						<a href="houseInfoDetailPage?id={%=data.id%}" target="_blank">
							<img src="{%=(data.imagesName?'timgs/'+data.imagesName:'images/no_image.png')%}" height="150" width="228">
						</a>
					</div>
					<div class="procont" style="line-height:20px;">
					<h4><a href="houseInfoDetailPage?id={%=data.id%}" target="_blank">{%=data.title%}</a></h4>

					<a>3-2-2Br &nbsp;{%=data.area%}sqm </a><br>
					<a>We offer: <span class="sprice">￥ {%=data.rental%}</span></a><br>
					<a style="line-height:20px;" href="onlierequest" target="_blank"><img src="images/online2.gif"></a> <a style="line-height:20px;" href="#" target="_blank"><img src="images/more2.gif"></a>
					<img src="images/hot.gif" height="16" width="28"></div>
				</div>

{% }%}
</script>

<script type="text/x-tmpl" id="tmpl-homeflow">
{% for (var i=0, data; data=o[i]; i++) { %}
			<div data-src="{%=(data.imagesName?'timgs/'+data.imagesName:'images/no_image.png')%}">
                <div class="camera_caption fadeFromBottom">
                    {%=data.title%}&nbsp;&nbsp;/&nbsp;&nbsp;{%=data.area%}sqm <em>￥{%=data.rental%}</em>
                </div>
            </div>

{% }%}
</script>

 <script>
	var params=[{"type":"villa",'dom':'villia_list','limit':'3'},{"type":"obuilding",'dom':'ob_list','limit':'3'},{"type":"aparent",'dom':'apartment_list','limit':'6'}];
    $(function() {
    	fl();
    	for(var i=0;i<params.length;i++){
    		g(params[i]);
    	}
    });
    
    var g=function(params){
    	$.ajax({
  		  type: "POST",
              url: "tophouseInfos",
              data: { type : params.type,limit:params.limit,pageSize:0 },
              success:function(msg){
					$('#'+params.dom+'').append(tmpl('tmpl-homebox', msg.houseInfoList));
				},
              error:function(msg){
                  console.log('Data Saved failer:',msg.result);
              }
          });
    };
    var fl = function(){
    	$.ajax({
    		  type: "POST",
                url: "topflowInfo",
                success:function(msg){
  					$('#camera_wrap_1').append(tmpl('tmpl-homeflow', msg.houseInfoList));
		          	$('#camera_wrap_1').camera({
		    			thumbnails: false,
		    			fx:'scrollRight',
		    			navigation : true,
		    			loader:'none',
		    			navigationHover:true,
		    			playPause:false//开始 暂停按钮
		    			//thumbnails: true
		    		});
  				},
                error:function(msg){
                    console.log('Data Saved failer:',msg.result);
                }
            });
    };
  </script>
 <!--init for this page-->

	<jsp:include page="footer.jsp" />
</body>
</html>