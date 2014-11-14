<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	
	<div class="row-fluid">
		
		<div>
			<div class="row-fluid">
				<div class="span10">
						<img alt="140x140" src="images/logo2.png" />
				</div>
				<div class="span2 language-box">
					<span><a href="?lang=zh">中文</a>|<a href="?lang=en">English</a></span>
			 	</div>
			</div>
			<div class="row-fluid" style="margin-top: 11px;">
					<div class="m-navBar">
					<ul class="m-nav clearfix" id="menu-sl">
						<li class="m">
						<h3><a href="/hfh"><spring:message code="menu.home"/></a></h3>
						</li>
						<li class="s">|</li>
						<li class="m">
						<h3><a href="rentalist?tabs=aparent" title="涉外租赁">涉外租赁</a></h3>
						<ul class="sub">
							<li><a href="rentalist?tabs=aparent" title="高档公寓">高档公寓</a></li>
							<li><a href="rentalist?tabs=villa" title="别墅">别墅</a></li>
							<li><a href="rentalist?tabs=obuilding" title="写字楼">写字楼</a></li>
						</ul>
						</li>
						<li class="s">|</li>
						<li class="m">
						<h3><a href="#">商务陪同</a></h3>
						<ul class="sub">
							<li><a href="#" title="接送机">签证</a></li>
							<li><a href="#" title="接送机">接送机</a></li>
							<li><a href="#" title="酒店预订">酒店预订</a></li>
							<li><a href="#" title="商务出游">商务出游</a></li>
							
						</ul>
						</li>
						<li class="s">|</li>
						<li class="m">
						<h3><a  href="#">高级家政</a></h3>
						<ul class="sub" style="display: none;">
							<li><a href="#" title="合作商家">保姆</a></li>
							<li><a href="#" title="活动方式">房屋保洁维修</a></li>
							<li><a href="#" title="活动方式">高级管家</a></li>
							<li><a href="#" title="商务出游">shopping</a></li>
						</ul>
						</li>
						<li class="s">|</li>
						<li class="m">
						<h3><a  href="#">聚会活动</a></h3>
						<ul class="sub" style="display: none;">
						<li><a href="activies" title="活动方式">活       动</a></li>
							<li><a href="#" title="合作商家">合作商家</a></li>
							
						</ul>
						</li>
						<li class="s">|</li>
						<li class="m">
						<h3><a href="${pageContext.request.contextPath}/aboutus?tabs=default" title="关于我们">关于我们</a></h3>
							<ul class="sub" style="display: none;">
							<li><a href="${pageContext.request.contextPath}/aboutus?tabs=copmpanyinfo" title="公司介绍">公司介绍</a></li>
							<li><a href="${pageContext.request.contextPath}/aboutus?tabs=jobs" title="招聘">招聘</a></li>
							<li><a href="#" title="联系方式">联系方式</a></li>
							<li><a href="#" title="联系我们">联系我们</a></li>
						</ul>
						</li>
						<li class="s">|</li>
						<li class="m">
						<h3><a href="#" title="联系我们">反     馈</a></h3>
							<ul class="sub" style="display: none;">
								
								<li><a href="#" title="意见">意见</a></li>
								<li><a href="#" title="回执单">回执单</a></li>
							</ul>
						</li>
						<li class="block" style="left: 2510px;"></li>
					</ul>
				</div>
			</div>
		
		</div>
	</div>