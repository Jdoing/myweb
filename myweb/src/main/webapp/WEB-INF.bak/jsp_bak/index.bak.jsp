<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="${ctx}/static/lib/jquery/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/static/lib/jquery-easyui-1.4.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/lib/jquery-easyui-1.4.3/themes/icon.css">
<script type="text/javascript" src="${ctx}/static/lib/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>

<title>首页</title>
</head>
<body>
	<c:forEach items="${menus}" var="m">
		<c:if test="${fn:startsWith(m.url, '/')}">
			<c:set target="${m}" property="url" value="${fn:substringAfter(m.url, '/')}" />
		</c:if>
		<a href="${pageContext.request.contextPath}/${m.url}" target="content">${m.name}</a>
	</c:forEach>


</body>
</html>