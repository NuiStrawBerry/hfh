<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<!-- search form-->
			<div class="bs-docs-example">
			   <!--  action="search" method="post">  -->
			   <form class="serach-form" id="searchForm" action="search" method="post">
			    	 <legend>House for Rent Search</legend> 
			        <div class="form-inline" style="margin-bottom: 10px;">
						<div class="span6">
							 <label class="control-label" for="type" style="width: 35px;">Type</label>
							<select class="formselecttype" id="type" name="type">
								<option value="all" <c:if test="${type eq 'all' }"> selected="selected"</c:if> >All property types</option>
								<option value="villa" <c:if test="${type eq 'villa' }"> selected="selected"</c:if> >Villa</option>
								<option value="aparent" <c:if test="${type eq 'aparent' }"> selected="selected"</c:if> >Apartment</option>
								<option value="obuilding" <c:if test="${type eq 'obuilding' }"> selected="selected"</c:if> >Office</option>
							</select>
						</div>
						<div class="span6">
							<label class="control-label" for="location" style="width: 58px;">Location</label>
							<select class="formselectLocation" id="location" name="location" style="width: 185px;">
								<option value="all" <c:if test="${location eq 'all' }"> selected="selected"</c:if>>All locations</option>
								<option value="Suzhou Industrail Park" <c:if test="${location eq 'Suzhou Industrail Park' }"> selected="selected"</c:if>>Suzhou Industrail Park</option>
								<option value="Suzhou New District" <c:if test="${location eq 'Suzhou New District' }"> selected="selected"</c:if>>Suzhou New District</option>
								<option value="Suzhou Downtown" <c:if test="${location eq 'Suzhou Downtown' }"> selected="selected"</c:if>>Suzhou Downtown</option>
								<option value="WuXi City" <c:if test="${location eq 'WuXi City' }"> selected="selected"</c:if>>WuXi City</option>
							</select>
						</div>
			        </div>
			        
			        
					<div class="form-inline" style="margin-top: 70px;">
						
						<label class="checkbox-inline span2">
						  Bedrooms
						</label>
						<label class="checkbox-inline">
						  <input type="radio" id="inlineCheckbox1" name="bedrooms" value="all" style="width:45px;" checked="checked"> All
						</label>
						
						<c:forEach var="x" begin="1" end="8" step="1">
						     <label class="checkbox-inline">
							  <input type="radio" id="inlineCheckbox1" name="bedrooms" value="${x}" style="width:45px;" <c:if test="${ bedrooms != 'all' && bedrooms == x }">checked="checked"</c:if>> ${x}
							</label>
						</c:forEach>
					</div>
			        <div class="form-inline" style="margin-top: 20px;">
						<div class="span6">
							<span class="span3">Rental(&yen;/M)</span>
							<div class="span8"><div id="rental-slider" ></div></div>
						</div>
						<div class="span6">
							<span class="span4">Size(sqm)</span>
							<div class="span8"><div id="area-slider" ></div></div>
						</div>
			        </div>
					<div class="form-inline" >
						<div class="span6">
							<div class="span3"></div>
							<span class="span1">Min</span>
							<div class="span3"><input type="text" name="min-rental" id="min-rental" style="width:42px" value="${minRental}"/></div>
							<span class="span1">Max</span>
							<div class="span4"><input type="text" name="max-rental" id="max-rental" style="width:42px" value="${maxRental}"/></div>
						</div>
						<div class="span6">
							<div class="span4"></div>
							<span class="span1">Min</span>
							<div class="span3"><input type="text" name="min-area" id="min-area" style="width:30px" value="${minArea}"/></div>
							<span class="span1">Max</span>
							<div class="span3"><input type="text" name="max-area" id="max-area" style="width:30px" value="${maxArea}"/></div>
						</div>

			        </div>
			        <div class="form-inline" style="margin-top: 86px;">
			         <label class="control-label" for="keywords" class="span3">Keywords</label>
			         <input type="text" maxlength="200" value="" class="span6" name="keywords" id="keywords" />
			       <input type="submit" class="btn" id="" style="margin-left: 93px;" value="search" /> 
			            <!-- <a class="btn" id="search-btn" style="margin-left: 93px;" href="javascript:void(0)">search</a>-->
			       </div>
			       <input type="hidden" name="pn" id="pn" value="${curPage}"/>
			       <input type="hidden" name="startNum" id="startNum_id" value="${startNum ==null?1:startNum}"/>
			       <input type="hidden" name="endNum" id="endNum_id" value="${endNum==null?10:endNum}"/>
					<label style="margin-left: 63px;">enter keywords(eg:双龙大道)</label>
			    </form>
			</div>