<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>名称</td>
			<td>${agoods.gname}</td>
		</tr>
		<tr>
			<td>原价</td>
			<td>${agoods.goprice}</td>
		</tr>
		<tr>
			<td>折扣价</td>
			<td>${agoods.grprice}</td>
		</tr>
		<tr>
			<td>库存</td>
			<td>${agoods.gstore}</td>
		</tr>
		<tr>
			<td>图片</td>
			<td>
				<c:if test="${agoods.picture!=''}">
					<img alt="" width="250" height="250"
					src="logos/${goods.gpicture}"/>
				</c:if>
			</td>
		</tr>	
	</table>
</body>
</html>