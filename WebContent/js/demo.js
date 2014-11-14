$(function () {

   // Slider
   /* $('#slider').slider({
        range: true,
        values: [17, 67]
    });*/
	/**slider bar**/
	 $( "#bedrooms-slider" ).slider({
		range: true,
		min: 1,
		max: 6,
		values: [ 1, 6 ],
		slide: function( event, ui ) {
			$( "#min-bedrooms" ).val(ui.values[ 0 ]);
			$( "#max-bedrooms" ).val(ui.values[ 1 ]);

		}
		});
		$( "#min-bedrooms" ).val($( "#bedrooms-slider" ).slider( "values", 0 ));
		$( "#max-bedrooms" ).val($( "#bedrooms-slider" ).slider( "values", 1 ));

		
		var minA =  $( "#min-area" ),maxA=$( "#max-area"),minR=$( "#min-rental" ),maxR=$( "#max-rental" );
		// floorsize-slider
		var areaSlider = $( "#area-slider" ).slider({
		range: true,
			min: 50,
			max: 800,
			values: [ minA.val()===''?150:minA.val(), maxA.val()===''?700:maxA.val() ],
			slide: function( event, ui ) {
				$( "#min-area" ).val(ui.values[ 0 ]);
				$( "#max-area" ).val(ui.values[ 1 ]);
			}
		});
		
		// floorsize-slider
		var rentalSlider = $( "#rental-slider" ).slider({
			range: true,
			min: 1000,
			max: 50000,
			values: [ minR.val()===''?10000:minR.val(), maxR.val()===''?40000:maxR.val() ],
			slide: function( event, ui ) {
				$( "#min-rental" ).val(ui.values[ 0 ]);
				$( "#max-rental" ).val(ui.values[ 1 ]);
	
			}
		});
		
		if(minA.val()===''){
			minA.val(areaSlider.slider( "values", 0 ));
		}
		if(maxA.val()===''){
			maxA.val(areaSlider.slider( "values", 1 ));
		}
		
		if(minR.val()===''){
			minR.val(rentalSlider.slider( "values", 0 ));
		}
		if(maxR.val()===''){
			maxR.val(rentalSlider.slider( "values", 1 ));
		}

		// menu
		var ind=indexNum||0;
	    var nav = $(".m-nav");
	    var init = $(".m-nav .m").eq(ind);
	    var block = $(".m-nav .block");
	    block.css({
	        "left": init.position().left,
	        "width": 182
	    });
	    nav.hover(function() {},
	    function() {
	        block.stop().animate({
	            "left": init.position().left 
	        },
	        100);
	    });
	    $(".m-nav").slide({
	        type: "menu",
	        titCell: ".m",
	        targetCell: ".sub",
	        delayTime: 300,
	        triggerTime: 0,
	        returnDefault: true,
	        defaultIndex: ind,
	        startFun: function(i, c, s, tit) {
	            block.stop().animate({
	                "left": tit.eq(i).position().left 
	            },
	            100);
	        }
	    });

	    // slider pic 
    	
    	/*$("#search-btn").on('click',function(){
    		alert(123);
			$.ajax({
			  dataType: "json",
			  type:"post",
			  url: "search",
			  data: $("#searchForm").serialize(),
			  success:function(data){
				alert(123);
				console.log(data);
				//$('#houseInfolist7').append(tmpl("tmpl-demo", data.data));
			  }
			});
    	})*/
		
})