<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<form:form  modelAttribute="goods" action="adminGoods/addGoods" method="post" style="font-size:20px align:center">
	<tr>
		<td>名称</td>
		<td><form:input path="gname"/></td>
	</tr>
	<tr>
		<td>原价</td>
		<td><form:input path="goprice"/></td>
	</tr>
	<tr>
		<td>折扣价</td>
		<td><form:input path="grprice"/></td>
	</tr>
	<tr>
		<td>库存</td>
		<td><form:input path="gstore"/></td>
	</tr>
	<tr>
		<td>图片</td>
		<td><input type="file" name="logoImage"/></td>
	</tr>
	<tr>
		<td>类型</td>
		<td>
			<form:select path="goodstype_id">
				<form:options item="${goodsType}" itemLabel="typename" itemValue="id"/>
			</form:select>
		</td>
	</tr>
	<tr>
		<td align="center"><input type="submit" value="提交"></td>
		<td align="center"><input type="reset" value="重置"></td>
	</tr>
</form:form>
</body>
</html>