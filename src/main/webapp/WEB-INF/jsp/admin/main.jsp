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
	<div id="header">
		<br>
		<br>
		<h1>欢迎${auser.aname}进入后台管理系统！</h1>
	</div>
	<div id="navigator">
		<ul>
			<li><a>订单管理</a>
				<ul>
					<li><a href="adminOrder/orderInfo" target="center">删除订单</a></li>
				</ul>
			</li>
			
		</ul>
		
	</div>
</body>
</html>


