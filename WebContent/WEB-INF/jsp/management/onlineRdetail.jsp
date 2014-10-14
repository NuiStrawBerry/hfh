<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
	<title>在线请求</title>
	<meta name="decorator" content="default"/>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
		
			
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="onlinerequest">信息列表</a></li>
		<li class="active"><a href="#">详细信息</a></li>
	</ul><br/>
	
		<table table table-striped>
			<tr>
				<td>姓名</td><td><c:out value="${orb.name}"/></td>
			</tr>
			<tr>
				<td>来源</td><td><c:out value="${orb.hearFrom}"/></td>
			</tr>
			<tr>
				<td>其他来源</td><td><c:out value="${orb.otherHearFrom}"/></td>
			</tr>
			<tr>
				<td>国籍</td><td><c:out value="${orb.nationality}"/></td>
			</tr>
			<tr>
				<td>公司</td><td><c:out value="${orb.company}"/></td>
			</tr>
			<tr>
				<td>地区</td><td><c:out value="${orb.position}"/></td>
			</tr>
			<tr>
				<td>email</td><td><c:out value="${orb.email}"/></td>
			</tr>
			<tr>
				<td>电话</td><td><c:out value="${orb.tel}"/></td>
			</tr>
			<tr>
				<td>传真</td><td><c:out value="${orb.fax}"/></td>
			</tr>
			<tr>
				<td>手机</td><td><c:out value="${orb.mobile}"/></td>
			</tr>
			<tr>
				<td>到达日期</td><td><c:out value="${orb.arrvalDate}"/></td>
			</tr>
			<tr>
				<td>搬入日期</td><td><c:out value="${orb.moveInDate}"/></td>
			</tr>
			<tr>
				<td>租金</td><td><c:out value="${orb.minRentalBudget}"/>—<c:out value="${orb.maxRentalBudget}"/></td>
			</tr>
			<tr>
				<td>租期</td><td><c:out value="${orb.leaseTerm}"/></td>
			</tr>
			<tr>
				<td>期望的位置</td><td><c:out value="${orb.preferLocation}"/></td>
			</tr>
			<tr>
				<td>期望的类型</td><td><c:out value="${orb.preferTypes}"/></td>
			</tr>
			<tr>
				<td>homeFurnished</td><td><c:out value="${orb.homeFurnished}"/></td>
			</tr>
			<tr>
				<td>是否有宠物</td><td><c:out value="${orb.hasPet}"/></td>
			</tr>
			<tr>
				<td>其他</td><td><c:out value="${orb.comments}"/></td>
			</tr>
		</table>
	
</body>
</html>