	<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<div data-options="region:'west',split:true,title:'West'" style="width:150px;">
		 <div id="left-menu" class="easyui-accordion" data-options="">
			 <div title="系统管理" data-options="iconCls:'icon-ok'">
	           <ul class="nav nav-list">
					<li id="rentinfo"><a href="#"><i class="icon-heart icon-white"></i>&nbsp;内容发布</a></li>
					<li><a href="#"><i class="icon-comment"></i>&nbsp;评论管理</a></li>
					<li><a href="#"><i class="icon-glass"></i>&nbsp;公共留言</a></li>
					<li><a href="#"><i class="icon-folder-open"></i>&nbsp;文件管理</a></li>
				</ul>
	        </div>
	         <div title="信息发布" data-options="iconCls:'icon-ok'" >
	             <ul class="nav nav-list">
					<li class=""><a href="#"><i class="icon-heart icon-white"></i>&nbsp;内容发布</a></li>
					<li><a href="#"><i class="icon-comment"></i>&nbsp;评论管理</a></li>
					<li><a href="#"><i class="icon-glass"></i>&nbsp;公共留言</a></li>
					<li><a href="#"><i class="icon-folder-open"></i>&nbsp;文件管理</a></li>
				</ul>
	        </div>
	         <div title="权限分配" data-options="iconCls:'icon-ok'" >
	              <ul class="nav nav-list">
					<li class=""><a href="#"><i class="icon-heart icon-white"></i>&nbsp;内容发布</a></li>
					<li><a href="#"><i class="icon-comment"></i>&nbsp;评论管理</a></li>
					<li><a href="#"><i class="icon-glass"></i>&nbsp;公共留言</a></li>
					<li><a href="#"><i class="icon-folder-open"></i>&nbsp;文件管理</a></li>
				</ul>
	        </div>
	         <div title="字典管理" data-options="iconCls:'icon-ok'" >
               	<ul class="nav nav-list">
					<li class=""><a href="#"><i class="icon-heart icon-white"></i>&nbsp;内容发布</a></li>
					<li><a href="#"><i class="icon-comment"></i>&nbsp;评论管理</a></li>
					<li><a href="#"><i class="icon-glass"></i>&nbsp;公共留言</a></li>
					<li><a href="#"><i class="icon-folder-open"></i>&nbsp;文件管理</a></li>
				</ul>
	        </div>
	         <div title="About" data-options="iconCls:'icon-ok'" >
              	<ul class="nav nav-list">
					<li class=""><a href="#"><i class="icon-heart icon-white"></i>&nbsp;内容发布</a></li>
					<li><a href="#"><i class="icon-comment"></i>&nbsp;评论管理</a></li>
					<li><a href="#"><i class="icon-glass"></i>&nbsp;公共留言</a></li>
					<li><a href="#"><i class="icon-folder-open"></i>&nbsp;文件管理</a></li>
				</ul>
	        </div>
		 
		 </div>
	</div>
	
<script type="text/javascript">
	jQuery('#left-menu').accordion({
	   	 	border:false,
	   	 	fit:true
		});
   	jQuery('#left-menu').on('click','li',function(){
		console.log(this,jQuery('#left-menu li.active'),this.id);
		jQuery('#left-menu li').removeClass('active');
		
		switch(this.id){
			case 'rentinfo':
				createinfoTavle();
				jQuery('#houseInfoPanl').show();
				break;
			case '':
				jQuery('#houseInfoPanl').hide();
				break;
		
		}
		
		jQuery(this).addClass('active');
	})
    

</script>