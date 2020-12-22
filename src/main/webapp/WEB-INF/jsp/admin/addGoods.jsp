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
<form:form  modelAttribute="goods" action="${pageContext.request.contextPath}/adminGoods/addGoods" method="post" enctype="multipart/form-data">
<table border=1 style="font-size:35px align:center ">
	<tr>
		<td style="font-size:26px">名称</td>
		<td><form:input style="width:545px;height:35px" path="gname"/></td>
		<td><form:errors style="width:545px;height:35px" path="gname"></form:errors></td>
	</tr>
	<tr>
		<td style="font-size:26px">原价</td>
		<td><form:input style="width:545px;height:35px" path="goprice"/></td>
		<td><form:errors style="width:545px;height:35px" path="goprice"></form:errors></td>
	</tr>
	<tr>
		<td style="font-size:26px">折扣价</td>
		<td><form:input style="width:545px;height:35px" path="grprice"/></td>
		<td><form:errors style="width:545px;height:35px" path="grprice"></form:errors></td>
	</tr>
	<tr>
		<td style="font-size:26px">库存</td>
		<td><form:input style="width:545px;height:35px" path="gstore"/></td>
		<td><form:errors style="width:545px;height:35px" path="gstore"></form:errors></td>
	</tr>
	<tr>
		<td style="font-size:26px">图片</td>
		<td><input type="file" style="width:545px;height:35px font-size:26px" name="logoImage"/></td>
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
		<td align="center"><input type="submit" value="提交" style="font-size:24px"></td>
		<td align="center"><input type="reset" value="重置" style="font-size:24px"></td>
	</tr>
</table>
</form:form>
</body>
</html>