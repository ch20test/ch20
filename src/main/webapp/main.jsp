<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>后台主页面</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	background-image:url(images/admin/timg.jpg);
}


#navigator .link a {
	color: #eee;
	display: block;
}
#navigator.link a:hover, 
#navitator .link li {
	width: 20%;
	text-align: center;
	float: right;
}

#navigator {
	width:300px;
	font-size: 14px; 
	height: 960px;
	background-color: #333;
	box-shadow: 0 1px 10px rgba(0, 0, 0, 0.3);
}
#navigator ul {
	list-style-type: none;
}
#navigator li {
	float: left;
	position: relative;
	width:100%;
}
#navigator li a {
	color: #000000;
	text-decoration: none;
	padding-top: 4px;
	display: block;
	width: 313px;
	height: 40px;
	text-align: center;
	margin-left: 2px;
	font-size: 20px;
}
#navigator li a:hover {
	color: #FFFFFF;
}
#navigator ul li ul {
	margin-top:-44px;
	margin-left: 300px;
   visibility: hidden;
   position: absolute;
   	background-color: #333;
	box-shadow: 0 1px 10px rgba(0, 0, 0, 0.3);
}

#navigator ul li:hover ul,
#navigator ul a:hover ul{
   visibility: visible;
}

#content {
	width:1850px;
	height:780px;
	text-align:center;
	margin:0 auto;
}

#content iframe {
	margin-top:250px;
	height:700px;
	width: 1000px;
}

#zzz {
	height:250px;
}
</style>
</head>
<body>
	<div id="navigator">
		<ul class="link">
			<li><a>商品管理</a>
				<ul>
					<li><a href="adminGoods/toAddGoods" target="center">添加商品</a></li>
					<li><a href="adminGoods/selectGoods?act=deleteSelect" target="center">删除商品</a></li>
					<li><a href="adminGoods/selectGoods?act=updateSelect" target="center">修改商品</a></li>
					<li><a href="adminGoods/selectGoods" target="center">查询商品</a></li>
				</ul>
			</li>
			<li><a>类型管理</a>
				<ul>
					<li><a href="adminType/toAddType" target="center">添加类型</a></li>
					<li><a href="adminType/toDeleteType" target="center">删除类型</a></li>
				</ul>
			</li>
			<li><a>用户管理</a>
				<ul>
					<li><a href="adminUser/userInfo" target="center">删除用户</a></li>
				</ul>
			</li>
			<li><a>订单管理</a>
				<ul>
					<li><a href="adminOrder/orderInfo" target="center">删除订单</a></li>
				</ul>
			</li>
			<li><a>公告管理</a>
				<ul>
					<li><a href="adminNotice/toAddNotice" target="center">添加公告</a></li>
					<li><a href="adminNotice/deleteNoticeSelect" target="center">删除公告</a></li>
				</ul>
			</li>
			<li><a href="exit">安全退出</a></li>
		</ul>
			<div id="content">
		<iframe src="adminNotice/deleteNoticeSelect"  name="center" frameborder="0"></iframe>
			</div>
	</div>
</body>
</html>


