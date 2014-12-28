<!DOCTYPE html>
<html lang="zh-CN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp" />
<link rel="stylesheet" type="text/css" href="css/notify.css">
<link href="css/home-style.css" rel="stylesheet" type="text/css" />
<link rel='stylesheet' id='camera-css'  href='css/camera.css' type='text/css' media='all'> 
<script src="js/jquery.js"></script>
<style type="text/css">

		.fluid_container {
			margin: 0 auto;
			max-width: 1000px;
			width: 90%;
		}
		
.detail_li {
    color: #666666;
    font: bold 14px Arial;
    padding: 10px;
}
.detail_li2 {
    color: #000000;
    font: 12px Arial;
}
.i_call_us li{
	margin-top: 15px;
}

.email_to_us:after {
    background-color: #F5F5F5;
    border: 1px solid #DDDDDD;
    border-radius: 4px 0;
    color: #9DA0A4;
    content: "Email this Agent：";
    font-size: 20px;
    /*font-weight: bold;*/
    left: -1px;
    padding: 3px 7px;
    position: absolute;
    top: -1px;
    width: 258px;
}

.email_to_us {
    background-color: #FFFFFF;
    border: 1px solid #DDDDDD;
    border-radius: 4px;
    margin: 15px 0;
    padding: 39px 19px 14px;
    position: relative;
}

</style>
<body>
  <!--[if lt IE 9]>
  <link rel="stylesheet" type="text/css" href="css/custom-theme/jquery.ui.1.9.2.ie.css"/>
  <![endif]-->
<div class="container-fluid" style="width:1170px;margin:0 auto;">
<script type="text/javascript">
	var indexNum=1;

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
		<ul class="breadcrumb">
			<li>
				<a href="#">涉外租赁</a> <span class="divider">/</span>
			</li>
			<li id="subchild" class="active">
				高档公寓
			</li>
		</ul>
		<!-- div class='well well-small'>Golden Lough ( 金水湾花园 )</div> -->
		<legend><c:out value="${houseInfo.title}" /></legend>
		
	
		<div class="row-fluid clearfix">
		<div class="span9 bs-docs-example" >
			<div class="span8 fluid_container">
		        <div class="camera_wrap camera_emboss" id="camera_wrap_3">
		        	<c:choose>
		        		<c:when test="${not empty houseInfo.images}">
	        				<c:forEach items="${houseInfo.images }" var="images">
		        				<div data-src="timgs/${images.changeName }"></div>
		        			</c:forEach>
		        		</c:when>
		        		<c:otherwise>
		        			<div data-src="images/no_image.png"></div>
		        		</c:otherwise>
		        	</c:choose>
		        </div><!-- #camera_wrap_3 -->
		    </div>
		    <div class="span4">
			    <div style=" border-bottom: 1px dotted #EFEDEE;"><spna class="detail_li">Property ID:</spna>	<spna class="detail_li2"><c:out value="${houseInfo.code}" /></spna></div>
				<div style=" border-bottom: 1px dotted #EFEDEE;"><spna class="detail_li">Location:</spna>	<spna class="detail_li2"><c:out value="${houseInfo.location}" /></spna></div>
				<div style=" border-bottom: 1px dotted #EFEDEE;"><spna class="detail_li">Type:</spna>	<spna class="detail_li2">
					<c:choose>
						<c:when test="${houseInfo.type eq 'obuliding' }">办公楼</c:when>
						<c:when test="${houseInfo.type eq 'aparent' }">公寓</c:when>
						<c:otherwise>别墅</c:otherwise>
					</c:choose></spna>
				</div>
				<div style=" border-bottom: 1px dotted #EFEDEE;"><spna class="detail_li">Size:</spna>	<spna class="detail_li2"><c:out value="${houseInfo.area}" /></spna> sqm</div>
				<div style=" border-bottom: 1px dotted #EFEDEE;"><spna class="detail_li">Floor:</spna>	<spna class="detail_li2"><c:out value="${houseInfo.floorSize}" /></spna></div>
				<div style=" border-bottom: 1px dotted #EFEDEE;"><spna class="detail_li">Rental:</spna>	<spna class="detail_li2"><c:out value="${houseInfo.rental}" /></spna></div>
				<!-- <div style=" border-bottom: 1px dotted #EFEDEE;"><spna class="detail_li">Visitor：</spna>	<spna class="detail_li2">	Total 157625 people like this property</spna></div> -->
				<div style=" border-bottom: 1px dotted #EFEDEE;"><spna class="detail_li">Lease Term:</spna>	<spna class="detail_li2"><c:out value="${houseInfo.leaseTrem}" /></spna></div>
				<div style=" border-bottom: 1px dotted #EFEDEE;"><spna class="detail_li">Rental:</spna>	<spna class="detail_li2"><c:out value="${houseInfo.rental}" /></spna></div>
				<div>Click to Online Request</div>
		    </div>
		
		</div>
		<div class="span3 bs-docs-example ">
			<h4 style="font-color:red;">Interested in this property?</h4>
				Call Us freely at anytime on:
				<ul class="i_call_us">
				<li><img alt="" src="images/phone_24.png" />&nbsp;&nbsp;0512-62818239</li>
				<li>
					<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=312416704&site=qq&menu=yes">
						<img border="0" src="images/qq.png" alt="QQ 交谈" title="QQ 交谈"/>&nbsp;&nbsp;QQ 交谈
					</a>
			 	</li>
				
				<li><img alt="" src="images/email_24.png">&nbsp;&nbsp;<a href="mailto:kyle.tan@homefromhomerealestate.com" title="kyle.tan@homefromhomerealestate.com">kyle.tan</a></li>
				</ul>
				<p>
				200 qualified agents ensure you a most excellent relocation experience!
					Most extensive property database will help you to find the ideal one!
				</p>
		</div>
			
	</div>
	<div class="row-fluid clearfix">
		<div class="span9 bs-docs-example" >
			More Information
				<p>
				<c:out value="${houseInfo.destription}" />
				</p>
		
			</div>
		<div class="span3 email_to_us">
				To: Subject: ${houseInfo.title}
				<form id="eTu">
				<input type="hidden" name="hid" value="${houseInfo.id}"/>
				<input type="hidden" name="title" value="${houseInfo.title}"/>
				<label>Your full name:</label>
				<input type="text"  class="required" size="25" name="fullname" />
				<label>Your email:</label>
				<input type="email" size="25" name="email" />
				<label>Your mobile:</label>
				<input type="tel" size="25" name="tel" />
				<label>Your message:</label>
				<textarea style="width: 200px; height: 50px;" rows="20" cols="45" name="message"></textarea>
				<input type="button" class="btn" value="send" id="sendEtU"/>
				<input type="reset" style="display:none;" />
				</form>
		</div>
	
	</div>
		
		

       <div style="clear:both; display:block; height:100px"></div>
	</div>
	<div class="row-fluid clearfix"></div>

 <script>
 
    $(function() {
		jQuery('#camera_wrap_3').camera({
				height: '56%',
				pagination: true,
				thumbnails: false,
				imagePath: '../images/',
				height: '350px'
			});
	
		$("#sendEtU").on("click",function(){
			not11('<b>sending...</b>','info');
			$.ajax({
				  dataType: "json",
				  type:"post",
				  url: "emailToUs",
				  data: $("#eTu").serialize(),
				  success:function(data){
					  if(data.resCode==1){
						  $("input[type=reset]").trigger("click");
						  not11('<b>send successfully！</b>','success');
					  }else{
						  not11('<b>send failed!</b>','error');
					  }
				  }
				});
		})
	
	
    });


	function not11(msg,type) {
		notif({
			msg : msg,
			type : type
		});
	}
  </script>
		<script type="text/javascript" src="js/notifIt.js"></script>
		<script type="text/javascript" src="js/validation.js"></script>
		<jsp:include page="footer.jsp" />
</body>

</html>
