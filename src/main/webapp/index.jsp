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
</head>
<body>
	<div id="header">
		<br>
		<br>
		<h1>欢迎${auser.aname}进入电子商务平台！</h1>
	</div>
	<div id="navigator">
		<ul>
			<li><a>电子商务平台</a>
				<ul>
					<li><a href="before" target="center">进入</a></li>
				</ul>
			</li>
			
		</ul>
		
	</div>
</body>
</html>


