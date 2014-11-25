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
		<img src="images/About-us-2.jpg" />
	<div class="row-fluid clearfix">
		
		<div id="left_nav_menu"class="span3 bs-docs-example" >
			<ul class="nav nav-list">
				<li class="nav-header">
					 <legend>关于我们</legend> 
				</li>
				<li id="copmpanyinfo" class="active">
					<a href="javascript:void(0)">公司介绍</a>
				</li>
				<li id="jobs">
					<a href="javascript:void(0)">招聘</a>
				</li>
				<li id="service">
					<a href="javascript:void(0)">特色核心服务</a>
				</li>
			</ul>
		</div>
		<div class="span9 bs-docs-example">
			<ul class="breadcrumb">
				<li>
					<a href="#">关于我们</a> <span class="divider">/</span>
				</li>
				
				<li id="subchild" class="active">
					公司介绍
				</li>
			</ul>
			<div id='company_descriptin_detial' class="about-us-description">
				<p id='company_descriptin_detial'>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Established in 2012, Suzhou Home from Home Real Estate Co. Ltd has expanded to be one of the most important and well-expected players in relocation service field. We are specialized in providing one-stop and packaged accommodation and housing service to a range of  customers both in corporates and individual expats. <br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;苏州鸿富行企业服务有限公司成立于2012年，现已经成为苏州涉外租赁市场最大，最专业的供应商之一。我们致力于为苏州园区的外企员工和来苏的外籍人士提供一站式、打包的住宿安家服务。<p/>
					 <br/>
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Our business includes: <span class="label label-important">Airport Picking Up</span>, <span class="label label-important">Hotel Reservation</span>, <span class="label label-important">Visa Application</span>, <span class="label label-important">House Leasing</span>, <span class="label label-important">Business Tour and Training</span>. With rich experience on Enterprise Services, we have build good relationships with Corporate Client, Such as Bosch, Philips, Stryke, Fairchild，ETC.  <br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我们的服务包括：<span class="label label-important">机场接机</span>，<span class="label label-important">酒店预订</span>，<span class="label label-important">签证办理</span>，<span class="label label-important">涉外租赁</span>，<span class="label label-important">商务旅游</span>以及<span class="label label-important">拓展培训</span>等一系列的企业服务。深耕企业市场，我们现在同苏州数十家大型公司建立了合作关系，其中就有博世汽车，飞利浦医疗，史塞克医疗，仙童半导体等世界知名500强企业。<br/>
		        </p>
		    </div>
			<div id='job_offers' style="display:none" >
				<div class="row">
					<div class="span12">
						<div class="accordion" id="accordion-jobs">
						</div>
					</div>
				</div>
	        </div>
	        <p id='service_detail' style="display:none">service_detail
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Established in2011, Suzhou Home from Home Real Estate Co. Ltd has expanded to be one of the most important and well-expected players in relocation service field. We are specialized in providing one-stop and packaged accommodation and housing service to a range of  customers both in corporates and individual expats. <br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;苏州鸿富行企业服务有限公司成立于2011年，现已经成为苏州涉外租赁市场最大，最专业的供应商之一。我们致力于为苏州园区的外企员工和来苏的外籍人士提供一站式、打包的住宿安家服务。
				 <br/>
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Our business includes: <span class="label label-important">Airport Picking Up</span>, <span class="label label-important">Hotel Reservation</span>, <span class="label label-important">Visa Application</span>, <span class="label label-important">House Leasing</span>, <span class="label label-important">Business Tour and Training</span>. With rich experience on Enterprise Services, we have build good relationships with Corporate Client, Such as Bosch, Philips, Stryke, Fairchild，ETC  <br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我们的服务包括：<span class="label label-important">机场接机</span>，<span class="label label-important">酒店预订</span>，<span class="label label-important">签证办理</span>，<span class="label label-important">涉外租赁</span>，<span class="label label-important">商务旅游</span>以及<span class="label label-important">拓展培训</span>等一系列的企业服务。深耕企业市场，我们现在同苏州数十家大型公司建立了合作关系，其中就有博世汽车，飞利浦医疗，史塞克医疗，仙童半导体等世界知名500强企业。<br/>
	        </p>
	        <h3>企业文化</h3>
			         服务决定市场     service determines market <p/>
				 服务决定生存     service determines survival<p/>
				 服务决定长久     service determines permanency<p/>
				  
		    <h3>企业理念  Corporate philosophy</h3>
			     用最专业的团队打造只属于您身边的贴心管家
				TO be your unique magic manager with our professional team
				
			<h3>合作伙伴  Corporate philosophy</h3>
			

	        
			
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
					getJobs();
					$('#company_descriptin_detial').hide();
					$('#job_offers').show();
					$('#service_detail').hide();
					break;
				case 'service':
					subchild.text($(this).children().text());
					$('#company_descriptin_detial').hide();
					$('#job_offers').hide();
					$('#service_detail').show();
					break;

			}
		});
		
		$("#"+curTab).click();	
    });
    
    var getJobs = function(){
		$.ajax({
			  dataType: "json",
			  type:'post',
			  url: "offers",
			  success:function(data){
				console.log(data.length);
				var html ='暂无招聘';
				if(data.length){
					var length = data.length;
					html='';
					for(var i=0;i<length;i++){
						html+='<div class="accordion-group"><div class="accordion-heading">'+
							 '<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-jobs" href="#accordion-element-'+data[i].id+'"><h4>'+
							 	data[i].title +'</h4></a></div><div id="accordion-element-'+data[i].id+'" class="accordion-body collapse"><div class="accordion-inner">'+
							 	data[i].content+'</div></div></div>'
					}
				}
				
				$('#accordion-jobs').html(html);
			
			  }
			});
    }
    
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
