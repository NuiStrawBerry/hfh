/*
 * jQuery File Upload Plugin JS Example 8.9.1
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2010, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */

/* global $, window */
/*

'<tr class="template-upload fade">'+
        '<td>'+
            '<span class="preview"></span>'+
       '</td>'+
        <td>'+
            <p class="name">{%=file.name%}</p>'+
            <strong class="error text-danger"></strong>'+
        </td>'+
        <td>'+
            <p class="size">Processing...</p>'+
            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
        </td>'+
        <td>'+
            {% if (!i && !o.options.autoUpload) { %}'+
                <button class="btn btn-primary start" disabled>'+
                    <i class="glyphicon glyphicon-upload"></i>'+
                    <span>Start</span>'+
                </button>'+
            {% } %}
            {% if (!i) { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>


*/
jQuery(function () {
    'use strict';

    // Initialize the jQuery File Upload widget:
    jQuery('#fileupload').fileupload(
      {  dataType: 'json',
    	 autoUpload: false,
    	 singleFileUploads: false,
	     done: function (e, data) {
	    	console.log('====done===',e,data.files);
	            $.each(data.result.files, function (index, file) {
	                $('<p/>').text(file.name).appendTo(document.body);
	            });
	        }/*,
	       add:function(e,data){
	        	if(data){
	        		var t='';
	        		 jQuery.each(data.originalFiles, function (index, file) {
		                console.log('====asd===',index,file);
		                t+=file.name;
		                t =t+'--';
		                //jQuery('#ttest').text(t)
		                jQuery('#ad').append(
	        				jQuery('</tr>').addClass('template-upload fade').append(
	        					jQuery('</td>').append(jQuery('</span>').addClass('preview')),
								jQuery('</td>').append(jQuery('</p>').addClass('name').text(file.name),jQuery('</strong>').addClass('error text-danger'))))
		            });
	        		   console.log('==================================================');
	        		 	 jQuery.each(data.files, function (index, file) {
		                console.log('====tttt===',index,file);
		            });
/*	        		var t=''
	        		for(var i=0;i<data.files.length;i++){
	        			var html='<tr class="template-upload fade">'+
				        '<td>'+
				            '<span class="preview"></span>'+
				       '</td>'+
				        '<td>'+
				            '<p class="name">'+data.files[i].name+'</p>'+
				            '<strong class="error text-danger"></strong>'+
				        '</td></tr>';
	        			t+=html;
	        			console.log('====t===',t);
	        			
	        		}
	        		//jQuery('#ad').html(t);
	        		
	        //	}
	        //	console.log('====add===',e,data);
	       } */
        // Uncomment the following to send cross-domain cookies:
        //xhrFields: {withCredentials: true},
       // url: 'server/php/'
    }).on('fileuploadadd', function (e, data) {
    	console.log('====add==ee=',e,data);
        data.context = jQuery('<div/>').appendTo('#files');
        jQuery('#ad').append(
			jQuery('</tr>').addClass('template-upload fade').append(
				jQuery('</td>').append(jQuery('</span>').addClass('preview')),
				jQuery('</td>').append(
					jQuery('</p>').addClass('name').text(data.files[0].name),
					jQuery('</strong>').addClass('error text-danger')),
				jQuery('</td>')	
			))
       /* jQuery.each(data.files, function (index, file) {
            var node = jQuery('<p/>')
                    .append(jQuery('<span/>').text(file.name));
            if (!index) {
                node
                    .append('<br>')
                    .append(uploadButton.clone(true).data(data));
            }
            node.appendTo(data.context);
        });*/
    });

    // Enable iframe cross-domain access via redirect option:
    jQuery('#fileupload').fileupload(
         'option',
         'redirect'
    );

    if (window.location.hostname === 'blueimp.github.io') {
        // Demo settings:
/*     	alert(123);
       jQuery('#fileupload').fileupload('option', {
            url: '//jquery-file-upload.appspot.com/',
             Enable image resizing, except for Android and Opera             which actually support image resizing, but fail t             send Blob objects via XHR requests            disableImageResize: /Android(?!.*Chrome)|Opera/
                .test(window.navigator.userAgent),
            maxFileSize: 5000000,
            acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i
        });
         Upload server status check for browsers with CORS support        if (jQuery.support.cors) {
            jQuery.ajax({
                url: '//jquery-file-upload.appspot.com/',
                type: 'HEAD'
            }).fail(function () {
                jQuery('<div class="alert alert-danger"/>')
                    .text('Upload server currently unavailable - ' +
                            new Date())
                    .appendTo('#fileupload');
            });
        }*/
    } else {
//    	alert(345);
//        // Load existing files:
//        jQuery('#fileupload').addClass('fileupload-processing');
//        jQuery.ajax({
//            // Uncomment the following to send cross-domain cookies:
//            //xhrFields: {withCredentials: true},
////            url: jQuery('#fileupload').fileupload('option', 'url'),
//            dataType: 'json',
//            context: jQuery('#fileupload')[0]
//        }).always(function () {
//            jQuery(this).removeClass('fileupload-processing');
//        }).done(function (result) {
//            jQuery(this).fileupload('option', 'done')
//                .call(this, jQuery.Event('done'), {result: result});
//        });
    }

});
