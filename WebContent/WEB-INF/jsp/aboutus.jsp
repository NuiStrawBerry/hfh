<!DOCTYPE html>
<html lang="zh-CN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp" />

<link href="css/home-style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<style type="text/css">

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
		<img src="images/About-us-2.jpg" />
	<div class="row-fluid clearfix">
		
		<div id="left_nav_menu"class="span3 bs-docs-example" >
			<ul class="nav nav-list">
				<li class="nav-header">
					 <legend>关于我们</legend> 
				</li>
				<li id="copmpanyinfo" class="active">
					<a href="javascript:void(0)">公司介绍</a>
				</li>
				<li id="jobs">
					<a href="javascript:void(0)">招聘</a>
				</li>
				<li id="service">
					<a href="javascript:void(0)">特色核心服务</a>
				</li>
			</ul>
		</div>
		<div class="span9 bs-docs-example">
			<ul class="breadcrumb">
				<li>
					<a href="#">关于我们</a> <span class="divider">/</span>
				</li>
				
				<li id="subchild" class="active">
					公司介绍
				</li>
			</ul>
			<div id='company_descriptin_detial'>
				<p id='company_descriptin_detial'>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Established in2011, Suzhou Home from Home Real Estate Co. Ltd has expanded to be one of the most important and well-expected players in relocation service field. We are specialized in providing one-stop and packaged accommodation and housing service to a range of  customers both in corporates and individual expats. <br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;苏州鸿富行企业服务有限公司成立于2011年，现已经成为苏州涉外租赁市场最大，最专业的供应商之一。我们致力于为苏州园区的外企员工和来苏的外籍人士提供一站式、打包的住宿安家服务。<p/>
					 <br/>
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Our business includes: <span class="label label-important">Airport Picking Up</span>, <span class="label label-important">Hotel Reservation</span>, <span class="label label-important">Visa Application</span>, <span class="label label-important">House Leasing</span>, <span class="label label-important">Business Tour and Training</span>. With rich experience on Enterprise Services, we have build good relationships with Corporate Client, Such as Bosch, Philips, Stryke, Fairchild，ETC.  <br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我们的服务包括：<span class="label label-important">机场接机</span>，<span class="label label-important">酒店预订</span>，<span class="label label-important">签证办理</span>，<span class="label label-important">涉外租赁</span>，<span class="label label-important">商务旅游</span>以及<span class="label label-important">拓展培训</span>等一系列的企业服务。深耕企业市场，我们现在同苏州数十家大型公司建立了合作关系，其中就有博世汽车，飞利浦医疗，史塞克医疗，仙童半导体等世界知名500强企业。<br/>
		        </p>
		    </div>
			<div id='job_offers' style="display:none" >
			
			<div class="row">
				<div class="span12">
					<div class="accordion" id="accordion-476828">
						<div class="accordion-group">
							<div class="accordion-heading">
								 <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-476828" href="#accordion-element-109848"><h4>高端涉外租赁顾问 / 涉外房产经纪人(5人)</h4></a>
							</div>
							<div id="accordion-element-109848" class="accordion-body in collapse">
								<div class="accordion-inner">
						        	<p >
						        	<h3>高端涉外租赁顾问 / 涉外房产经纪人</h3>
					        		<ul>
						        		<li>工作地点：苏州-工业园区</li>
										<li>岗位安排：全职</li>
										<li>招聘人数：5</li>
					
										<li>关键词：涉外租赁 中介服务 房产租赁 房地产 咨询 英语 经纪人 销售 置业顾问</li>
									</ul>
									<h4>岗位职责(Responsibility)</h4>
									<ol>
										<li>1.良好的沟通技巧，掌握客户的需求,提供专业的咨询服务<br/>
											Good communication skills, and mastering the customer demands to provide professional consulting services
										</li>
										<li>2.与潜在租户（主要是外籍人士）沟通，了解他/她的搬迁/换房需求<br/>
											With potential tenants(mainly foreigners) communication, to understand his/her relocation/change rooms needs
										</li>
										<li>3.为客户匹配房源并制定完善的看房计划，确保房源符合客户需求并且为进行带看工作做准备<br/>
											Matching housing and making perfect inspection plan for the customer, ensure that houses in accordance with customer requirements and prepare for the take job
										</li>
										<li>4.向客户介绍房屋相关属性特征，以及周边商圈生活出行信息<br/>
											To introduce the house's related attributes to clients, and the information of the surrounding business circle life
										</li>
										<li>5.与客户、房东进行双向谈判，促成合同签订，收取租赁保证金及代理服务费，等等<br/>
											Two-way negotiations with customers and the landlord, contributed to signing the contract and charge of rental deposit and  agent service fee, and so on
										</li>
										<li>6.协助客户办理交房，入住手续，并在需要时向租户提供完善的售后协调服务<br/>
											Help customers deal with making a room, check in, and providing the perfect after-sales coordination services to the tenants 
										</li>
										<li>7.积极跟进每笔业务的进展及客户关系维护等后续工作<br/>
											Actively follow up the progress of each business and maintain the customer relationship,and other follow-up work
										</li>
										<li>8.完成必要的数据表以及客户反馈表<br/>
											To complete the necessary data tables, and customers feedback forms
										</li>
									</ol>
									<h4>任职要求（Requirements）</h4>
									<ol>
										<li>1.年龄23岁-30岁之间，大专及以上学历，户籍、专业、性别不限<br/>
											Age between 23 to 30 years old, junior college degree and above, There is no limit to the household registration, professional, or gender
										</li>
										<li>2.英文听说读写流利,能与外籍客户电话及面对面交流，会英文Email往来<br/>
											Fluent in English listening, speaking, reading and writing, can communicate with foreign customer through  telephone and face to face, and Email correspondence in English
										</li>
										<li>3.具备良好的沟通表达能力，能进行有效的交流与沟通，明白客户需求<br/>
											Have good communication ability, can do effective communication,and understand the needs of customers
										</li>
										<li>4.有亲和力，工作积极主动，乐观开朗<br/>
											Have affinity, proactive, optimistic and cheerful
										</li>
										<li>5.敏锐的洞察力，较强的抗压能力；勇于接受房产行业的压力和挑战<br/>
											The keen insight, strong compressive capacity; Have the courage to accept the housing industry of pressure and challenges
										</li>
										<li>6.要有团队协作意识，能够适应弹性工作制<br/>
											Have the team cooperation consciousness, can adapt to flexible working system 
										</li>
										<li>7.有相关租赁或置业经验者优先（公司提供新人系统培训）<br/>
											Lease or real estate related experience is preferred (company provides training to new staff)
										</li>
									</ol>
									<h4>职位优势(Position advantage)</h4>
									<ol>
										<li>1、办公环境舒适，园区商业写字楼<br/>
											Comfortable office environment,the commercial and office buildings in SIP
										</li>
										<li>2.无责任高底薪+高额提成，月薪可过万<br/>
											No responsibility high basic salary + high commission, Monthly salary can more than ten thousand 
										</li>
										<li>3.服务的客户群体为各行各业的成功人士，拓宽了自己职业圈<br/>
											Service customer base for the successful people in all walks of life, broaden  professional circles
										</li>
										<li>4.客户与业主均为高端人士，具有良好的涵养，文化素质高<br/>
											Customers and the owners are good self-restraint, high cultural quality
										</li>
										<li>5.公司提供充足的客户和房源<br/>
											The company provides adequate customers and houses
										</li>
										<li>6.对无相关本行业经验的优秀人员，公司提供相关培训<br/>
											To no relevant industry experience of excellent staff, the company provides related training 
										</li>
										<li>7.每一年有四次公平晋升的机会，凭自己的实力和业绩，让每一个不甘平庸的人找到自己理想的事业平台。	公司提供岗前业务培训，晋升培训，管理培训，理论与实践相结合。培训不止、成长不滞；<br/>
											Every year there are four equal opportunity of promotion, by our own power and performance, let each unwilling mediocre person to find your ideal career platform.<br/>
											Company provide broad space for promotion, management positions, as well as branch manager, are generated by the internal good staff promotion.
										</li>
									</ol>				
						        </p>
								</div>
							</div>
						</div>
						<div class="accordion-group">
							<div class="accordion-heading">
								 <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-476828" href="#accordion-element-marketing">
								 	<h4>市场渠道专员 / Marketing / 市场拓展专员 /市场拓展代表 /市场渠道代表 </h4>
								 </a>
							</div>
							<div id="accordion-element-marketing" class="accordion-body collapse">
								<div class="accordion-inner">
							        <p >
							        	<h3>市场渠道专员 / Marketing / 市场拓展专员 /市场拓展代表 /市场渠道代表</h3>
						        		<ul>
							        		<li>工作地点：苏州-工业园区</li>
											<li>岗位安排：全职</li>
											<li>招聘人数：5</li>
											<li>期望入司日期：2014年5月</li>
											<li>关键词：涉外租赁 中介服务 房产租赁 房地产 咨询 英语 经纪人 销售 置业顾问</li>
										</ul>
										<h4>岗位职责(Responsibility)</h4>
										<ol>
											<li>1.制订自我市场拓展的年度、季度、月度计划，并实现目标、计划<br/>
												Formulate annual, quarterly, and monthly self market development plan, and achieve the goal
											</li>
											<li>2.收集、分析市场信息，负责苏州外企市场的开发，主要是工业园区这一带的外企市场<br/>
												Collect and analysis market information, and  responsible for the development of suzhou foreign markets, mainly in SIP of foreign market
											</li>
											<li>3.负责辖区内客户资料的收集、整理，了解竞争对手并能对其进行分析<br/>
												Responsible for customer data collecting and sorting within respective jurisdictions,can understand competitors and analyze it
											</li>
											<li>4.负责辖区内潜在客户的评估、跟进及需求分析<br/>
												Responsible for the assessment of potential customers within respective jurisdictions, follow up and do the demands analysis
											</li>
											<li>5.联系企业相关负责人，了解企业中外籍员工的住房情况及需求，进行客户关系的拓展与维护<br/>
												Contact the relevant person in the enterprise, understand foreign employee housing situation and demands, the development and maintenance of customer relationships
											</li>
											<li>6.管理维护客户关系以及客户间的长期战略合作计划<br/>
												Manage customer relationship maintenance and customer long-term strategic cooperation plan 
											</li>
											<li>7.负责公司供应商系统的建立<br/>
												Responsible for the establishment of the company's supplier system
											</li>
											<li>8.公司业务及品牌的推广，包括安排机场接机、酒店预订、房屋租赁、签证办理、商务陪同等<br/>
												Company's business and brand promotion, including arrangement of airport pick up, hotel reservation, rental, visa processing, accompanied by business, etc
											</li>
											<li>9.负责公司产品的市场分析，以及后续公司各种服务的开发<br/>
												Responsible for market analysis of the company's products,and subsequent company for the development of a variety of services
											</li>
											<li>10.负责销售区域内销售活动的策划和执行，完成销售任务<br/>
												Responsible for the sales area’s sales activities planning and execution, complete the sales task
											</li>
										</ol>
										<h4>任职要求（Requirements）</h4>
										<ol>
											<li>1.年龄20岁-30岁之间，大专及以上学历，户籍、专业、性别不限<br/>
												Age between 20 to 30 years old, junior college degree and above, There is no limit to the household registration, professional, or gender
											</li>
											<li>2.年以上市场营销经验，具备一定的市场分析及判断能力<br/>
												Above 2 years of marketing experience, have a certain market analysis and judgment’s ability
											</li>
											<li>3.反应敏捷、表达能力强，具有亲和力以及良好的客户服务意识<br/>
												Reaction quick,expression ability is strong, have affinity and good customer service consciousness
											</li>
											<li>4.具有较强的沟通能力及交际技巧，能进行有效的交流与沟通，明白客户需求<br/>
												Have strong communication skills,able to effective communication, understand customer needs
											</li>
											<li>5.有责任心，有自己的做事原则，诚信为首<br/>
												A sense of responsibility, have own principle of doing things and have good faith
											</li>
											<li>6.具有团队协作精神<br/>
												Have team cooperation spirit
											</li>
											<li>7.渴望成功，愿意挑战自我，能接受房产行业的压力和挑战<br/>
												A desire for success, willing to challenge themselves, can accept the real estate industry pressure and challenge
											</li>
										</ol>
										<h4>职位优势(Position advantage)</h4>
										<ol>
											<li>1、办公环境舒适，园区商业写字楼<br/>
												Comfortable office environment,the commercial and office buildings in SIP
											</li>
											<li>2.无责任高底薪+高额提成，月薪可过万<br/>
												No responsibility high basic salary + high commission, Monthly salary can more than ten thousand 
											</li>
											<li>3.服务的客户群体为各行各业的成功人士，拓宽了自己职业圈<br/>
												Service customer base for the successful people in all walks of life, broaden  professional circles
											</li>
											<li>4.客户与业主均为高端人士，具有良好的涵养，文化素质高<br/>
												Customers and the owners are good self-restraint, high cultural quality
											</li>
											<li>5.公司定期提供相关培训<br/>
												Company can provide regular training
											</li>
											<li>6.每一年有四次公平晋升的机会，凭自己的实力和业绩，让每一个不甘平庸的人找到自己理想的事业平台。	公司提供岗前业务培训，晋升培训，管理培训，理论与实践相结合。培训不止、成长不滞；<br/>
												Every year there are four equal opportunity of promotion, by our own power and performance, let each unwilling mediocre person to find your ideal career platform.<br/>
												Company provide broad space for promotion, management positions, as well as branch manager, are generated by the internal good staff promotion.
											</li>
										</ol>				
							        </p>
								</div>
							</div>
						</div>
						<div class="accordion-group">
							<div class="accordion-heading">
								 <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-476828" href="#accordion-element-Inter"><h4>实习生/Inter&nbsp;&nbsp;(2人)</h4></a>
							</div>
							<div id="accordion-element-Inter" class="accordion-body collapse">
								<div class="accordion-inner">
							        <p >
							        	<h3>实习生/Inter</h3>
						        		<ul>
							        		<li>工作地点：苏州-工业园区</li>
											<li>岗位安排：全职</li>
											<li>招聘人数：2</li>
											<li>关键词：实习生 应届生 涉外租赁 中介服务 房产租赁 房地产 咨询 英语 助理 后勤 经纪人 置业顾问</li>
										</ul>
										<h4>岗位职责(Responsibility)</h4>
										<ol>
											<li>1.协助相关负责人收集市场信息，开拓房产资源，以及房客资源关系的维护与更新<br/>
												Assist the relevant person collecting market information,developing real estate resources,as well as the tenant resources relationship maintenance and update
											</li>
											<li>2.协助业务员负责客户的接待、咨询工作，为顾客提供置业咨询服务<br/>
												Assist the salesman responsible for customer reception,consulting,and provide customers with  real estate advisory services
											</li>
											<li>3.协助业务员详细了解客户的需求，做到信息的合理匹配<br/>
												Assist the salesman detailed understanding of customer needs and matching the information 
											</li>
											<li>4.协助业务员陪同客户实地看房，进行商务谈判，签订三方合同，促成房地产经纪买卖和租赁业务<br/>
												Assist the salesman checking houses accompanied by customers, business negotiations, signed the three parties contract and contribute to sales and leasing of real estate brokerage business
											</li>
											<li>5.协助业务员进行房屋租赁、买卖合同的签订<br/>
												Assist the salesman in house leasing, business contract signed
											</li>
											<li>6.协助相关负责人跟进房屋过户手续办理等服务工作<br/>
												Assist the relevant person following up the house transfer procedures and handle such as service work
											</li>
											<li>7.协助相关业务员负责公司产品的销售及推广<br/>
												Assist related salesman responsible for the sales and promotion of the company's products
											</li>
											<li>8.协助相关业务员负责销售区域内销售活动的策划和执行，完成销售任务<br/>
												Assist related salesman responsible for the sales area’s sales activities planning and execution, complete the sales task
											</li>
											<li>9.协助管理维护客户关系以及客户间的长期战略合作计划<br/>
												Assist to manage maintenance between customer relationship and customer long-term strategic cooperation plan
											</li>
										</ol>
										<h4>任职要求（Requirements）</h4>
										<ol>
											<li>1.女生优先，大专及以上学历，应届毕业生，能吃苦耐劳，每周出勤5天<br/>
												Girl's priority,junior college degree or above, fresh graduates, can bear hardships and stand hard work, attendance 5 days a week
											</li>
											<li>2.英语六级，听说读写流利,能与外籍客户电话及面对面交流，会英文Email往来<br/>
												CET 6,fluent in English listening, speaking, reading and writing, can communicate with foreign customer through  telephone and face to face, and Email correspondence in English
											</li>
											<li>3.口齿清楚，善于交际，具有较强的沟通能力及交际技巧，具有亲和力<br/>
												Articulate, good at communication, have strong communication skills and communication skills, with affinity
											</li>
											<li>4.有较强观察能力和应变能力，能够独立处理一些突发事件<br/>
												Strong ability of observation and strain capacity, can deal with some emergency independently
											</li>
											<li>5.做事认真踏实，为人正直诚恳，有高度的工作意识<br/>
												Work earnestly, honest, sincere, have a high sense of work
											</li>
											<li>6.具备一定的市场分析及判断能力，良好的客户服务意识<br/>
												Have a certain market analysis and judgment ability, good customer service consciousness
											</li>
											<li>7.工作积极主动，乐观开朗，有责任心，能承受较大的工作压力<br/>
												Proactive, optimistic, cheerful, has the sense of responsibility, can work under high pressure
											</li>
											<li>8.有良好的团队精神、沟通技巧、思维敏捷、有高度的工作热情<br/>
												Have a good team spirit, communication skills, the thought is agile, have a high work enthusiasm
											</li>
										</ol>
										<h4>职位优势(Position advantage)</h4>
										<ol>
											提供3-6个月的实习期，实习期工资1800元，实习期满表现优异者可转正，转正之后:<br/>
											Provide 3-6 months internship, internship salary of 1800 yuan, intern period excellent performers can be positive, after positive:
											<li>1、无责任底薪2500-3000+高额提成+绩效+奖金，综合工资5000以上<br/>
												No responsibility high basic salary of 2500-3000 + + high commission + performance bonus, salary above 5000
											</li>
											<li>2.福利：全勤奖、餐补、话补、绩效奖金等；额外福利： 售后提成、季度奖金、年终奖金<br/>
												Benefits: a perfect attendance and subsidized meals, phones, performance bonus, etc; Additional benefits: after sales commission, quarterly bonus, year-end bonus
											</li>
											<li>3.保险：五险一金 ，法定节假日及员工生日福利<br/>
												Insurance: five insurances, statutory holidays and employee birthday welfare
											</li>
											<li>4.每月有员工聚餐、K歌等活动，每年有2次旅游<br/>
												We have staff activities such as dinner and karaoke, travel 2 times every year
											</li>
											<li>5.完善的晋升制度，每年2-3次加薪机会<br/>
												Improve the system of promotion, 2 to 3 times a year for a raise
											</li>
											<li>6.对无相关本行业经验的优秀人员，公司提供相关培训<br/>
												To no relevant industry experience of excellent staff, the company provides related training 
											</li>
										</ol>
										<ol>
											<li><h5>晋升渠道：</h5>实习生 —见习置业顾问—置业顾问—高级置业顾问—业务主任—高级业务主任—店经理<br/>
												Promotion channels: intern---trainee property consultants---property consultants---senior real estate consultant--- business director---senior director of business---the store manager
											</li>
											<li>公司提供岗前业务培训，晋升培训，管理培训，理论与实践相结合。培训不止、成长不滞；公司为员工提供广阔的晋升空间，管理岗位以及分公司经理均由内部优秀员工提拔产生。<br/>
												Company offers pre-job training, promotion training, management training, combining theory with practice. Training more than, not sluggish growth;<br/>
												Company provide broad space for promotion, management positions, as well as branch manager, are generated by the internal good staff promotion.
											</li>
											<li></li>
											<li></li>
											<li></li>
											
										</ol>
							        </p>
								</div>
							</div>
						</div>
						<div class="accordion-group">
							<div class="accordion-heading">
								 <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-476828" href="#accordion-element-smanager"><h4>涉外高级销售经理/Foreign senior sales manager</h4></a>
							</div>
							<div id="accordion-element-smanager" class="accordion-body collapse">
								<div class="accordion-inner">
							        <p >
							        	<h3>涉外高级销售经理/Foreign senior sales manager</h3>
						        		<ul>
											<li>关键词：实习生 应届生 涉外租赁 中介服务 房产租赁 房地产 咨询 英语 助理 后勤 经纪人 置业顾问</li>
										</ul>
										<h4>岗位职责(Responsibility)</h4>
										<ol>
											<li>1.为高端外籍人士客户提供中高端公寓入住业务的全程服务<br/>
												Customers for high-end foreign nationals in the high-end service in the whole process of the apartment to stay in business
											</li>
											<li>2.维护现有外籍客户，并挖掘更深的业务需求<br/>
												Maintain existing foreign customers, and dig deeper business requirements
											</li>
											<li>3.参与合同的谈判与签订，负责收集市场和行业政策<br/>
												Involved in the contract negotiation and signing, responsible for collecting market and industry policy 
											</li>
											<li>4.负责业务跟进、客户关系维护等所需代办事宜的后续工作<br/>
												To follow up the business, customer relationship maintenance and the follow-up work
											</li>
											<li>5.定期对外籍客户档案进行分析、整理、维护客户数据库<br/>
												Regular analysis of foreign customer files, sorting, maintain customer database
											</li>
											<li>6.结合公司现有业务优势和行业优势，积极拓展公司产品的销售渠道<br/>
												Combined with the existing business advantages and industry advantages, actively expand the sales channels for the company's products
											</li>
											<li>7.制订公司销售部的工作计划并组织实施，负责公司涉外销售活动的策划和执行<br/>
												Formulate work plan for the company sales department and organize their implementation, responsible for the company's foreign sales activities planning and execution
											</li>
											<li>8.负责公司涉外工作人员的培养及公司员工在涉外租赁销售方面的培训<br/>
												Be responsible for the cultivation of the foreign workers and employees in foreign leasing sales training
											</li>
											<li>9.为公司业务人员开展涉外租赁业务的推广提供专业支持<br/>
												Business personnel to carry out foreign leasing business promotion for the company to provide professional support
											</li>
											<li>10.总经理交办的其他工作<br/>
												Other tasks assigned by the general manager
											</li>
										</ol>
										<h4>任职要求（Requirements）</h4>
										<ol>
											<li>1.年龄20岁-30岁之间，大专及以上学历，户籍、专业、性别不限<br/>
												Age between 20 to 30 years old, junior college degree and above, There is no limit to the household registration, professional, or gender
											</li>
											<li>2.英文听说读写流利,能与外籍客户电话及面对面交流，会英文Email往来<br/>
												Fluent in English listening, speaking, reading and writing, can communicate with foreign customer through  telephone and face to face, and Email correspondence in English
											</li>
											<li>3.2年以上涉外租赁营销经验，有较强的客户和市场分析、计划与执行能力<br/>
												More than 2 years the foreign leasing marketing experience, have the strong customer and market analysis, planning and implementation capacity
											</li>
											<li>4.表达能力强，具有亲和力以及良好的客户服务意识<br/>
												Strongly expression capability,have affinity and good customer service consciousness
											</li>
											<li>5.具有较强的沟通能力及交际技巧，能进行有效的交流与沟通，明白客户需求<br/>
												Have strong communication skills and communication skills, able to effective communication, understand customer needs
											</li>
											<li>6.渴望成功，愿意挑战自我，能接受房产行业的压力和挑战<br/>
												A desire for success, willing to challenge themselves, can accept the real estate industry pressure and challenge
											</li>
											<li>7.责任心强，具有良好的的团队管理和沟通能力<br/>
												A strong sense of responsibility, has the good team management and communication skills
											</li>
											<li>8.较强的文字功底、条理缜密的表达和良好的谈吐技巧<br/>
												Strong writing ability, the rigorous expression and good language skills
											</li>
											<li>8.为人踏实、勇敢、乐观向上，良好的素养，对工作和生活充满热情<br/>
												Be steadfast, brave, optimistic, good quality, is enthusiastic about his work and life
											</li>
										</ol>
										<h4>职位优势(Position advantage)</h4>
										<ol>
											<li>1、办公环境舒适，园区商业写字楼<br/>
											Comfortable office environment,the commercial and office buildings in SIP
											</li>
											<li>2.无责任高底薪+高额提成，月薪可过万<br/>
												No responsibility high basic salary + high commission, Monthly salary can more than ten thousand 
											</li>
											<li>3.服务的客户群体为各行各业的成功人士，拓宽了自己职业圈<br/>
												Service customer base for the successful people in all walks of life, broaden  professional circles
											</li>
											<li>4.客户与业主均为高端人士，具有良好的涵养，文化素质高<br/>
												Customers and the owners are good self-restraint, high cultural quality
											</li>
											<li>5.公司定期提供相关培训<br/>
												Company can provide regular training
											</li>
											<li>6.对无相关本行业经验的优秀人员，公司提供相关培训<br/>
												To no relevant industry experience of excellent staff, the company provides related training 
											</li>
											<li>7.每一年有四次公平晋升的机会，凭自己的实力和业绩，让每一个不甘平庸的人找到自己理想的事业平台。	公司提供岗前业务培训，晋升培训，管理培训，理论与实践相结合。培训不止、成长不滞；<br/>
												Every year there are four equal opportunity of promotion, by our own power and performance, let each unwilling mediocre person to find your ideal career platform.<br/>
												Company provide broad space for promotion, management positions, as well as branch manager, are generated by the internal good staff promotion.
											</li>
										</ol>
					
							        </p>
								</div>
							</div>
						</div>
						
						
						
					</div>
				</div>
			</div>
			<!-- --------------------------- -->

	        </div>
	        <p id='service_detail' style="display:none">service_detail
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Established in2011, Suzhou Home from Home Real Estate Co. Ltd has expanded to be one of the most important and well-expected players in relocation service field. We are specialized in providing one-stop and packaged accommodation and housing service to a range of  customers both in corporates and individual expats. <br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;苏州鸿富行企业服务有限公司成立于2011年，现已经成为苏州涉外租赁市场最大，最专业的供应商之一。我们致力于为苏州园区的外企员工和来苏的外籍人士提供一站式、打包的住宿安家服务。
				 <br/>
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Our business includes: <span class="label label-important">Airport Picking Up</span>, <span class="label label-important">Hotel Reservation</span>, <span class="label label-important">Visa Application</span>, <span class="label label-important">House Leasing</span>, <span class="label label-important">Business Tour and Training</span>. With rich experience on Enterprise Services, we have build good relationships with Corporate Client, Such as Bosch, Philips, Stryke, Fairchild，ETC  <br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我们的服务包括：<span class="label label-important">机场接机</span>，<span class="label label-important">酒店预订</span>，<span class="label label-important">签证办理</span>，<span class="label label-important">涉外租赁</span>，<span class="label label-important">商务旅游</span>以及<span class="label label-important">拓展培训</span>等一系列的企业服务。深耕企业市场，我们现在同苏州数十家大型公司建立了合作关系，其中就有博世汽车，飞利浦医疗，史塞克医疗，仙童半导体等世界知名500强企业。<br/>
	        </p>
			
		</div>
	</div>
	<input type="hidden" id="tabs-id" value="${tabs}" />
	</div>
	
 <script>
	var curTab = $("#tabs-id").val();
    $(function() {
    	var subchild = $('#subchild');
		$("#left_nav_menu").on('click','li',function(){
			$('#left_nav_menu li').removeClass('active');
			$(this).addClass('active');
			switch(this.id){
				case 'copmpanyinfo':
					subchild.text($(this).children().text());
					$('#company_descriptin_detial').show();
					$('#job_offers').hide();
					$('#service_detail').hide();
					break;
				case 'jobs':
					subchild.text($(this).children().text());
					$('#company_descriptin_detial').hide();
					$('#job_offers').show();
					$('#service_detail').hide();
					break;
				case 'service':
					subchild.text($(this).children().text());
					$('#company_descriptin_detial').hide();
					$('#job_offers').hide();
					$('#service_detail').show();
					break;

			}
		});
		
		$("#"+curTab).click();	
    });
    
  </script>
 <!--init for this page-->
		<script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
		<script type="text/javascript" src="js/SuperSlide.2.1.js"></script>
		<script type='text/javascript' src='js/jquery.browser.min.js'></script> 
		<script type='text/javascript' src='js/jquery.easing.1.3.js'></script> 
		<script type='text/javascript' src='js/camera.js'></script> 
		<script type="text/javascript" src="js/demo.js"></script>
		<jsp:include page="footer.jsp" />
</body>

</html>
