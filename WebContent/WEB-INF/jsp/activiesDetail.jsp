<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<div class="ac-header">
		<div class="ac-poster left">
			<a>
				<img id="poster_img" itemprop="image" src="/timgs/20140901153120_f805a164-31a9-11e4-b3ad-952efb376843.jpg" title="点击查看大图"/>
			</a>
		</div>
						<div class="ac-info right">
							<h4 itemprop="summary">{%=o.title%}</h4>
							<div class="event-detail">
								<span class="pl">时间:&nbsp;&nbsp;</span>11月27日 周四 19:00-21:00{%=o.activieTime%}
							</div>
							<div class="event-detail" itemprop="location" itemscope="" itemtype="http://data-vocabulary.org/Organization">
								<span class="pl">地点:&nbsp;</span>
								<span itemprop="address" itemscope="" itemtype="http://data-vocabulary.org/Address" class="micro-address">
									 <span itemprop="region" class="micro-address">南京&nbsp;</span>
									 <span itemprop="locality" class="micro-address">鼓楼区&nbsp;</span>
									 <span itemprop="street-address" class="micro-address">先锋书店</span>
								</span>
								<span itemprop="geo" itemscope="" itemtype="http://data-vocabulary.org/Geo" class="micro-address">
									<meta itemprop="latitude" content="32.050606">
									<meta itemprop="longitude" content="118.773415">
								</span>
							</div>
							<div class="event-detail">
								<span class="pl">费用:&nbsp;&nbsp;</span>免费
							</div>
							<div class="event-detail">
								<span class="pl">类型:&nbsp;&nbsp;</span><a href="http://www.douban.com/location/nanjing/events/future-salon" itemprop="eventType">讲座</a>
							</div>
							<div class="event-detail" itemscope="" itemtype="http://data-vocabulary.org/Organization">
	
								<span class="pl">主办方:</span>
								<a href="http://site.douban.com/bookshop/" target="_blank" itemprop="name">先锋书店</a>
							</div>
							<div class="interest-attend pl">
								<span class="num">76 </span><span>人感兴趣 &nbsp; </span><span class="num">16 </span><span>人参加</span>
							</div>
							<div id="event-act">
							    <a data-interest="wish" class="btn" href="/register?reason=visit" rel="nofollow"><span>我感兴趣</span></a>
							    <a data-interest="do" class="btn" href="/register?reason=visit" rel="nofollow"><span>我要参加</span></a>
					        </div>
						</div>
					

					</div>
					<div class="activies-body">
						<div class="mod" id="link-report">
						  <h2>活动详情</h2>
						    <div id="edesc_f" class="wr" style="">
						        碧山计划的过去、现在和未来
						<br>
						<br>
						<br>时间：2014年11月27日（周四）19:00
						<br>地点：先锋书店五台山店（广州路173号）
						<br>嘉宾：欧宁 刘昭吟
						<br>
							{%=o.content%}
						    </div>
						</div>
					</div>