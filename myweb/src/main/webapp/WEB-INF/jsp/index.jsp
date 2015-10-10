<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/main.css" />

<script type="text/javascript" src="${ctx}/static/lib/jquery/jquery-1.11.3.min.js"></script>

<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx}/static/lib/jquery-easyui-1.4.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/lib/jquery-easyui-1.4.3/themes/icon.css">
<script type="text/javascript" src="${ctx}/static/lib/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>

<script type="text/javascript" src="${ctx}/static/js/main.js"></script>

<title>首页</title>
</head>
<body>
	<div id="cc" class="easyui-layout" style="width: 1000px; height: 600px; margin: 0 auto;">
		<div data-options="region:'north',split:true" style="height: 80px;">
			<a href="/myweb/api/user/logout" id="logout" class="easyui-linkbutton" plain="true" iconCls="icon-back">退出</a>

		</div>
		<div id="west" data-options="region:'west',title:'导航',split:true" style="width: 200px;">
			<div class="easyui-accordion">
				<div title="系统管理" data-options="selected:true">
					<ul>
						<c:forEach items="${menus}" var="res">
							<c:if test="${fn:startsWith(res.url,'/')}">
								<c:set target="${res}" property="url" value="${fn:substringAfter(res.url,'/')}" />
							</c:if>
								<li><a href="${ctx}/${res.url}">${res.name}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>

		</div>
		<div data-options="region:'center'">
			<div id="tt" class="easyui-tabs" data-options="fit:true,border:true,plain:true"></div>

		</div>
		<div data-options="region:'south',split:true" style="height: 70px;"></div>
	</div>
	</div>
</body>
</html>