<!DOCTYPE html>
<html lang="zh-CN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="icon" href="images/style.ico" type="image/x-icon" />
<link rel="shortcut icon" href="images/style.ico" type="image/x-icon" />
<title>Home From Home Service</title>
</head>
<link rel="stylesheet" type="text/css" href="css/notify.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.9.2.custom.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link href="css/home-style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.js"></script>
<script type="text/javascript" src="js/notifIt.js"></script>
<script src="js/bootstrap.min.js"></script>
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

		<legend>Residential Leasing Online Request</legend>
	<div class="row-fluid clearfix">
		<div class="bs-docs-example">
			<form id="onlinerequestForm" action="onlineRequest" method="post">
				<div class="row-fluid" id="hear-from-id">
					<div class='well well-small'>WHERE DID YOU HEAR ABOUT US: (Multiple choice) *</div>
					<div class="span3">
						<label class="checkbox"><input type="checkbox" name="cityweekend" value="cityweekend">City Weekend</label>
						<label class="checkbox"><input type="checkbox" name="Newsletter" value="Newsletter">Newsletter from our Email</label>
						<label class="checkbox"><input type="checkbox" name="link" value="link">Link in Other websites</label>
						<label class="checkbox"><input type="checkbox" name="suzhouDaily" value="suzhouDaily">Suzhou Daily</label>
					</div>
					<div class="span3">
						<label class="checkbox"><input type="checkbox" name="that" value="that">That's</label>
						<label class="checkbox"><input type="checkbox" name="suzhouExpat" value="suzhouExpat">Suzhou Expat</label>
						<label class="checkbox"><input type="checkbox" name="friends" value="friends"> Friends</label>
						other:<input type="text" name="other"/>
					</div>
					<div class="span3">
						<label class="checkbox"><input type="checkbox" name="Enjoy Classifieds" value="Enjoy Classifieds"> Enjoy Classifieds</label>
						<label class="checkbox"><input type="checkbox" name="search" value="search">Google Search Engines</label>
						<label class="checkbox"><input type="checkbox" name="own Company" value="own Company"> Your own Company</label>
					</div>
				</div>
				<div class="row-fluid form-horizontal">
					<div class='well well-small'>CONTACT DETAILS:</div>
					 <div class="span5">
					 	<div class="control-group">
						    <label class="control-label" for="nm">Name:  *</label>
						    <div class="controls">
						    	<input name="name" type="text" id="name" size="24" />
						     </div>
				 		 </div>
					 	<div class="control-group">
						    <label class="control-label" for="company">Company:</label>
						    <div class="controls">
						     	<input name="company" type="text" id="company" size="24" />
						     </div>
				 		 </div>
				 		 <div class="control-group">
						    <label class="control-label" for="email">E-mail: </label>
						    <div class="controls">
						   		 <input name="email" type="text" id="email" size="28" />
						     </div>
			   		 	</div>
				 		 <div class="control-group">
						    <label class="control-label" for="fax">Fax:</label>
						    <div class="controls">
						     <input name="fax" type="text" id="fax" size="24" />
						     </div>
				   		 	</div>
			   		 	 <div class="control-group">
						    <label class="control-label" for="mob">Arrival Date:</label>
						    <div class="controls">
						     <input name="arrival" type="text" id="arrival" size="24" />
				   		 	</div>
				 		 </div>
					 </div>
					 <div class="span5">
					 	 <div class="control-group">
						    <label class="control-label" for="nationality">Nationality:</label>
						    <div class="controls">
						     <input name="nationality" type="text" id="nationality" size="24" />
				   		 	</div>
				 		 </div>
				 		 <div class="control-group">
						    <label class="control-label" for="position">Position:</label>
						    <div class="controls">
						     <input name="position" type="text" id="position" size="24" />
				   		 	</div>
				 		 </div>
				 		 <div class="control-group">
						    <label class="control-label" for="tel">Tel: </label>
						    <div class="controls">
						     <input name="tel" type="text" id="tel" size="24" />
				   		 	</div>
				 		 </div>
				 		 <div class="control-group">
						    <label class="control-label" for="mob">Mobile:</label>
						    <div class="controls">
						     <input name="mob" type="text" id="mob" size="24" />
				   		 	</div>
				 		 </div>
				 		  <div class="control-group">
						    <label class="control-label" for="mob">Move-in Date: </label>
						    <div class="controls">
						     <input name="movein" type="text" id="movein" />
				   		 	</div>
				 		 </div>
					 </div>
				
				</div>
				<div class='well well-small'>HOUSING REQUIREMENTS:</div>
				<div class="form-inline">
					<lable class="span4">Your Rental Budget Range (RMB/Month): </lable>
					<label for="">Min:</label>
					<input type="text" class="input-small" name="minbudget"/>
					<label for="">Max:</label>
					<input type="text" class="input-small" name="maxbudget"/>
				</div>
				<div>
					<lable class="span2">Term of Lease:</lable>
					<select name="leaseterm">
					<option value="1 year" selected="selected">1 year</option>
					<option value="2 year">2 years</option>
					<option value="3 year">3 years</option>
					<option value="above 3 year">above 3 years</option>
					</select>
				
				</div>
				<div>
					<lable  class="span2">Location Preference:</lable>
					<input name="location" type="text" id="location" />
				</div>
				<div>
				<div class="form-inline" id="property-type">
				<lable class="span3">Property Type (Multiple choice):</lable>
					<lable class="checkbox">
						<input name="Apartment" type="checkbox" value="Apartment" />Apartment
					</label>
					<label class="checkbox">
						<input name="SApartment" type="checkbox" value="Service Apartment" />Service Apartment
					</label>
					<label class="checkbox">
						<input name="Villa" type="checkbox" value="Villa" />Villa
					</label>
					<label class="checkbox">
						<input name="Historical" type="checkbox" value="Historical House" />Historical House
					</label>
				</div>	
						
				</div>
				<div>
					<label  class="span2">Number of Bedroom:</label>
					<select name="bedrooms">
						<option value="ALL" selected="selected">All</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
					</select>
				</div>
				<div>
					Home Furnished :
					<select name="furnished" id="Furnished">
					<option value="Yes" selected="selected">Yes</option>
					<option value="No">No</option>
					<option value="Partly">Partly</option>
					</select>
				</div>
				<div>
				Any Pets :
				<select name="pet" id="pet">
				<option value="Yes" selected="selected">Yes</option>
				<option value="No">No</option>
				</select>
				</div>
				<div>
					<label class="form-inline">Please note any other additional
					requirements/comments you may have:</label>
					<div>
					<span class="span1"></span>
					<span class="span11">
						<textarea name="additional" cols="700" rows="12" wrap="VIRTUAL" id="additional" style="width:600px"></textarea>
					</span>
					</div>
					<input type="hidden" name="hearfrom"  id="hf"/>
					<input type="hidden" name="propertyType" id="pt"/>
					
				</div>
				<input type="button" class="btn" value="提交" id="submit"/>
				<input type="reset" class="btn" value="重置" id="reset"/>
				<input type="button" class="btn" value="返回" id="back"/>
			
			</form>
		</div>
	
	</div>
		
		

       <div style="clear:both; display:block; height:100px"></div>
	</div>
	<div class="row-fluid clearfix"></div>

 <script>
 
    $(function() {
	
		$("#submit").on("click",function(){
			//alert(123);
			var hearfrom = "",propertyType="";
			$("#hear-from-id input:checked").each(function(){
				hearfrom+=$(this).val()+",";
			});
			$("#property-type input:checked").each(function(){
				propertyType+=$(this).val()+",";
			});
			$("#hf").val(hearfrom.substr(0,hearfrom.length-1));
			$("#pt").val(propertyType.substr(0,propertyType.length-1));
			
			$.ajax({
				  dataType: "json",
				  type:"post",
				  url: "onlineRequest",
				  data: $("#onlinerequestForm").serialize(),
				  success:function(data){
					console.log(data);
					not11();
				  }
				});
		})
	
	
    });
    
	function not11() {
		notif({
			msg : "<b>Success:</b> In 5 seconds i'll be gone",
			type : "success"
		});
	}
  </script>
		<jsp:include page="footer.jsp" />
</body>

</html>
