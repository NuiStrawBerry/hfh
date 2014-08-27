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
			var oTable = $('#houseInfoTable').dataTable({
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
		        "sAjaxSource": '../management/getHos', //请求的连接
		        "sServerMethod": "POST",
		        "sAjaxDataProp": "rows",// 返回的数据源的key
		        "bPaginate": true, //  是否分页
		        "bLengthChange": false, //能否改变页面显示记录条数的 控制
		        "iDisplayLength": 20,    //每页显示条数的
		        "bSort": false,    // set is default sort
			    "aoColumns": [
		            { "mData": "title" },
		            { "mData": "floorSize" },
		            { "mData": "rental" },
		            { "mData": "type" },
		            { "mData": "area" },
	             	{ "mData": "bedroom" },
	             	{ "mData": "location" },
	             	{"mData":"leaseStatus"},
	             	{"mData":"id"},
	             	{"mData":"createTime",
	             		"bVisible": false},
			    ],"aoColumnDefs": [{
		         	"aTargets": [ 3 ],
		          	"mData": "download_link",
		           	"mRender": function ( data, type, full ) {
		            	var t = data=='aparent'?"公寓":data=='obuilding'?'办公楼':'别墅';
		           		return t;
		         	}
			    },{
		         	"aTargets": [ 8 ],
		          	"mData": "download_link",
		           	"mRender": function ( data, type, full ) {
		           		var topV = full.isTopShow==0?1:0, hotV = full.isHot==0?1:0,defaultV = full.leaseStatus==0?1:0;
		           		var topT= full.isTopShow==0?"首页显示":"取消首页显示",hoT = full.isHot==0?"热门":"取消热门",defaulT = full.leaseStatus==0?"未出租":"已出租";
		            	return '<a href="roomInfoAddEdit?t=1&id='+data+'" class="btn btn-success">修改</a>'+
		            			'&nbsp;&nbsp;&nbsp;&nbsp;<a href="removeHouseInfo?hid='+data+'" class="btn  btn-danger">删除</a>'+
		            			'&nbsp;&nbsp;&nbsp;&nbsp;<span type="button" onclick="changeStatus(\''+data+'\',\'top\','+topV+')" class="btn  btn-danger" >'+topT+'</span>'+
		            			'&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="changeStatus(\''+data+'\',\'hot\','+hotV+')" class="btn  btn-danger">'+hoT+'</button>'+
		            			'&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="changeStatus(\''+data+'\',\'default\','+defaultV+')" class="btn  btn-danger">'+defaulT+'</button>';
		            	
		         	}
		     },{
		         	"aTargets": [ 9 ],
		          	"mData": "createTime",
		     }]/*,
			   "fnRowCallback": function( nRow, aData, iDisplayIndex ) {
	             Append the grade to the default row class name 
	           // $('td:eq(4)', nRow).c( '<b>A</b>' );
	           oTable1.$('tr').addClass('active');
	        	},
        	    "aoColumnDefs": [{
		         	"aTargets": [ 8 ],
		          	"mData": "download_link",
		           	"mRender": function ( data, type, full ) {
		            	return '<a href="'+data+'">Download</a>';
		         	}
		     },{
		         	"aTargets": [ 7 ],
		          	"mData": "check",
		           	"mRender": function ( data, type, full ) {
		           		console.log(data,type,full);
		            	return '<input type="checkbox" name="check2" value="'+full.alias+'">';
		         	}
		     }]*/

	    	});	
			});
		// hot top default
		var changeStatus = function(rid, p, value) {
			console.log(rid, p, value);
			$.ajax({
				type : "post",
				url : "changestatus",
				dataType: 'json',
				data : {
					'rId' : rid,
					'param' : p,
					'value' : value
				},
				statusCode: {
				    404: function() {
				        alert("fail");
				      }
			    },
				success : function(msg) {
					console.log('=====', msg, '删除成功');   
				if(msg.result=='success'){
					$('#'+id+'').empty();
					//$("#files-uTod").remove("#"+id);
					console.log('=====', msg, '删除成功');
				}
					//not1();
					//jQuery("#files-uTod").empty();
					//loadfiles(rid);

				},
				error : function(msg) {
					console.log('Data Saved failer:', '删除失败');
				}
			} 
			)

		};
	</script>

	<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="roominfo">信息列表</a></li>
		<li><a href="roomInfoAddEdit?t=0">添加信息</a></li>
	</ul>
	<div>
		<table id="houseInfoTable" class="table table-striped table-bordered table-hover">
			<thead>
				<th>标题</th>
				<th>楼层</th>
				<th>租金</th>
				<th>类型</th>
				<th>面积</th>
				<th>卧室数量</th>
				<th>地点</th>
				<th>状态</th>
				<th>操作</th>
			</thead>
			<tbody >
			</tbody>
		</table>
	</div>
</body>
</html>