<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<form:form modelAttribute="goods" action="${pageContext.request.contextPath}/adminGoods/addGoods?updateAct=update" method="post" enctype="multipart/form-data">
	<table>
			<tr>
				<td>名称</td>
				<td>
					<form:input path="gname"/>
				</td>
			</tr>
			<tr>
				<td>原价</td>
				<td>
					<form:input path="goprice"/>
				</td>
			</tr>
			<tr>
				<td>折扣价</td>
				<td>
					<form:input path="grprice"/>
				</td>
			</tr>
			<tr>
				<td>库存</td>
				<td>
					<form:input path="gstore"/>
				</td>
			</tr>
			<tr>
				<td>图片</td>
				<td>
					<input type="file" name="logoImage"/>
					<br>
					<!-- 从数据库取出的文件名 -->
					<c:if test="${goods.gpicture != ''}">
						<img alt="" width="50" height="50"
						src="logos/${goods.gpicture}"/>
					</c:if>	
				</td>
			</tr>
			<tr>
				<td>类型</td>
				<td>
					<form:select path="goodstype_id">
         				<form:options items="${goodsType }" itemLabel="typename" itemValue="id"/>
   					</form:select>
				</td>
			</tr>
			<tr>
				<td align="center">
					<input type="submit" value="提交"/>
				</td>
				<td align="left">
					<input type="reset" value="重置"/>
				</td>
			</tr>
		</table>
</form:form>
</body>
</html>