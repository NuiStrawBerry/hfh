<!DOCTYPE html>
<html lang="zh-CN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp" />

<link href="css/home-style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
.about-us-description{
	font-family: "Helvetica","Microsoft Yahei";
	font-size: 18px;
	line-height: 40px;
}
	.commets-box{
		margin-top: 20px;
		border-bottom: 1px dashed #cccccc;
		line-height: 30px;
	}

	.comments-cuser-info{
		margin-top: 2px;
		margin-left:auto;
		margin-right:2px;
		width:200px;
	}
	.comments-form{
		margin-top: 32px;
	}
</style>
<body>
  <!--[if lt IE 9]>
  <link rel="stylesheet" type="text/css" href="css/custom-theme/jquery.ui.1.9.2.ie.css"/>
  <![endif]-->
<div class="container-fluid" style="width:1170px;margin:0 auto;">
<script type="text/javascript">
	var indexNum=5;
	

</script>
	<!--menu-->
	<jsp:include page="menu.jsp" ></jsp:include>
	<div class="row-fluid clearfix">
		<div id="comments_list_id">
			<div>no comments</div>

			<div class="commets-box">
				<div> 掌握（实用的）编程语言往往分为两大块，语言本身和周边类库／框架，这两块相辅相成缺一不可

就语言本身来说，最重要的是理解这门语言的抽象机制／编程范式：早期的语言可能相对单纯，纯过程式，纯面向对象，而多数现代通用语言往往是多范式的，往往即支持面向对象又支持面向过程，还有或多或少的函数式，这种混合的比例和风格决定了整门语言的风格。有的语言会有一些“核心概念”，拿掉以后会直接洞穿整个根基的重要概念／机制（比如JS的原型，Java的接口，C的指针），那么抓住这些核心概念突破是个好主意；而另一些语言可能没有这样明显的核心，这类语言往往混合多种其他语言的特色，那么可以通过他借鉴了哪些特性，做了哪些调整，又没有借鉴哪些特性来入手。重要的是“味道”，写Java就要有Java味道（而不是试图用Java实现一个动态语言的子集），写JS就要有JS的味道（而不是试图搞接口，封装之类）。而有一些味道是所有语言共通追求的比如可读可维护（恕我排除了brainfuck……），这也可以成为突破口（比如这门语言的哪些特性增强了可读性？）

另外一块就是周边类库包括工具集了，我经常用学英文打比方，前面那块可能对应语法，而类库就相当于词汇了，这门语言的主要应用场景在哪里，在这些场景下有哪些内置或开源的类库可以用，不同类库之间的优缺点如何，怎么选择合适的类库，怎么让几个不同的类库在一起融洽地工作。什么样的代码适合抽离成类库，自己写类库的时候要注意什么。这门语言有哪些常见的辅助工具。

我觉得学好一门语言的主要标志就是它从你的思考中消失了，你发现你考虑如何写代码的时候的思维过程和这门具体的语言没有关系，“怎么用XX实现YY”之类的问题从来没有出现，更没有打断你的思路</div>
				<div class="comments-cuser-info" style=""><p>zhang san </p><p>3014-20-30</p></div>

			</div>
			<div class="commets-box">
				<div> zhende he bucuo</div>
				<div class="comments-cuser-info"><span>zhang san </span><br/><span>3014-20-30</span></div>

			</div>
			<div class="commets-box">
				<div> 掌握（实用的）编程语言往往分为两大块，语言本身和周边类库／框架，这两块相辅相成缺一不可

就语言本身来说，最重要的是理解这门语言的抽象机制／编程范式：早期的语言可能相对单纯，纯过程式，纯面向对象，而多数现代通用语言往往是多范式的，往往即支持面向对象又支持面向过程，还有或多或少的函数式，这种混合的比例和风格决定了整门语言的风格。有的语言会有一些“核心概念”，拿掉以后会直接洞穿整个根基的重要概念／机制（比如JS的原型，Java的接口，C的指针），那么抓住这些核心概念突破是个好主意；而另一些语言可能没有这样明显的核心，这类语言往往混合多种其他语言的特色，那么可以通过他借鉴了哪些特性，做了哪些调整，又没有借鉴哪些特性来入手。重要的是“味道”，写Java就要有Java味道（而不是试图用Java实现一个动态语言的子集），写JS就要有JS的味道（而不是试图搞接口，封装之类）。而有一些味道是所有语言共通追求的比如可读可维护（恕我排除了brainfuck……），这也可以成为突破口（比如这门语言的哪些特性增强了可读性？）

另外一块就是周边类库包括工具集了，我经常用学英文打比方，前面那块可能对应语法，而类库就相当于词汇了，这门语言的主要应用场景在哪里，在这些场景下有哪些内置或开源的类库可以用，不同类库之间的优缺点如何，怎么选择合适的类库，怎么让几个不同的类库在一起融洽地工作。什么样的代码适合抽离成类库，自己写类库的时候要注意什么。这门语言有哪些常见的辅助工具。

我觉得学好一门语言的主要标志就是它从你的思考中消失了，你发现你考虑如何写代码的时候的思维过程和这门具体的语言没有关系，“怎么用XX实现YY”之类的问题从来没有出现，更没有打断你的思路</div>
				<div class="comments-cuser-info"><span>zhang san </span><span>3014-20-30</span></div>

			</div>
			<div class="commets-box">
				<div> zhende he bucuo</div>
				<div class="comments-cuser-info"><span>zhang san </span><span>3014-20-30</span></div>

			</div>
			<div class="commets-box">
				<div> zhende he bucuo</div>
				<div class="comments-cuser-info"><span>zhang san </span><span>3014-20-30</span></div>

			</div>
		</div>
		<div class="comments-form">
			<form action="/commitComments" method="post" id="ccommet_id">
				<textarea name="content" id="content_id" ></textarea>
				<input type="hidden" name="cuName" value="iiii"/>
				<%--<input type="submit" value="提交"/>--%>
				<button type="button" value="提交" class="btn" onclick="s()">提交</button>
			</form>
		</div>
	</div>
	<input type="hidden" id="tabs-id" value="${tabs}" />
	</div>
	

 <!--init for this page-->
		<script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
		<script type="text/javascript" src="js/SuperSlide.2.1.js"></script>
		<script type='text/javascript' src='js/jquery.browser.min.js'></script> 
		<script type='text/javascript' src='js/jquery.easing.1.3.js'></script> 
		 <script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
    	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.min.js"> </script>
    	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
		<script type="text/javascript" src="js/demo.js"></script>
		<jsp:include page="footer.jsp" />
</body>
 <script>
	
	$(document).ready(function(){
		$.ajax({
			dataType: "json",
			type:"post",
			url: "ccomments",
//			data: $("#ccommet_id").serialize(),
			success:function(data){
				console.log(data.length);
				var html = "no comments";
				if(data.length>0){
					html='';
					for(var i=0;i<data.length;i++){
						html +='<div class="commets-box"><div>'
						+data[i].content
						+'</div><div class="comments-cuser-info"><span>'+data[i].cusName
						+'</span><br/><span>'+data[i].date+'</span></div></div>';
					}

				}
				$("#comments_list_id").html(html);
//				not11();
			}
		});
		
		
	});
	 var s = function(){
		 $.ajax({
			 dataType: "json",
			 type:"post",
			 url: "commitComments",
			 data: $("#ccommet_id").serialize(),
			 success:function(data){
				 console.log(data);
				 $("#content_id").val("");
				 cleaer();
				 not11();
			 }
		 });
	 }
	 var ue2 = UE.getEditor('content_id',{
		 
	 });
	 var cleaer = function(){
		 ue2.execCommand('cleardoc');
	 }

	 var buildc = function(data){
		 var divone = $("<div>").addClass("").append($("<div>").html(data.cc));
		 var divtwo = $("<div>").addClass("").append($("<div>").html(data.cc));
	 }

  </script>
</html>
