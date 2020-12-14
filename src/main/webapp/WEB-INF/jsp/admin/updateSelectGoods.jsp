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
<c:if test="${allgoods.size()==0}">您还没有商品</c:if>
	<c:if test="${allgoods.size()!=0 }">
		<table border="1">
			<tr>
				<th width="100px">ID</th>
				<th width="200px">名称</th>
				<th width="200px">价格</th>
				<th width="100px">库存</th>
				<th width="200px">详情</th>
			</tr>
	
			<c:forEach items="${allgoods }" var="goods">
				<tr>
					<td>${goods.id}</td>
					<td>${goods.gname }</td>
					<td>${goods.grprice }</td>
					<td>${goods.gstore }</td>
					<td><a href="selectAGoods?id=${goods.id}">详情</a></td>	
					<td><a href="selectAGoods?id=${goods.id}&act=updateAgoods">修改</a></td>
				</tr>
			</c:forEach>
			
			<!-- 分页框 -->
			<tr>
				<td colspan="6" align="right">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共${totalCount}条记录&nbsp;&nbsp;
					共${totalPage}页&nbsp;&nbsp;
					第${pageCur}页&nbsp;&nbsp;
					<c:url var="url_pre" value="selectGoods">
						<c:param name="pageCur" value="${pageCur-1}"></c:param>		
						<c:param name="act" value="updateSelect"/>			
					</c:url>
					<c:url var="url_next" value="selectGoods">
						<c:param name="pageCur" value="${pageCur+1}"></c:param>
						<c:param name="act" value="updateSelect"/>
					</c:url>
					<!-- 第一页，没有上一页 -->
					<c:if test="${ pageCur > 1}">
						<a href="${url_pre }">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</c:if>
					<!-- 最后一页，没有下一页 -->
					<c:if test="${ pageCur<totalPage && totalPage != 0}">
						<a href="${url_next }">下一页</a>
					</c:if>
				</td>
			</tr>
		</table>
	</c:if>
</body>
</html>