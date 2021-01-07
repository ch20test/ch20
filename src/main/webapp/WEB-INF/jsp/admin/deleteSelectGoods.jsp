<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
		function changeColor(obj){
			obj.className = "bgcolor";
		}
		function changeColor1(obj){
			obj.className = "";
		}
	</script>
	<script type="text/javascript">
  		function confirmDelete(){
  			var n = document.deleteForm.ids.length;
  			var count = 0;//统计没有选中的个数
  			for(var i = 0; i < n; i++){
  				if(!document.deleteForm.ids[i].checked){
  					count++;
  				}else{
  					break;
  				}
  			}
  			if(n > 1){
  				if(count == n){
  					alert("请选择被删除的商品！");
  	  				count = 0;
  	  				return false;
  				}
  			}else{
  	  			if(!document.deleteForm.ids.checked){
  	  					alert("请选择被删除的商品！");
  	  					return false;
  	  			}
  			}	
  		
  			if(window.confirm("真的删除吗？really?")){
  				document.deleteForm.submit();
  				return true;
  			}
  			return false;
  		}
  		function checkDel(id){
  			if(window.confirm("是否删除该商品？")){
  				window.location.href = "/ch20/adminGoods/deleteAGoods?id="+id;
  			}
  		}
  </script>
</head>
<body>
<c:if test="${allgoods.size()==0}">您还没有商品</c:if>
	<c:if test="${allgoods.size()!=0 }">
		<form action="deleteGoods" name="deleteForm" style="font-size:20px align:center">
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
						<td><input type="checkbox" name="ids" value="${goods.id }"/>${goods.id }</td>
						<td>${goods.gname }</td>
						<td>${goods.grprice }</td>
						<td>${goods.gstore }</td>
						<td><a href="selectAGoods?id=${goods.id}">详情</a></td>	
						<td>
							<a href="javascript:checkDel('${goods.id }')">删除</a>
						</td>
					</tr>
				</c:forEach>
	
				<tr>
					<td colspan="6" align="center">
						<input type="button" value="删除" onclick="confirmDelete()">
					</td>
				</tr>
				
				<!-- 分页框 -->
				<tr>
					<td colspan="6" align="right">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共${totalCount}条记录&nbsp;&nbsp;
						共${totalPage}页&nbsp;&nbsp;
						第${pageCur}页&nbsp;&nbsp;
						<c:url var="url_pre" value="selectGoods">
							<c:param name="pageCur" value="${pageCur-1}"></c:param>	
							<c:param name="act" value="deleteSelect"/>				
						</c:url>
						<c:url var="url_next" value="selectGoods">
							<c:param name="pageCur" value="${pageCur+1}"></c:param>
							<c:param name="act" value="deleteSelect"/>
						</c:url>
						<!-- 第一页，没有上一页 -->
						<c:if test="${pageCur > 1}">
							<a href="${url_pre }">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if>
						<!-- 最后一页，没有下一页 -->
						<c:if test="${ pageCur<totalPage && totalPage != 0}">
							<a href="${url_next }">下一页</a>
						</c:if>
					</td>
				</tr>
				<tr>
				<td colspan="6">${msg }</td>
				</tr>
			</table>
		</form>
	</c:if>
</body>
</html>