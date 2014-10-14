<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Cache-Control" content="no-store"><meta http-equiv="Pragma" content="no-cache"><meta http-equiv="Expires" content="0">
	<meta name="author" content="jonasyang.lover@gmial.com"><meta http-equiv="X-UA-Compatible" content="IE=7,IE=9,IE=10">
	<meta name="decorator" content="default">
	<title>信息发布</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
	<!--[if lte IE 6]><link href="/jeesite_new/static/bootstrap/bsie/css/bootstrap-ie6.min.css" type="text/css" rel="stylesheet" />
	<script src="/jeesite_new/static/bootstrap/bsie/js/bootstrap-ie.min.js" type="text/javascript"></script><![endif]-->
	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]> <script src="/jeesite_new/static/common/html5.js"></script><![endif]-->
	

<style type="text/css">
	.dataTables_length {
		width: 40%;
		float: left;
	}
	
	.dataTables_filter {
		width: 50%;
		float: right;
		text-align: right;
	}
	
	.dataTables_info {
		width: 60%;
		float: left;
	}
	
	.dataTables_paginate {
		float: right;
		text-align: right;
	}
	


</style>
	<script type="text/javascript">
		$(document).ready(function() {
			var oTable = $('#emailedHTable').dataTable({
				'oLanguage':{
				    "sProcessing":   "处理中...",
				    "sLengthMenu":   "显示 _MENU_ 项结果",
				    "sZeroRecords":  "没有匹配结果",
				    "sInfo":         "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
				    "sInfoEmpty":    "显示第 0 至 0 项结果，共 0 项",
				    "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
				    "sInfoPostFix":  "",
				    "sSearch":       "搜索:",
				    "sUrl":          "",
				    "sEmptyTable":     "表中数据为空",
				    "sLoadingRecords": "载入中...",
				    "sInfoThousands":  ",",
				    "oPaginate": {
				        "sFirst":    "首页",
				        "sPrevious": "上页",
				        "sNext":     "下页",
				        "sLast":     "末页"
				    },
				    "oAria": {
				        "sSortAscending":  ": 以升序排列此列",
				        "sSortDescending": ": 以降序排列此列"
				    }
				},
		        "bJQueryUI": false,
		        "bAutoWidth": false,
		        "sPaginationType": "full_numbers",//"two_button", //分页的形式
		        "sDom": '<"H"fl>t<"F"ip>',
		        "sAjaxSource": '../management/emailAgentList', //请求的连接
		        "sServerMethod": "POST",
		        "sAjaxDataProp": "rows",// 返回的数据源的key
		        "bPaginate": true, //  是否分页
		        "bLengthChange": false, //能否改变页面显示记录条数的 控制
		        "iDisplayLength": 20,    //每页显示条数的
		        "bSort": false,    // set is default sort
			    "aoColumns": [
		            { "mData": "fullname" },
		            { "mData": "phone" },
		            { "mData": "email" },
	             	{"mData":"houseTitle"},
	             	{"mData":"sendTime"},
		            {"mData":"id"}
			    ],"aoColumnDefs": [{
		         	"aTargets": [ 0 ],
		           	"mRender": function ( data, type, full ) {
		           		return '<a href="onlieRDetial?id='+full.id+'" title="查看详细">'+data+'</a>';
		         	} 
			    }]
	    	});	
			oTable.on('click','td',function(){
				console.log(this);
				var sData = oTable.fnGetData( this );
				console.log(sData);
			   // alert( 'The cell clicked on had the value of '+sData );
			})
				oTable.$('td').click(function(){
					
				});
			});
	</script>

	<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="emailagent">信息列表</a></li>
	</ul>
	<div class="row-fluid">
		<div class="span8 left" >
			<table id="emailedHTable" class="table table-striped table-bordered table-hover">
				<thead>
					<th>姓名</th>
					<th>电话</th>
					<th>邮件</th>
					<th>房子</th>
					<th>发送时间</th>
					<th>操作</th>
				</thead>
				<tbody >
				</tbody>
			</table>
			
		</div>
		<div class="span4 right" style="border:1px">
			<div class="wall">房屋信息</div>
			<div>
				housetitle:
			</div>
		</div>
		
	</div>
	
</body>
</html>