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
<div class="container-fluid container-content">
<style type="text/css">
.propoint a {
    color: #DC0606;
    font-size: 16px;
    text-decoration: none;
}
.propoint a:hover {
    text-decoration: underline;
}
#homeHoth_id ul li div{
	
}
.hhtitle{
	margin-top: 4px;
}
.hhinfo{
}
</style>
	<!-- menu -->
	<jsp:include page="menu.jsp" ></jsp:include>
	
	<!--flu pic -->
	<div class="row-fluid">
		 <div class="camera_wrap camera_azure_skin" id="camera_wrap_1">
			 <div data-src="timgs/1-1.jpg">
				 <div class="camera_caption fadeFromBottom">
				 </div>
			 </div>
			 <div data-src="timgs/2-2.jpg">
				 <div class="camera_caption fadeFromBottom">
				 </div>
			 </div>
			 <div data-src="timgs/3-4.jpg">
				 <div class="camera_caption fadeFromBottom">
				 </div>
			 </div>
			 <div data-src="timgs/4-2.jpg">
				 <div class="camera_caption fadeFromBottom">
				 </div>
			 </div>
			 <div data-src="timgs/5-1.jpg">
				 <div class="camera_caption fadeFromBottom">
				 </div>
			 </div>
        </div>
	</div>

	<div class="row-fluid" >
		<div class="span3 left">
			<div class="bs-docs-example" id="RentalContact">
				 <legend><spring:message code="index.contact"/></legend> 
				 <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=312416704&site=qq&menu=yes">
				 	<img border="0" src="images/qq.png" alt="QQ 交谈" title="QQ 交谈"/>&nbsp;&nbsp;QQ 交谈
			 	</a><br/>
				 <img alt="" src="images/phone_24.png">&nbsp;&nbsp;0512-62818239<br/>
				 <img alt="" src="images/email_24.png">&nbsp;&nbsp;<a href="mailto:kyle.tan@homefromhomerealestate.com" title="kyle.tan@homefromhomerealestate.com">kyle.tan</a>
			</div>

			<!--thidr-->
			<div class="bs-docs-example">
			<legend>Hot Property Listing.</legend>
			<ul id='homeHoth_id'>
				<%--<li><div class="hhtitle">Jiacheng Apartment</div><div class='hhinfo'> 3-0-0Br 130Sqm ￥4300 </div></li>
				<li><div>Jiacheng Apartment</div><div> 3-0-0Br 130Sqm ￥4300 </div></li>
				<li><div>Jiacheng Apartment</div><div> 3-0-0Br 130Sqm ￥4300 </div></li>
				<li><div>Jiacheng Apartment</div><div> 3-0-0Br 130Sqm ￥4300 </div></li>
				<li><div>Jiacheng Apartment</div><div> 3-0-0Br 130Sqm ￥4300 </div></li>
				<li><div>Jiacheng Apartment</div><div> 3-0-0Br 130Sqm ￥4300 </div></li>
				<li><div>Jiacheng Apartment</div><div> 3-0-0Br 130Sqm ￥4300 </div></li>
				<li><div>Jiacheng Apartment</div><div> 3-0-0Br 130Sqm ￥4300 </div></li>
				<li><div>Jiacheng Apartment</div><div> 3-0-0Br 130Sqm ￥4300 </div></li>
				<li><div>Jiacheng Apartment</div><div> 3-0-0Br 130Sqm ￥4300 </div></li>--%>
			</ul>
		</div>
			<!--thidr-->
			<div class="bs-docs-example">
			<legend>
				<span style="width:200px;" >活动</span>
				<!-- <span ><a href="activies">more</a></span> -->
			</legend>
			<ul id="activies_id" class="clear:both">
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
				合作伙伴
			</legend>
			<ul>
				<li>金鸡湖大酒店</li>
				<li>Days Hotel</li>
				<li>雅都大酒店</li>
				<li>苏州尼盛万丽大酒店</li>
				<li>书香世家</li>
			</ul>
		</div>

		</div>
		<div class="span9 rigth">
			<!-- search -->
			<jsp:include page="search.jsp"></jsp:include>
			
			<!-- apartment -->
			<div id='apartment_list' class="bs-docs-example" style="height:672px;">
				<legend class="propoint"><span class="span11"><a href="rentalist?tabs=aparent">Apartment for Rent (高档公寓)</a></span><span><a href="rentalist?tabs=aparent">More</a></span> </legend>
			</div>
			<!--villia -->
			<div id='villia_list' class="bs-docs-example" style="height:360px;">
					<legend class="propoint"><span class="span11"><a href="rentalist?tabs=villa">House for Rent(别墅)</a></span><span><a href="rentalist?tabs=villa">More</a></span> </legend>
			</div>
			<!--ob -->
			<div id='ob_list' class="bs-docs-example" style="height:360px;">
				<legend class="propoint"><span class="span11"><a href="rentalist?tabs=obuilding">Office for Rent(写字楼)</a></span><span><a href="rentalist?tabs=obuilding">More</a></span> </legend>
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
					<a style="line-height:20px;" href="onlierequest" target="_blank"><img src="images/online2.gif"></a>
					<a style="line-height:20px;" href="rentalist?tabs=aparent" target="_blank"><img src="images/more2.gif"></a>
					{% if(data.isHot==1){ %}<img src="images/hot.gif" height="16" width="28">{% } %}</div>
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
 	var indexNum=0;
	var params=[{"type":"villa",'dom':'villia_list','limit':'3'},{"type":"obuilding",'dom':'ob_list','limit':'3'},{"type":"aparent",'dom':'apartment_list','limit':'6'}];
    $(function() {
    	//fl();
    	for(var i=0;i<params.length;i++){
    		g(params[i]);
    	}
    	homeHotHoses();
    	homeActivities();

		$('#camera_wrap_1').camera({
			thumbnails: false,
			fx:'scrollRight',
			navigation : true,
			loader:'none',
			navigationHover:true,
			playPause:false//开始 暂停按钮
			//thumbnails: true
		});
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
    /* var fl = function(){
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
    }; */
    
    var homeActivities = function(){
    	$.ajax({
    		type:"POST",
    		url:"activies",
    		success:function(msg){
    			console.log(msg);
    			var acInfo = msg.acInfoList;
    			var html = '';
    			if( acInfo.length>0){
    				for(var i = 0;i<acInfo.length;i++){
    					html +='<li><span class="hhtitle"><a href="activies?showDetail=1&p='+acInfo[i].id+'" title="'+acInfo[i].title+'">'+(acInfo[i].title).substr(0,10)+'...</a></span><span class="hhinfo" style=float:right">'+(acInfo[i].createTime).substr(0,10)+' </span></li>'
    				}
    				$('#activies_id').html(html);
    			}else{
    				$('#activies_id').html('no info');
    			}
    		},
    		error:function(){
    			
    		}
    	});
    } 
    
    var homeHotHoses = function(){
    	
    	$.ajax({
    		type:"POST",
    		url:"homehoth",
    		success:function(msg){
    			var houseInfo = msg.houseInfoList;
    			var html = '';
    			if( houseInfo.length>0){
    				for(var i = 0;i<houseInfo.length;i++){
    					html +='<li><div class="hhtitle">'+houseInfo[i].title+'</div><div class="hhinfo">'+ houseInfo[i].bedroom+' Br '+houseInfo[i].area+'Sqm ￥'+houseInfo[i].rental+' </div></li>'
    				}
    				$('#homeHoth_id').html(html);
    			}else{
    				$('#homeHoth_id').html('no info');
    			}
    		},
    		error:function(){
    			
    		}
    	});
    	
    }
   /*  var homeCooperater = function(){
    	$.ajax({
    		type:"POST",
    		url:"",
    		success:function(){
    			
    		},
    		error:function(){
    			
    		}
    	});
    	
    } */
  </script>
 <!--init for this page-->

	<jsp:include page="footer.jsp" />
</body>
</html>