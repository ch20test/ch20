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
    <title>订单管理</title>
	<link href="css/admin/common.css" type="text/css" rel="stylesheet">
	<style type="text/css">
		table{
			text-align: center;
		}
		.bgcolor{
		  	background-color: #F08080;
		}
	</style>
	<script type="text/javascript">
		function changeColor(obj){
			obj.className="bgcolor";
		}
		function changeColor1(obj){
			obj.className="";
		}
		function checkDel(id){
  			if(window.confirm("是否删除该订单？")){
  				window.location.href="/ch20/adminOrder/deleteorderManager?id="+id;
  			}
  		}
	</script>
</head>
<body>
	<br>
	<table border="1" bordercolor="black" style="font-size:20px align:center">
		<tr>
			<th width="200px" height="50px" style="font-size:22px">订单编号</th>
			<th width="200px" height="50px" style="font-size:22px">用户E-mail</th>
			<th width="200px" height="50px" style="font-size:22px">订单金额</th>
			<th width="200px" height="50px" style="font-size:22px">订单状态</th>
			<th width="200px" height="50px" style="font-size:22px">订单日期</th>
			<th width="200px" height="50px" style="font-size:22px">操作</th>
		</tr>
		<c:forEach var="n" items="${orderList}">
		<tr onmousemove="changeColor(this)" onmouseout="changeColor1(this)">
			<td width="200px" height="50px" style="font-size:22px">${n.id}</td>
			<td width="200px" height="50px" style="font-size:22px">${n.bemail}</td>
			<td width="200px" height="50px" style="font-size:22px">${n.amount}</td>
			<td width="200px" height="50px" style="font-size:22px"><c:if test="${n.status == 0}" >未付款</c:if><c:if test="${n.status == 1}" >已付款</c:if></td>
			<td width="200px" height="50px" style="font-size:22px">${n.orderdate}</td>
			<td width="200px" height="50px" style="font-size:22px">
				<c:if test="${n.status == 0}" >
					<a href="javaScript:checkDel('${n.id}')">删除</a>
				</c:if>
				&nbsp;
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>