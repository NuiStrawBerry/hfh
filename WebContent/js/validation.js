/*
 * Compressed by JSA(www.xidea.org)
 */
// script.aculo.us builder.js v1.7.0, Fri Jan 19 19:16:36 CET 2007

// Copyright (c) 2005, 2006 Thomas Fuchs (http://script.aculo.us, http://mir.aculo.us)
//
// script.aculo.us is freely distributable under the terms of an MIT-style license.
// For details, see the script.aculo.us web site: http://script.aculo.us/

var Builder = {
  NODEMAP: {
    AREA: 'map',
    CAPTION: 'table',
    COL: 'table',
    COLGROUP: 'table',
    LEGEND: 'fieldset',
    OPTGROUP: 'select',
    OPTION: 'select',
    PARAM: 'object',
    TBODY: 'table',
    TD: 'table',
    TFOOT: 'table',
    TH: 'table',
    THEAD: 'table',
    TR: 'table'
  },
  // note: For Firefox < 1.5, OPTION and OPTGROUP tags are currently broken,
  //       due to a Firefox bug
  node: function(elementName) {
    elementName = elementName.toUpperCase();
    
    // try innerHTML approach
    var parentTag = this.NODEMAP[elementName] || 'div';
    var parentElement = document.createElement(parentTag);
    try { // prevent IE "feature": http://dev.rubyonrails.org/ticket/2707
      parentElement.innerHTML = "<" + elementName + "></" + elementName + ">";
    } catch(e) {}
    var element = parentElement.firstChild || null;
      
    // see if browser added wrapping tags
    if(element && (element.tagName.toUpperCase() != elementName))
      element = element.getElementsByTagName(elementName)[0];
    
    // fallback to createElement approach
    if(!element) element = document.createElement(elementName);
    
    // abort if nothing could be created
    if(!element) return;

    // attributes (or text)
    if(arguments[1])
      if(this._isStringOrNumber(arguments[1]) ||
        (arguments[1] instanceof Array)) {
          this._children(element, arguments[1]);
        } else {
          var attrs = this._attributes(arguments[1]);
          if(attrs.length) {
            try { // prevent IE "feature": http://dev.rubyonrails.org/ticket/2707
              parentElement.innerHTML = "<" +elementName + " " +
                attrs + "></" + elementName + ">";
            } catch(e) {}
            element = parentElement.firstChild || null;
            // workaround firefox 1.0.X bug
            if(!element) {
              element = document.createElement(elementName);
              for(attr in arguments[1]) 
                element[attr == 'class' ? 'className' : attr] = arguments[1][attr];
            }
            if(element.tagName.toUpperCase() != elementName)
              element = parentElement.getElementsByTagName(elementName)[0];
            }
        } 

    // text, or array of children
    if(arguments[2])
      this._children(element, arguments[2]);

     return element;
  },
  _text: function(text) {
     return document.createTextNode(text);
  },

  ATTR_MAP: {
    'className': 'class',
    'htmlFor': 'for'
  },

  _attributes: function(attributes) {
    var attrs = [];
    for(attribute in attributes)
      attrs.push((attribute in this.ATTR_MAP ? this.ATTR_MAP[attribute] : attribute) +
          '="' + attributes[attribute].toString().escapeHTML() + '"');
    return attrs.join(" ");
  },
  _children: function(element, children) {
    if(typeof children=='object') { // array can hold nodes and text
      children.flatten().each( function(e) {
        if(typeof e=='object')
          element.appendChild(e)
        else
          if(Builder._isStringOrNumber(e))
            element.appendChild(Builder._text(e));
      });
    } else
      if(Builder._isStringOrNumber(children)) 
         element.appendChild(Builder._text(children));
  },
  _isStringOrNumber: function(param) {
    return(typeof param=='string' || typeof param=='number');
  },
  build: function(html) {
    var element = this.node('div');
    $(element).update(html.strip());
    return element.down();
  },
  dump: function(scope) { 
    if(typeof scope != 'object' && typeof scope != 'function') scope = window; //global scope 
  
    var tags = ("A ABBR ACRONYM ADDRESS APPLET AREA B BASE BASEFONT BDO BIG BLOCKQUOTE BODY " +
      "BR BUTTON CAPTION CENTER CITE CODE COL COLGROUP DD DEL DFN DIR DIV DL DT EM FIELDSET " +
      "FONT FORM FRAME FRAMESET H1 H2 H3 H4 H5 H6 HEAD HR HTML I IFRAME IMG INPUT INS ISINDEX "+
      "KBD LABEL LEGEND LI LINK MAP MENU META NOFRAMES NOSCRIPT OBJECT OL OPTGROUP OPTION P "+
      "PARAM PRE Q S SAMP SCRIPT SELECT SMALL SPAN STRIKE STRONG STYLE SUB SUP TABLE TBODY TD "+
      "TEXTAREA TFOOT TH THEAD TITLE TR TT U UL VAR").split(/\s+/);
  
    tags.each( function(tag){ 
      scope[tag] = function() { 
        return Builder.node.apply(Builder, [tag].concat($A(arguments)));  
      } 
    });
  }
}

;
// Tooltip Object
var Tooltip = Class.create();
Tooltip.prototype = {
	initialize: function(el, options) {
		this.el = $(el);
		this.initialized = false;
		this.setOptions(options);
		
		// Event handlers
		this.showEvent = this.show.bindAsEventListener(this);
		this.hideEvent = this.hide.bindAsEventListener(this);
		this.updateEvent = this.update.bindAsEventListener(this);
		Event.observe(this.el, "mouseover", this.showEvent );
		Event.observe(this.el, "mouseout", this.hideEvent );
		
		// Removing title from DOM element to avoid showing it
		this.content = this.el.title;
		this.el.title = "";

		// If descendant elements has 'alt' attribute defined, clear it
		this.el.descendants().each(function(el){
			if(Element.readAttribute(el, 'alt'))
				el.alt = "";
		});
	},
	setOptions: function(options) {
		this.options = {
			backgroundColor: '#999', // Default background color
			borderColor: '#666', // Default border color
			textColor: '', // Default text color (use CSS value)
			textShadowColor: '', // Default text shadow color (use CSS value)
			maxWidth: 250,	// Default tooltip width
			align: "left", // Default align
			delay: 250, // Default delay before tooltip appears in ms
			mouseFollow: true, // Tooltips follows the mouse moving
			opacity: .75, // Default tooltips opacity
			appearDuration: .25, // Default appear duration in sec
			hideDuration: .25 // Default disappear duration in sec
		};
		Object.extend(this.options, options || {});
	},
	show: function(e) {
		this.xCord = Event.pointerX(e);
		this.yCord = Event.pointerY(e);
		if(!this.initialized)
			this.timeout = window.setTimeout(this.appear.bind(this), this.options.delay);
	},
	hide: function(e) {
		if(this.initialized) {
			//this.appearingFX.cancel();
			if(this.options.mouseFollow)
				Event.stopObserving(this.el, "mousemove", this.updateEvent);
			this.tooltip.hide();
			//new Effect.Fade(this.tooltip, {duration: this.options.hideDuration, afterFinish: function() { Element.remove(this.tooltip) }.bind(this) });
		}
		this._clearTimeout(this.timeout);
		
		this.initialized = false;
	},
	update: function(e){
		this.xCord = Event.pointerX(e);
		this.yCord = Event.pointerY(e);
		this.setup();
	},
	appear: function() {
		// Building tooltip container
		this.tooltip = Builder.node("div", {className: "tooltip", style: "display: none;" }, [
			Builder.node("div", {className:"xtop"}, [
				Builder.node("div", {className:"xb1", style:"background-color:" + this.options.borderColor + ";"}),
				Builder.node("div", {className:"xb2", style: "background-color:" + this.options.backgroundColor + "; border-color:" + this.options.borderColor + ";"}),
				Builder.node("div", {className:"xb3", style: "background-color:" + this.options.backgroundColor + "; border-color:" + this.options.borderColor + ";"}),
				Builder.node("div", {className:"xb4", style: "background-color:" + this.options.backgroundColor + "; border-color:" + this.options.borderColor + ";"})
			]),
			Builder.node("div", {className: "xboxcontent", style: "background-color:" + this.options.backgroundColor + 
				"; border-color:" + this.options.borderColor + 
				((this.options.textColor != '') ? "; color:" + this.options.textColor : "") + 
				((this.options.textShadowColor != '') ? "; text-shadow:2px 2px 0" + this.options.textShadowColor + ";" : "")}, this.content), 
			Builder.node("div", {className:"xbottom"}, [
				Builder.node("div", {className:"xb4", style: "background-color:" + this.options.backgroundColor + "; border-color:" + this.options.borderColor + ";"}),
				Builder.node("div", {className:"xb3", style: "background-color:" + this.options.backgroundColor + "; border-color:" + this.options.borderColor + ";"}),
				Builder.node("div", {className:"xb2", style: "background-color:" + this.options.backgroundColor + "; border-color:" + this.options.borderColor + ";"}),
				Builder.node("div", {className:"xb1", style:"background-color:" + this.options.borderColor + ";"})
			]),
		]);
		document.body.insertBefore(this.tooltip, document.body.childNodes[0]);
		
		Element.extend(this.tooltip); // IE needs element to be manually extended
		this.options.width = this.tooltip.getWidth();
		this.tooltip.style.width = this.options.width + 'px'; // IE7 needs width to be defined
		
		this.setup();
		
		if(this.options.mouseFollow)
			Event.observe(this.el, "mousemove", this.updateEvent);
			
		this.initialized = true;
		this.tooltip.show();
		//this.appearingFX = new Effect.Appear(this.tooltip, {duration: this.options.appearDuration, to: this.options.opacity });
	},
	setup: function(){
		// If content width is more then allowed max width, set width to max
		if(this.options.width > this.options.maxWidth) {
			this.options.width = this.options.maxWidth;
			this.tooltip.style.width = this.options.width + 'px';
		}
			
		// Tooltip doesn't fit the current document dimensions
		if(this.xCord + this.options.width >= Element.getWidth(document.body)) {
			this.options.align = "right";
			this.xCord = this.xCord - this.options.width + 20;
		}
		
		this.tooltip.style.left = this.xCord - 7 + "px";
		this.tooltip.style.top = this.yCord + 12 + "px";
	},
	stop: function () {
		this.hide();
		Event.stopObserving(this.el, "mouseover", this.showEvent);
		Event.stopObserving(this.el, "mouseout", this.hideEvent);
		Event.stopObserving(this.el, "mousemove", this.updateEvent);
	},
	_clearTimeout: function(timer) {
		clearTimeout(timer);
		clearInterval(timer);
		return null;
	}
};
;
/**
 * modified by badqiu (badqiu(a)gmail.com)
 * blog: http://badqiu.javaeye.com
 * Project Home: http://code.google.com/p/rapid-validation/
 * Rapid Framework Project Home: http://code.google.com/p/rapid-framework/
 * Version 1.0.0
 */

/*
 * Really easy field validation with Prototype
 * http://tetlaw.id.au/view/blog/really-easy-field-validation-with-prototype
 * Andrew Tetlaw
 * Version 1.5.3 (2006-07-15)
 * 
 * Copyright (c) 2006 Andrew Tetlaw
 * http://www.opensource.org/licenses/mit-license.php
 */

var ValidationDefaultOptions = function(){};
ValidationDefaultOptions.prototype = {
	onSubmit : true, //是否监听form的submit事件
	stopOnFirst : false, //表单验证时停留在第一个验证的地方,不继续验证下去
	immediate : false, //是否实时检查数据的合法性
	focusOnError : true, //是否出错时将光标指针移到出错的输入框上
	useTitles : false, //是否使用input的title属性作为出错时的提示信息
	onFormValidate : function(result, form) {},//Form验证时的回调函数
	onElementValidate : function(result, elm) {} //某个input验证时的回调函数
}

var ValidatorDefaultOptions = function(){}
ValidatorDefaultOptions.prototype = {
	ignoreEmptyValue : true, //是否忽略空值
	depends : [] //相关依赖项
}
 
Validator = Class.create();

Validator.messageSource = {};
Validator.messageSource['en-us'] = [
	['validation-failed' , 'Validation failed.'],
	['required' , 'This is a required field.'],
	['validate-number' , 'Please enter a valid number in this field.'],
	['validate-digits' , 'Please use numbers only in this field. please avoid spaces or other characters such as dots or commas.'],
	['validate-alpha' , 'Please use letters only (a-z) in this field.'],
	['validate-alphanum' , 'Please use only letters (a-z) or numbers (0-9) only in this field. No spaces or other characters are allowed.'],
	['validate-email' , 'Please enter a valid email address. For example fred@domain.com .'],
	['validate-url' , 'Please enter a valid URL.'],
	['validate-currency-dollar' , 'Please enter a valid $ amount. For example $100.00 .'],
	['validate-one-required' , 'Please select one of the above options.'],
	['validate-integer' , 'Please enter a valid integer in this field'],
	['validate-pattern' , 'Validation failed.'],
	['validate-ip','Please enter a valid IP address'],
	['min-value' , 'min value is %s.'],
	['max-value' , 'max value is %s.'],
	['min-length' , 'min length is %s,current length is %s.'],
	['max-length' , 'max length is %s,current length is %s.'],
	['int-range' , 'Please enter integer value between %s and %s'],
	['float-range' , 'Please enter number between %s and %s'],
	['length-range' , 'Please enter value length between %s and %s,current length is %s'],
	['equals','Conflicting with above value.'],
	['less-than','Input value must be less than above value.'],
	['less-than-equal','Input value must be less than or equal above value.'],
	['great-than','Input value must be great than above value.'],
	['great-than-equal','Input value must be great than or equal above value.'],
	['validate-date' , 'Please use this date format: %s. For example %s.'],
	['validate-selection' , 'Please make a selection.'],
	['validate-file' , function(v,elm,args,metadata) {
		return ValidationUtils.format("Please enter file type in [%s]",[args.join(',')]);
	}],
	//中国特有的相关验证提示信息
	['validate-id-number','Please enter a valid id number.'],
	['validate-chinese','Please enter chinese'],
	['validate-phone','Please enter a valid phone number,current length is %s.'],
	['validate-mobile-phone','Please enter a valid mobile phone,For example 13910001000.current length is %s.'],
	['validate-zip','Please enter a valid zip code.'],
	['validate-qq','Please enter a valid qq number']
]

Validator.messageSource['en'] = Validator.messageSource['en-us']

Validator.messageSource['zh-cn'] = [
	['validation-failed' , '验证失败.'],
	['required' , '请输入值.'],
	['validate-number' , '请输入有效的数字.'],
	['validate-digits' , '请输入数字.'],
	['validate-alpha' , '请输入英文字母.'],
	['validate-alphanum' , '请输入英文字母或是数字,其它字符是不允许的.'],
	['validate-email' , '请输入有效的邮件地址,如 username@example.com.'],
	['validate-url' , '请输入有效的URL地址.'],
	['validate-currency-dollar' , 'Please enter a valid $ amount. For example $100.00 .'],
	['validate-one-required' , '在前面选项至少选择一个.'],
	['validate-integer' , '请输入正确的整数'],
	['validate-pattern' , '输入的值不匹配'],
	['validate-ip','请输入正确的IP地址'],
	['min-value' , '最小值为%s'],
	['max-value' , '最大值为%s'],
	['min-length' , '最小长度为%s,当前长度为%s.'],
	['max-length', '最大长度为%s,当前长度为%s.'],
	['int-range' , '输入值应该为 %s 至 %s 的整数'],
	['float-range' , '输入值应该为 %s 至 %s 的数字'],
	['length-range' , '输入值的长度应该在 %s 至 %s 之间,当前长度为%s'],
	['equals','两次输入不一致,请重新输入'],
	['less-than','请输入小于前面的值'],
	['less-than-equal','请输入小于或等于前面的值'],
	['great-than','请输入大于前面的值'],
	['great-than-equal','请输入大于或等于前面的值'],
	['validate-date' , '请输入有效的日期,格式为 %s. 例如:%s.'],
	['validate-selection' , '请选择.'],
	['validate-file' , function(v,elm,args,metadata) {
		return ValidationUtils.format("文件类型应该为[%s]其中之一",[args.join(',')]);
	}],
	//中国特有的相关验证提示信息
	['validate-id-number','请输入合法的身份证号码'],
	['validate-chinese','请输入中文'],
	['validate-phone','请输入正确的电话号码,如:010-29392929,当前长度为%s.'],
	['validate-mobile-phone','请输入正确的手机号码,当前长度为%s.'],
	['validate-zip','请输入有效的邮政编码'],
	['validate-qq','请输入有效的QQ号码.']
]

ValidationUtils = {
	isVisible : function(elm) {
		while(elm && elm.tagName != 'BODY') {
			if(!$(elm).visible()) return false;
			elm = elm.parentNode;
		}
		return true;
	},
	getReferenceForm : function(elm) {
		while(elm && elm.tagName != 'BODY') {
			if(elm.tagName == 'FORM') return elm;
			elm = elm.parentNode;
		}
		return null;
	},
	getInputValue : function(elm) {
		var elm = $(elm);
		if(elm.type.toLowerCase() == 'file') {
			return elm.value;
		}else {
			return $F(elm);
		}
	},
	getElmID : function(elm) {
		return elm.id ? elm.id : elm.name;
	},
	format : function(str,args) {
		args = args || [];
		ValidationUtils.assert(args.constructor == Array,"ValidationUtils.format() arguement 'args' must is Array");
		var result = str
		for (var i = 0; i < args.length; i++){
			result = result.replace(/%s/, args[i]);	
		}
		return result;
	},
	// 通过classname传递的参数必须通过'-'分隔各个参数
	// 返回值包含一个参数singleArgument,例:validate-pattern-/[a-c]/gi,singleArgument值为/[a-c]/gi
	getArgumentsByClassName : function(prefix,className) {
		if(!className || !prefix)
			return [];
		var pattern = new RegExp(prefix+'-(\\S+)');
		var matchs = className.match(pattern);
		if(!matchs)
			return [];
		var results = [];
		results.singleArgument = matchs[1];
		var args =  matchs[1].split('-');
		for(var i = 0; i < args.length; i++) {
			if(args[i] == '') {
				if(i+1 < args.length) args[i+1] = '-'+args[i+1];
			}else{
				results.push(args[i]);
			}
		}
		return results;
	},
	assert : function(condition,message) {
		var errorMessage = message || ("assert failed error,condition="+condition);
		if (!condition) {
			alert(errorMessage);
			throw new Error(errorMessage);
		}else {
			return condition;
		}
	},
	isDate : function(v,dateFormat) {
		var MONTH = "MM";
	   	var DAY = "dd";
	   	var YEAR = "yyyy";
		var regex = '^'+dateFormat.replace(YEAR,'\\d{4}').replace(MONTH,'\\d{2}').replace(DAY,'\\d{2}')+'$';
		if(!new RegExp(regex).test(v)) return false;

		var year = v.substr(dateFormat.indexOf(YEAR),4);
		var month = v.substr(dateFormat.indexOf(MONTH),2);
		var day = v.substr(dateFormat.indexOf(DAY),2);
		
		var d = new Date(ValidationUtils.format('%s/%s/%s',[year,month,day]));
		return ( parseInt(month, 10) == (1+d.getMonth()) ) && 
					(parseInt(day, 10) == d.getDate()) && 
					(parseInt(year, 10) == d.getFullYear() );		
	},
	//document: http://ajaxcn.org/space/start/2006-05-15/2
	fireSubmit: function(form) {
	    var form = $(form);
	    if (form.fireEvent) { //for ie
	    	if(form.fireEvent('onsubmit'))
	    		form.submit();
	    } else if (document.createEvent) { // for dom level 2
			var evt = document.createEvent("HTMLEvents");
	      	//true for can bubble, true for cancelable
	      	evt.initEvent('submit', false, true); 
	      	form.dispatchEvent(evt);
	    }
 	},
 	getLanguage : function() {
 		var lang = null;
		if (typeof navigator.userLanguage == 'undefined')
			lang = navigator.language.toLowerCase();
		else
			lang = navigator.userLanguage.toLowerCase();
 		return lang;
 	},
 	getMessageSource : function() {
 		var lang = ValidationUtils.getLanguage();
 		var messageSource = Validator.messageSource['zh-cn'];
		if(Validator.messageSource[lang]) {
			messageSource = Validator.messageSource[lang];
		}
		return messageSource;
 	}
}

Validator.messages = {};
//init i18n messages
ValidationUtils.getMessageSource().each(function(ms){
	Validator.messages[ms[0]] = ms[1];
});

Validator.prototype = {
	initialize : function(className, test, options) {
		this.options = Object.extend(new ValidatorDefaultOptions(), options || {});
		this._test = test ? test : function(v,elm){ return true };
		this._error = Validator.messages[className] ? Validator.messages[className] : Validator.messages['validation-failed'];
		this.className = className;
		this._dependsTest = this._dependsTest.bind(this);
		this._getDependError = this._getDependError.bind(this);
	},
	_dependsTest : function(v,elm) {
		if(this.options.depends && this.options.depends.length > 0) {
			var dependsResult = $A(this.options.depends).all(function(depend){
				return Validation.get(depend).test(v,elm);
			});
			return dependsResult;
		}
		return true;
	},
	test : function(v, elm) {
		if(!this._dependsTest(v,elm))
			return false;
		if(!elm) elm = {}
		var isEmpty = (this.options.ignoreEmptyValue && ((v == null) || (v.length == 0)));
		return  isEmpty|| this._test(v,elm,ValidationUtils.getArgumentsByClassName(this.className,elm.className),this);
	},
	_getDependError : function(v,elm,useTitle) {
		var dependError = null;
		$A(this.options.depends).any(function(depend){
			var validation = Validation.get(depend);
			if(!validation.test(v,elm))  {
				dependError = validation.error(v,elm,useTitle)
				return true;
			}
			return false;
		});
		return dependError;
	}, 
	error : function(v,elm,useTitle) {
		var dependError = this._getDependError(v,elm,useTitle);
		if(dependError != null) return dependError;

		var args  = ValidationUtils.getArgumentsByClassName(this.className,elm.className);
		var error = this._error;
		if(typeof error == 'string') {
			if(v) args.push(v.length);
			error = ValidationUtils.format(this._error,args);
		}else if(typeof error == 'function') {
			error = error(v,elm,args,this);
		}else {
			alert('property "_error" must type of string or function');
		}
		if(!useTitle) useTitle = elm.className.indexOf('useTitle') >= 0;
        if (elm.getAttribute('eMsg'))
            elm.title = elm.getAttribute('eMsg');
		return useTitle ? ((elm && elm.title) ? elm.title : error) : error;
	}
}

var Validation = Class.create();

Validation.prototype = {
	initialize : function(form, options){
		this.options = Object.extend(new ValidationDefaultOptions(), options || {});
		this.form = $(form);
		this.form.validator = this;
		var formId =  ValidationUtils.getElmID($(form));
		Validation.validations[formId] = this;
		if(this.options.onSubmit) Event.observe(this.form,'submit',this.onSubmit.bind(this),false);
		if(this.options.immediate) {
			var useTitles = this.options.useTitles;
			var callback = this.options.onElementValidate;
			Form.getElements(this.form).each(function(input) { // Thanks Mike!
				Event.observe(input, 'blur', function(ev) { Validation.validateElement(Event.element(ev),{useTitle : useTitles, onElementValidate : callback}); });
			});
		}
	},
	onSubmit :  function(ev){
		if(!this.validate()) Event.stop(ev);
	},
	validate : function() {
		var result = false;
		var useTitles = this.options.useTitles;
		var callback = this.options.onElementValidate;
		if(this.options.stopOnFirst) {
			result = Form.getElements(this.form).all(function(elm) { return Validation.validateElement(elm,{useTitle : useTitles, onElementValidate : callback}); });
		} else {
			result = Form.getElements(this.form).collect(function(elm) { return Validation.validateElement(elm,{useTitle : useTitles, onElementValidate : callback}); }).all();
		}
		if(!result && this.options.focusOnError) {
			var first = Form.getElements(this.form).findAll(function(elm){return $(elm).hasClassName('validation-failed')}).first();
			if(first.select) first.select();
			first.focus();
		}
		this.options.onFormValidate(result, this.form);
		return result;
	},
	reset : function() {
		Form.getElements(this.form).each(Validation.reset);
	}
}

Object.extend(Validation, {
	validateElement : function(elm, options){
		options = Object.extend({
			useTitle : false,
			onElementValidate : function(result, elm) {}
		}, options || {});
		elm = $(elm);
		var cn = elm.classNames();
		return cn.all(function(value) {
			var test = Validation.test(value,elm,options.useTitle);
			options.onElementValidate(test, elm);
			return test;
		});
	},
	newErrorMsgAdvice : function(name,elm,errorMsg) {
		var advice = '<div class="validation-advice" id="advice-' + name + '-' + ValidationUtils.getElmID(elm) +'" style="display:none">' + errorMsg + '</div>'
		switch (elm.type.toLowerCase()) {
			case 'checkbox':
			case 'radio':
				var p = elm.parentNode;
				if(p) {
					new Insertion.Bottom(p, advice);
				} else {
					new Insertion.After(elm, advice);
				}
				break;
			default:
				new Insertion.After(elm, advice);
	    }
		advice = $('advice-' + name + '-' + ValidationUtils.getElmID(elm));
		return advice;
	},
	showErrorMsg : function(name,elm,errorMsg) {
		var elm = $(elm);
		if(typeof Tooltip != 'undefined') {
			if (!elm.tooltip) {
				elm.tooltip = new Tooltip(elm, {backgroundColor:"#FC9", borderColor:"#C96", textColor:"#000", textShadowColor:"#FFF"});
			}
			elm.tooltip.content = errorMsg;
		}else {
			var prop = Validation._getAdviceProp(name);
			var advice = Validation.getAdvice(name, elm);
			if(!elm[prop]) {
				if(!advice) {
					advice = Validation.newErrorMsgAdvice(name,elm,errorMsg);
				}
			}
			if(advice && !advice.visible()) {
				if(typeof Effect == 'undefined') {
					advice.style.display = 'block';
				} else {
					new Effect.Appear(advice, {duration : 1 });
				}			
			}
			advice.innerHTML = errorMsg;
			elm[prop] = true;
		}
		
		elm.removeClassName('validation-passed');
		elm.addClassName('validation-failed');
	},
	showErrorMsgByValidator : function(name,elm,useTitle) {
		Validation.showErrorMsg(name,elm,Validation.get(name).error(ValidationUtils.getInputValue(elm),elm,useTitle));
	},
	hideErrorMsg : function(name,elm) {
		var elm = $(elm);
		if(typeof Tooltip != 'undefined') {
			if (elm.tooltip) {
				elm.tooltip.stop();
				elm.tooltip = false;
			}
		}else {
			var prop = Validation._getAdviceProp(name);
			var advice = Validation.getAdvice(name, elm);
			if(advice && elm[prop]) {
				if(typeof Effect == 'undefined')
					advice.hide()
				else 
					new Effect.Fade(advice, {duration : 1 });
			}
			elm[prop] = false;
		}
		
		elm.removeClassName('validation-failed');
		elm.addClassName('validation-passed');
	},
	_getAdviceProp : function(validatorName) {
		return '__advice'+validatorName.camelize();
	},
	test : function(name, elm, useTitle) {
		var v = Validation.get(name);
		if(ValidationUtils.isVisible(elm) && !v.test(ValidationUtils.getInputValue(elm),elm)) {
			Validation.showErrorMsgByValidator(name,elm,useTitle);
			return false;
		} else {
			Validation.hideErrorMsg(name,elm);
			return true;
		}
	},
	getAdvice : function(name, elm) {
		return $('advice-' + name + '-' + ValidationUtils.getElmID(elm)) || $('advice-' + ValidationUtils.getElmID(elm));
	},
	reset : function(elm) {
		elm = $(elm);
		var cn = elm.classNames();
		cn.each(function(value) {
			var prop = Validation._getAdviceProp(value);
			if(elm[prop]) {
				var advice = Validation.getAdvice(value, elm);
				advice.hide();
				elm[prop] = '';
			}
			elm.removeClassName('validation-failed');
			elm.removeClassName('validation-passed');
		});
	},
	add : function(className, test, options) {
		var nv = {};
		var testFun = test;
		if(test instanceof RegExp)
			testFun = function(v,elm,args,metadata){ return test.test(v); }
		nv[className] = new Validator(className, testFun, options);
		Object.extend(Validation.methods, nv);
	},
	addAllThese : function(validators) {
		$A(validators).each(function(value) {
				Validation.add(value[0], value[1], (value.length > 2 ? value[2] : {}));
		});
	},
	get : function(name) {
		var resultMethodName;
		for(var methodName in Validation.methods) {
			if(name == methodName) {
				resultMethodName = methodName;
				break;
			}
			if(name.indexOf(methodName) >= 0) {
				resultMethodName = methodName;
			}
		}
		return Validation.methods[resultMethodName] ? Validation.methods[resultMethodName] : new Validator();
	},
	$ : function(formId) {
		return Validation.validations[formId];
	},
	methods : {},
	validations : {}
});

Validation.addAllThese([
	['required', function(v) {
				return !((v == null) || (v.length == 0) || /^[\s|\u3000]+$/.test(v));
			},{ignoreEmptyValue:false}],
	['validate-number', function(v) {
				return (!isNaN(v) && !/^\s+$/.test(v));
			}],
	['validate-digits', function(v) {
				return !/[^\d]/.test(v);
			}],
	['validate-alphanum', function(v) {
				return !/\W/.test(v)
			}],
	['validate-one-required', function (v,elm) {
				var p = elm.parentNode;
				var options = p.getElementsByTagName('INPUT');
				return $A(options).any(function(elm) {
					return $F(elm);
				});
			},{ignoreEmptyValue : false}],
			
	['validate-digits',/^[\d]+$/],		
	['validate-alphanum',/^[a-zA-Z0-9]+$/],		
	['validate-alpha',/^[a-zA-Z]+$/],
	['validate-email',/\w{1,}[@][\w\-]{1,}([.]([\w\-]{1,})){1,3}$/],
	['validate-url',/^(http|https|ftp):\/\/(([A-Z0-9][A-Z0-9_-]*)(\.[A-Z0-9][A-Z0-9_-]*)+)(:(\d+))?\/?/i],
	// [$]1[##][,###]+[.##]
	// [$]1###+[.##]
	// [$]0.##
	// [$].##
	['validate-currency-dollar',/^\$?\-?([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}\d*(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$/]
]);

//custom validate start

Validation.addAllThese([
	/**
	 * Usage : equals-$otherInputId
	 * Example : equals-username or equals-email etc..
	 */
	['equals', function(v,elm,args,metadata) {
				return $F(args[0]) == v;
			},{ignoreEmptyValue:false}],
	/**
	 * Usage : less-than-$otherInputId
	 */
	['less-than', function(v,elm,args,metadata) {
				if(Validation.get('validate-number').test(v) && Validation.get('validate-number').test($F(args[0])))
					return parseFloat(v) < parseFloat($F(args[0]));
				return v < $F(args[0]);
			}],
	/**
	 * Usage : less-than-equal-$otherInputId
	 */
	['less-than-equal', function(v,elm,args,metadata) {
				if(Validation.get('validate-number').test(v) && Validation.get('validate-number').test($F(args[0])))
					return parseFloat(v) <= parseFloat($F(args[0]));
				return v < $F(args[0]) || v == $F(args[0]);
			}],			
	/**
	 * Usage : great-than-$otherInputId
	 */
	['great-than', function(v,elm,args,metadata) {
				if(Validation.get('validate-number').test(v) && Validation.get('validate-number').test($F(args[0])))
					return parseFloat(v) > parseFloat($F(args[0]));
				return v > $F(args[0]);
			}],
	/**
	 * Usage : great-than-equal-$otherInputId
	 */
	['great-than-equal', function(v,elm,args,metadata) {
				if(Validation.get('validate-number').test(v) && Validation.get('validate-number').test($F(args[0])))
					return parseFloat(v) >= parseFloat($F(args[0]));
				return v > $F(args[0]) || v == $F(args[0]);
			}],			
	/*
	 * Usage: min-length-$number
	 * Example: min-length-10
	 */
	['min-length',function(v,elm,args,metadata) {
		return v.length >= parseInt(args[0]);
	}],
	/*
	 * Usage: max-length-$number
	 * Example: max-length-10
	 */
	['max-length',function(v,elm,args,metadata) {
		return v.length <= parseInt(args[0]);
	}],
	/*
	 * Usage: validate-file-$type1-$type2-$typeX
	 * Example: validate-file-png-jpg-jpeg
	 */
	['validate-file',function(v,elm,args,metadata) {
		return $A(args).any(function(extentionName) {
			return new RegExp('\\.'+extentionName+'$','i').test(v);
		});
	}],
	/*
	 * Usage: float-range-$minValue-$maxValue
	 * Example: -2.1 to 3 = float-range--2.1-3
	 */
	['float-range',function(v,elm,args,metadata) {
		return (parseFloat(v) >= parseFloat(args[0]) && parseFloat(v) <= parseFloat(args[1]))
	},{depends : ['validate-number']}],
	/*
	 * Usage: int-range-$minValue-$maxValue
	 * Example: -10 to 20 = int-range--10-20
	 */
	['int-range',function(v,elm,args,metadata) {
		return (parseInt(v) >= parseInt(args[0]) && parseInt(v) <= parseInt(args[1]))
	},{depends : ['validate-integer']}],
	/*
	 * Usage: length-range-$minLength-$maxLength
	 * Example: 10 to 20 = length-range-10-20
	 */
	['length-range',function(v,elm,args,metadata) {
		return (v.length >= parseInt(args[0]) && v.length <= parseInt(args[1]))
	}],
	/*
	 * Usage: max-value-$number
	 * Example: max-value-10
	 */
	['max-value',function(v,elm,args,metadata) {
		return parseFloat(v) <= parseFloat(args[0]);
	},{depends : ['validate-number']}],
	/*
	 * Usage: min-value-$number
	 * Example: min-value-10
	 */
	['min-value',function(v,elm,args,metadata) {
		return parseFloat(v) >= parseFloat(args[0]);
	},{depends : ['validate-number']}],
	/*
	 * Usage: validate-pattern-$RegExp
	 * Example: <input id='sex' class='validate-pattern-/^[fm]$/i'>
	 */
	['validate-pattern',function(v,elm,args,metadata) {
		return eval('('+args.singleArgument+'.test(v))');
	}],
	/*
	 * Usage: validate-ajax-$url
	 * Example: <input id='email' class='validate-ajax-http://localhost:8080/validate-email.jsp'>
	 */
	['validate-ajax',function(v,elm,args,metadata) {
		//var form = ValidationUtils.getReferenceForm(elm);
        var form = null;
		var params = (form ? Form.serialize(form) : Form.Element.serialize(elm));
		params += ValidationUtils.format("&what=%s&value=%s",[elm.name,encodeURIComponent(v)]);
		var request = new Ajax.Request(args.singleArgument,{
			parameters : params,
			asynchronous : false,
			method : "get"
		});
		
		var responseText = request.transport.responseText;
		if("" == responseText.strip()) return true;
		metadata._error = responseText;
        /*if($('loginMsg')){
            $('loginMsg').innerHTML = responseText;
            $('loginMsg').style.visibility='';
        }*/
		return false;
	}],
	/*
	 * Usage: validate-dwr-${service}.${method}
	 * Example: <input id='email' class='validate-dwr-service.method'>
	 */
	['validate-dwr',function(v,elm,args,metadata) {
		var result = false;
		var callback = function(methodResult) {
			if(methodResult) 
				metadata._error = methodResult;
			else 
				result = true;
		}
		var call = args.singleArgument+"('"+v+"',callback)";
		DWREngine.setAsync(false);
		eval(call);
		DWREngine.setAsync(true);
		return result;
	}],
	/*
	 * Usage: validate-buffalo-${service}.${method}
	 * Example: <input id='email' class='validate-buffalo-service.method'>
	 */
	['validate-buffalo',function(v,elm,args,metadata) {
		var result = false;
		var callback = function(reply) {
			if(replay.getResult()) 
				metadata._error = replay.getResult();
			else 
				result = true;
		}
		if(!BUFFALO_END_POINT) alert('not found "BUFFALO_END_POINT" variable');
		var buffalo = new Buffalo(BUFFALO_END_POINT,false);
		buffalo.remoteCall(args.singleArgument,v,callback);
		return result;
	}],
	/*
	 * Usage: validate-date-$dateFormat or validate-date($dateFormat default is yyyy-MM-dd)
	 * Example: validate-date-yyyy/MM/dd
	 */
	['validate-date', function(v,elm,args,metadata) {
			var dateFormat = args.singleArgument || 'yyyy-MM-dd';
			metadata._error = ValidationUtils.format(Validator.messages[metadata.className],[dateFormat,dateFormat.replace('yyyy','2006').replace('MM','03').replace('dd','12')]);
			return ValidationUtils.isDate(v,dateFormat);
		}],
	['validate-selection', function(v,elm,args,metadata) {
			return elm.options ? elm.selectedIndex > 0 : !((v == null) || (v.length == 0));
		}],	
	['validate-integer',/^[-+]?[1-9]\d*$|^0$/],
	['validate-ip',/^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/],
	
	//中国相关验证开始
	['validate-id-number',function(v,elm,args,metadata) {
		if(!(/^\d{17}(\d|x)$/i.test(v) || /^\d{15}$/i.test(v))) return false;
		var provinceCode = parseInt(v.substr(0,2));
		if((provinceCode < 11) || (provinceCode > 91)) return false;
		var forTestDate = v.length == 18 ? v : v.substr(0,6)+"19"+v.substr(6,15);
		var birthday = forTestDate.substr(6,8);
		if(!ValidationUtils.isDate(birthday,'yyyyMMdd')) return false;
		if(v.length == 18) {
			v = v.replace(/x$/i,"a");
			var verifyCode = 0;
			for(var i = 17;i >= 0;i--)   
            	verifyCode += (Math.pow(2,i) % 11) * parseInt(v.charAt(17 - i),11);
            if(verifyCode % 11 != 1) return false;
		}
		return true;
	}],
	['validate-chinese',/^[\u4e00-\u9fa5]+$/],
	['validate-phone',/^((0[1-9]{3})?(0[12][0-9])?[-])?\d{6,8}$/],
	['validate-mobile-phone',/(^0?[1][358][0-9]{9}$)/],
	['validate-zip',/^[1-9]\d{5}$/],
	['validate-qq',/^[1-9]\d{4,10}$/]
]);

/*
Validation.autoBind = function() {
	 var forms = document.getElementsByClassName('required-validate');
	 $A(forms).each(function(form){
		var validation = new Validation(form,{immediate:true,useTitles:true,stopOnFirst:true});
		Event.observe(form,'reset',function() {validation.reset();},false);
	 });
};

Event.observe(window,'load',Validation.autoBind,false);
*/
