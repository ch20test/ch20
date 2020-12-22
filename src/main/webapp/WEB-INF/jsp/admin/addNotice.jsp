<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>addNotice.jsp</title>
</head>
<body>
	<form:form action="adminNotice/addNotice" method="post" modelAttribute="notice">
		<table border=1 style="border-collapse: collapse" style=" align:center">
			<caption>
				<font size=6 face=华文新魏>添加公告</font>
			</caption>
			<tr>
				<td width="200px" height="50px" style="font-size:26px">标题<font color="red">*</font></td>
				<td width="200px" height="50px" style="font-size:26px">
					<form:input path="ntitle"/>
				</td>
			</tr>
			<tr>
				<td width="200px" height="50px" style="font-size:26px">内容<font color="red">*</font></td>
				<td width="200px" height="50px" style="font-size:22px">
					<form:textarea path="ncontent"/>
				</td>
			</tr>
			<tr>
				<td align="center" width="200px" height="50px" style="font-size:22px">
					<input type="submit" value="提交"/>
				</td>
				<td align="left" width="200px" height="50px" style="font-size:22px">
					<input type="reset" value="重置"/>
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>
