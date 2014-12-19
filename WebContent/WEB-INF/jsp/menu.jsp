<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	
	<div class="row-fluid">
		
		<div>
			<div class="row-fluid">
				<div class="span10">
						<img alt="140x140" src="images/logo1.png" />
				</div>
				<div class="span2 language-box">
					<span><a href="?lang=zh">中文</a>|<a href="?lang=en">English</a></span>
			 	</div>
			</div>
			<div class="row-fluid" style="margin-top: 11px;">
					<div class="m-navBar">
					<ul class="m-nav clearfix" id="menu-sl">
						<li class="m">
						<h3><a href="/"><spring:message code="menu.home"/></a></h3>
						</li>
						<li class="s">|</li>
						<li class="m">
						<h3><a href="rentalist?tabs=aparent" title="<spring:message code="menu.swzl"/>"><spring:message code="menu.swzl"/></a></h3>
						<ul class="sub">
							<li><a href="rentalist?tabs=aparent" "><spring:message code="menu.apartment"/></a></li>
							<li><a href="rentalist?tabs=villa" ><spring:message code="menu.house"/></a></li>
							<li><a href="rentalist?tabs=obuilding" ><spring:message code="menu.office"/></a></li>
						</ul>
						</li>
						<li class="s">|</li>
						<li class="m">
						<h3><a href="#"><spring:message code="menu.ba"/></a></h3>
						<ul class="sub">
							<li><a href="#"><spring:message code="menu.va"/></a></li>
							<li><a href="#"><spring:message code="menu.apu"/></a></li>
							<li><a href="#" ><spring:message code="menu.hr"/></a></li>
							<li><a href="#"><spring:message code="menu.bt"/></a></li>
							
						</ul>
						</li>
						<li class="s">|</li>
						<li class="m">
						<h3><a  href="#"><spring:message code="menu.hlh"/></a></h3>
						<ul class="sub" style="display: none;">
							<li><a href="#"><spring:message code="menu.hm"/></a></li>
							<li><a href="#"><spring:message code="menu.hc"/></a></li>
							<li><a href="#"><spring:message code="menu.houser"/></a></li>
							<li><a href="#"><spring:message code="menu.hk"/></a></li>
							<li><a href="#"><spring:message code="menu.shop"/></a></li>
						</ul>
						</li>
						<li class="s">|</li>
						<li class="m">
							<h3><a  href="#"><spring:message code="menu.ac"/></a></h3>
							<ul class="sub" style="display: none;">
								<li><a href="activies"><spring:message code="menu.act"/></a></li>
								<li><a href="#"><spring:message code="menu.partners"/></a></li>
							</ul>
						</li>
						<li class="s">|</li>
						<li class="m">
						<h3><a href="${pageContext.request.contextPath}/aboutus?tabs=default"><spring:message code="menu.au"/></a></h3>
							<ul class="sub" style="display: none;">
							<li><a href="${pageContext.request.contextPath}/aboutus?tabs=copmpanyinfo"><spring:message code="menu.introduction"/></a></li>
							<li><a href="${pageContext.request.contextPath}/aboutus?tabs=jobs" ><spring:message code="menu.ri"/></a></li>
							<li><a href="#" ><spring:message code="menu.cu"/></a></li>
						</ul>
						</li>
						<li class="s">|</li>
						<li class="m">
						<h3><a href="#"><spring:message code="menu.feedback"/></a></h3>
							<ul class="sub" style="display: none;">
								<li><a href="commetsView"><spring:message code="menu.ads"/></a></li>
							</ul>
						</li>
						<li class="block" style="left: 2510px;"></li>
					</ul>
				</div>
			</div>
		
		</div>
	</div>