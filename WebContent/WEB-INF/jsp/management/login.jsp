<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<title>home from home</title>

	<!--- CSS --->
	<link href="css/login.css" rel="stylesheet" type="text/css" />
	</head>

	<body>
				
		<div class="login">
		    <div class="box png"> 
				<div class="logo png"></div>
				<div class="input">
				<form action="loginAction" method="post">
					<div class="log">
						<div class="name">
							<label>用户名</label>
							<input type="text" class="text" id="userName" placeholder="用户名" name="userName" tabindex="1">
						</div>
						<div class="pwd">
							<label>密　码</label>
							<input type="password" class="text" id="password" placeholder="密码" name="password" tabindex="2">
							<!--  <input type="button" class="submit" tabindex="3" value="登录">-->
							<input type="submit" class="submit" name="submit" value="登录" />
							<div class="check"></div>
						</div>
						<div class="tip"></div>
					</div>
					</form>
				</div>
			</div>
		    <div class="air-balloon ab-1 png"></div>
			<div class="air-balloon ab-2 png"></div>
		    <div class="footer"></div>
		</div>
		
	<!--	<script type="text/javascript" src="js/jquery.min.js"></script>
	 	<script type="text/javascript" src="js/fun.base.js"></script>
		<script type="text/javascript" src="js/script.js"></script> -->

	</body>
</html>
