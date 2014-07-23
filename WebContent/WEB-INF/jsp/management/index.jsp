<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Full Layout - jQuery EasyUI Demo</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="plugins/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css"
	href="plugins/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="demo.css">
<link rel="stylesheet" type="text/css" href="css/notify.css">
<link rel="stylesheet" href="js/upload/jquery.fileupload.css">
<script type="text/javascript" src="js/notifIt.js"></script>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="js/upload/vendor/jquery.ui.widget.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/globals.js"></script>
<script src="js/tmpl.min.js"></script>
<!-- tmpl -->
<script src="js/upload/jquery.fileupload.js"></script>

</head>

<body class="easyui-layout">
	<div data-options="region:'north',border:false"
		style="height: 60px; padding: 10px">
		<div class="navbar-inner">
			<div class="brand">JeeSite Admin</div>
			<div class="nav-collapse">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#"
					title="个人信息">您好, admin</a> <a href="/a/sys/user/info"
					target="mainFrame"><i class="icon-user"></i>&nbsp; 个人信息</a> <a
					href="/a/sys/user/modifyPwd" target="mainFrame"><i
					class="icon-lock"></i>&nbsp; 修改密码</a> <a href="/a/logout" title="退出登录">退出</a>
			</div>
			<!--/.nav-collapse -->
		</div>

	</div>
	<jsp:include page="menu.jsp"></jsp:include>

	<!--div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div -->
	<div data-options="region:'south',border:false"
		style="height: 50px; padding: 10px;">footer</div>
	<div data-options="region:'center',title:''">
		<!-- house info for rent -->
		<div id="houseInfoPanl" style="display: none;">
			<table id="house-datagrid" class="easyui-datagrid"
				title="DataGrid Complex Toolbar"></table>
			<div id="tb" style="padding: 5px; height: auto">
				<div style="margin-bottom: 5px">
					<a href="#" id='grid_btn_add' class="easyui-linkbutton"
						iconCls="icon-add" plain="true">添加</a> <a href="#"
						id='grid_btn_edit' class="easyui-linkbutton" iconCls="icon-edit"
						plain="true">编辑</a> <a href="#" id='grid_btn_upload'
						class="easyui-linkbutton" iconCls="icon-save" plain="true">上传</a>
					<a href="#" class="easyui-linkbutton" iconCls="icon-cut"
						plain="true">剪切</a> <a href="#" id="grid_btn_delete"
						class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
				</div>
				<div>
					Date From: <input class="easyui-datebox" style="width: 80px">
					To: <input class="easyui-datebox" style="width: 80px">
					Language: <select class="easyui-combobox" panelHeight="auto"
						style="width: 100px">
						<option value="java">Java</option>
						<option value="c">C</option>
						<option value="basic">Basic</option>
						<option value="perl">Perl</option>
						<option value="python">Python</option>
					</select> <a href="#" class="easyui-linkbutton" iconCls="icon-search">Search</a>
				</div>
			</div>


		</div>

		<!-- other things -->

	</div>

	<!-- 弹出窗口 -->
	<div id="popwindow"></div>
	<div id="uploadwin"></div>
	<div id="upload-pop"></div>
<!--  	<div id="up-dlg"></div>
	<div id="up-dlg" class="easyui-dialog1" style="display:none;">
	    <span class="btn btn-success fileinput-button">
	        <i class="glyphicon glyphicon-plus"></i>
	        <span>Add files...</span>
	        <input id="fileupload" type="file" name="files[]" multiple>
	    </span>
	    <div id="files" class="files"></div>
	    
	    <div id="files-add"></div>
	
		<div id="files-uTod">
		
	     </div>
	</div>
	<div id="bb">
		<a href="javascript:void(0)" class="btn" id="save_btn" >保存</a>
		<a href="javascript:void(0)" class="btn" id="cancel_btn">关闭</a>
	</div>-->
</body>
<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
	<div class="row" style="height:37px;" height="37px">
		<div class="span6">
			 <a href="#" title="asdasdasd" download="asdasda" >{%=file.oriname%}</a>
		</div>	
		<div class="span3">
			<button class="btn btn-danger delete" onclick="deletef('{%=file.wid%}','{%=file.roominfoid%}','{%=file.changename%}')">
                    <i class="glyphicon glyphicon-trash"></i>
                    <span>Delete</span>
    		</button>
		</div>
	</div>
 	
{% } %}
</script>
<script type="text/javascript">
	(function() {

		console.log(Global);

	/*	jQuery('#save_btn').on('click', function() {
		});*/
		console.log(123);
	})();
	var tempFiles;
	var rowId = '', rIndex = '';
	var createinfoTavle = function() {
		var html = '';
		jQuery('#house-datagrid').datagrid({
			rownumbers : true,
			singleSelect : true,
			url : '../management/getHos',//'js/datagrid_data1.json',
			method : 'get',
			toolbar : '#tb',
			columns : [ [ {
				field : 'title',
				title : '标题',
				width : 300
			}, {
				field : 'floorSize',
				title : '楼层',
				width : 60
			}, {
				field : 'rental',
				title : '租金',
				width : 80,
				align : 'right'
			}, {
				field : 'type',
				title : '类型',
				width : 40,
				align : 'right'
			}, {
				field : 'area',
				title : '面积',
				width : 60,
				align : 'right'
			}, {
				field : 'bedroom',
				title : '卧室数量',
				width : 60,
				align : 'center'
			}, {
				field : 'location',
				title : '地点',
				width : 150,
				align : ''
			}, {
				field : 'leaseStatus',
				title : '状态',
				width : 60,
				align : 'center'
			}, ] ],
			pagination : true,
			onClickRow : function(rowIndex, rowData) {
				//rowId=[];
				//rowId.push(rowIndex);
				rIndex = rowIndex;
				rowId = rowData;
				console.log('====', rowIndex, rowData);
				console.log('====', rowId);
			}
		});

		jQuery('#tb a').on('click', function() {
			console.log(123155555555555511, this.id);
			switch (this.id) {
			case 'grid_btn_add':
				add();
				console.log('add', jQuery('#dlg'));
				break;
			case 'grid_btn_edit':
				houseInfoEdit();
				console.log(123111445);
				break;
			case 'grid_btn_delete':
				deleteHouseInfo();
				break;
			case 'grid_btn_upload':
				creatUploadpop();
				break;

			}
		});
	};

	var createDialog = function() {
		if (!jQuery('#dlg').length)
			jQuery('#popwindow').append(Global.LoadPanel('test'));
		console.log('a=====', jQuery('#dlg'));
		jQuery('#dlg').dialog({
			title : "Basic Dialog",
			autoOpen : false,
			width : 800,
			height : 750,
			buttons : jQuery('#bb').on('click', 'a', function() {
				console.log(this.id);
				switch (this.id) {
				case 'save_btn':
					jQuery.ajax({
						type : "POST",
						url : "addhouseinfo",
						data : jQuery('#addhouseform').serialize(),
						success : function(msg) {
							console.log("Data Saved success: " + msg.result);
							//getMessages();
						},
						error : function(msg) {
							console.log('Data Saved failer:', msg.result);
						}
					});
					jQuery('#dlg').dialog('close');

					break;
				case 'cancel_btn':
					jQuery('#dlg').dialog('close');
					break;
				}
			})
		});
	};

	var add = function() {

		createDialog();
		jQuery('#dlg').dialog('open');
	};

	var houseInfoEdit = function() {
		if (!rowId)
			alert('请选择要删除的行');
		createDialog();

		jQuery.ajax({
			type : "POST",
			url : "obtainHouseInfo",
			data : {
				"hid" : rowId.id
			},
			success : function(msg) {
				console.log("Data Saved success: " + msg.id);
				jQuery('#addhouseform').form('load', msg);
			},
			error : function(msg) {
				console.log('Data Saved failer:', msg.result);
			}
		});
		jQuery('#dlg').dialog('open');
	}

	//delete
	var deleteHouseInfo = function() {
		console.log("====");
		if (!rowId) {
			alert('请选择要删除的行');
			return;
		}

		jQuery('#house-datagrid').datagrid('deleteRow', rIndex);
		/* $.ajax({
		    type: "POST",
		    url: "removeHouseInfo",
		    data: {"hid":hid},
		    success:function(msg){
		        console.log( "Data Saved success: " + msg.result );
		        //TODO remove from table
		    },
		    error:function(msg){
		        console.log('Data Saved failer:',msg.result);
		    }
		});*/
	};
	var creatUploadpop = function(){
		if (!rowId) {
			jQuery.messager.alert('提示','请选择一条记录');
			return;
		}
		var box = jQuery("#upload-pop");
		var html = '<div id="up-dlg" class="easyui-dialog"><div  style="margin-left: 49px; margin-top: 41px;">'+
			
		    '<span class="btn btn-success fileinput-button">'+
		        '<i class="glyphicon glyphicon-plus"></i>'+
		        '<span>Add files...</span>'+
		        '<input id="fileupload" type="file" name="files[]" multiple>'+
		   ' </span>'+
		    '<div id="files" class="files"></div>'+
		    '<div id="files-add"></div>'+
			'<div id="files-uTod"  style="margin-top: 21px;"></div>'+
		    ' </div>'+
		'</div>'+
		'<div id="upbb">'+
			'<a href="javascript:void(0)" class="btn" id="save_btn" >保存</a>'+
			'<a href="javascript:void(0)" class="btn" id="cancel_btn">关闭</a>'+
		'</div>';
		box.html(html);
		loadfiles(rowId.id);
		
		jQuery('#fileupload').fileupload({
	        url: 'upload',
	        dataType: 'json',
	        type:'post',
	        formData:{'rId':rowId.id},
	        autoUpload: true,
	        maxFileSize: 5000000, // 5 MB
	        disableImageResize: /Android(?!.*Chrome)|Opera/
	            .test(window.navigator.userAgent),
	        previewMaxWidth: 100,
	        previewMaxHeight: 100,
	        previewCrop: true
	    }).on('fileuploadadd', function (e, data) {
	    	
	    }).on('fileuploadprocessalways', function (e, data) {
	    	
	    }).on('fileuploadprogressall', function (e, data) {
	    	console.log('==fileuploadprogressall===',e,data);
	        var progress = parseInt(data.loaded / data.total * 100, 10);
	        jQuery('#progress .progress-bar').css(
	            'width',
	            progress + '%'
	        );
	    }).on('fileuploaddone', function (e, data) {
	    	console.log('==fileuploaddone===',e,data);
	    	jQuery("#files-uTod").empty();
	    	loadfiles(rowId.id);
	        jQuery.each(data.result.files, function (index, file) {
	            if (file.url) {
	                var link = jQuery('<a>')
	                    .attr('target', '_blank')
	                    .prop('href', file.url);
	                jQuery(data.context.children()[index])
	                    .wrap(link);
	            } else if (file.error) {
	                var error = jQuery('<span class="text-danger"/>').text(file.error);
	                jQuery(data.context.children()[index])
	                    .append('<br>')
	                    .append(error);
	            }
	        });
	    }).on('fileuploadfail', function (e, data) {
	        jQuery.each(data.files, function (index, file) {
	            var error = jQuery('<span class="text-danger"/>').text('File upload failed.');
	            jQuery(data.context.children()[index])
	                .append('<br>')
	                .append(error);
	        });
	    }).prop('disabled', !jQuery.support.fileInput)
	        .parent().addClass(jQuery.support.fileInput ? undefined : 'disabled');
		jQuery('#up-dlg').dialog({
			title : "upload",
			autoOpen : false,
			width : 800,
			height : 600,
			//href:'upload',
			buttons : jQuery('#upbb').on('click', 'a', function() {
				switch (this.id) {
				case 'save_btn':
					jQuery('#up-dlg').dialog('destroy');
					box.empty();
					break;
				case 'cancel_btn':
					jQuery('#up-dlg').dialog('destroy');
					box.empty();
					break;
				}
			})
		});
		jQuery('#up-dlg').dialog('open');

	};
	
	var  testc = function(box){
		

	};

	/*var uploadf = function() {
		console.log("====", rowId);
		if (!rowId) {
			alert('请选择一条记录');
			return;
		}

		jQuery('#up-dlg').dialog({
			title : "upload",
			autoOpen : false,
			width : 800,
			height : 750,
			//href:'upload',
			buttons : jQuery('#bb').on('click', 'a', function() {
				console.log(this.id);
				switch (this.id) {
				case 'save_btn':
					jQuery.ajax({
						type : "POST",
						url : "saveFileInfo",
						data : {'rId':rowId,'fIds':fIds},
						success : function(msg) {
							alert(123123);
							console.log("Data Saved success: " + msg.result);
							//getMessages();
						},
						error : function(msg) {
							console.log('Data Saved failer:', msg.result);
						}
					});
					jQuery('#up-dlg').dialog('close');
					box.empty();
					break;
				case 'cancel_btn':
					jQuery('#up-dlg').dialog('close');
					box.empty();
					break;
				}
			})
		});
		
		jQuery('#up-dlg').dialog('open');
	};*/
	

	var loadfiles = function(rId) {
		jQuery.ajax({
			type : "post",
			url : "getFiles",
			data: { 'rId' : rId},
			success : function(msg) {
				console.log('=====', msg);
				jQuery("#files-uTod").empty();
				jQuery("#files-uTod").append(tmpl('template-download', msg));

				jQuery.each(msg.files, function(index, file) {
					var node = jQuery('<p/>').append(
							jQuery('<span/>').text(file.oriname));
					
				});
				console.log('=====', msg);
				jQuery.each(msg,function(i,o){
					tempFiles+=o.wid+',';
				});
				console.log('=====', tempFiles);
				tempFiles = msg;
				//$('#'+params.dom+'').append(tmpl('tmpl-homebox', msg.houseInfoList));
			},
			error : function(msg) {
				console.log('Data Saved failer:', msg.result);
			}
		});
	};
	
	var deletef = function(id, rid, cname) {
		console.log(id, rid);
		jQuery.ajax({
			type : "post",
			url : "removeFile",
			data : {
				rId : rid,
				id : id,
				cname : cname
			},
			success : function(msg) {
				console.log('=====', msg, '删除成功');
				not1();
				jQuery("#files-uTod").empty();
				loadfiles(rid);

			},
			error : function(msg) {
				console.log('Data Saved failer:', '删除失败');
			}
		})

	};
	/********************************* uplo***********begin***********************************d **/

	function not1() {
		notif({
			msg : "<b>Success:</b> In 5 seconds i'll be gone",
			type : "success"
		});
	}

	/************************************* upload  end***********************************/
</script>
</html>