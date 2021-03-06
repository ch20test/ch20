<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户管理</title>
	<link href="css/admin/common.css" type="text/css" rel="stylesheet">
	<style type="text/css">
		table{
			text-align: center;
		}
		.bgcolor{
		  	background-color: lightblue;
		}
	</style>
	
	<script type="text/javascript">
		function changeColor(obj){
			obj.className = "bgcolor";
		}
		function changeColor1(obj){
			obj.className = "";
		}
		function checkDel(id){
  			if(window.confirm("确认删除该用户？")){
  				window.location.href="/ch20/adminUser/deleteuserManager?id="+id;
  			}
  		}
	</script>
	
</head>

<body>
	<br>
	<table border="1" bordercolor="black" style="font-size:20px align:center">
		<tr>
			<th width="200px" height="50px" style="font-size:22px">用户ID</th>
			<th width="200px" height="50px" style="font-size:22px">用户E-mail</th>
			<th width="200px" height="50px" style="font-size:22px">用户密码</th>
			<th width="250px" height="50px" style="font-size:22px">删除</th>
		</tr>
		<c:forEach var="n" items="${userList}">
		<tr onmousemove="changeColor(this)" onmouseout="changeColor1(this)">
			<td width="200px" height="50px" style="font-size:22px">${n.id}</td>
			<td width="200px" height="50px" style="font-size:22px">${n.bemail}</td>
			<td width="200px" height="50px" style="font-size:22px"><input type="password" value="${n.bpwd}" readonly></td>
			<td width="200px" height="50px" style="font-size:22px">
				<a href="javaScript:checkDel('${n.id}')">删除</a>
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="6">${msg}</td>
		</tr>
	</table>
</body>
</html>