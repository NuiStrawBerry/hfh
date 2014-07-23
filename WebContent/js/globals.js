var Global={
	version : '5.1',	//gcloud version
	config  : {},		//system config
	cookies : {}		//cookies setting
};

/**
 * 加载面板，自动按模板加载
 * @param {} name 面板名称
 * @param {} tpl 模板名称（可省略）
 * @param {} callback 回调函数，若省略则同步加载并返回数据
 * @return {} 若无回调函数时返回加载数据
 */
Global.LoadPanel = function(name, tpl, callback){
	if(typeof tpl == 'function'){
		callback = tpl;
		tpl = null;
	}
	var template = tpl || Global.config.template || 'default';
	/* var filename = 'resource/' + template + '/panes/'
			+ (name.indexOf('.') == -1 ? name + '.html' : name);*/
	var filename = name.indexOf('.') == -1 ? name + '.html' : name;
	var html = '';
	jQuery.ajax({
		dataType: "html",
		url: filename,
		async: callback ? true : false,
		success: function(data){
			html = data;
			if(typeof callback == 'function') callback(name, data);
		},
		error: function(response){
			if(template != Global.config.defaultTemplate)
				Global.LoadPanel(name, Global.config.defaultTemplate, callback);
			else if(typeof callback == 'function') callback(name, '');
		}
	});
	return html;
}

Global.dialog = function(config,did,pid){
	var me = this;
	jQuery('#dlg').dialog({
			title:"Basic Dialog",
	        autoOpen: false,
	        width:800,
			height:750,
	        buttons: jQuery('#bb').on('click','a',function(){
	        	console.log(this.id);
	        	switch(this.id){
	        		case 'save_btn':
        					jQuery.ajax({
			                    type: "POST",
			                    url: "addhouseinfo",
			                    data: jQuery('#addhouseform').serialize(),
			                    success:function(msg){
								alert(123123);
								//onclick="jQuery('#dlg').dialog('open')"
			                        console.log( "Data Saved success: " + msg.result );
			                        //getMessages();
			                    },
			                    error:function(msg){
			                        console.log('Data Saved failer:',msg.result);
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
	
}