<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>首页</title>
</head>
<body>
	<div class="all_zong">
		<!--最上面 灰色条部分-->
		<div class="all_zong_top">
			<div class="all_zong_top_right a8c">
				<table border="0" cellspacing="0" cellpadding="0" class="main_login">
					<tr>
						<td>
							<p id="content">
								<c:if test="${bruser!=null}">欢迎 ${bruser.bemail }</c:if>
								<c:if test="${bruser==null}"><a href="toLogin">登录</a></c:if>
							</p>
						</td>
						<td>
							<p>
								<a href="toRegister">注册</a>
							</p>
						</td>
						<!-- 没有登录 -->
						<c:if test="${bruser!= null}">	
						<td><a href="user/exit">退出</a><span
							class="xx">|</span></td>
						</c:if>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
