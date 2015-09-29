<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application" />
<html>
<head>
<title>首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="${ctx}/static/lib/jquery/jquery-1.11.3.min.js"></script>

<link rel="stylesheet" type="text/css" href="${ctx}/static/css/app.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/accordion.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/tabs.css" />

<link rel="stylesheet" href="${ctx}/static/lib/Font-Awesome-3.2.1/css/font-awesome.css" />

<!--Bootstrap -->
<link rel="stylesheet" href="${ctx}/static/lib/bootstrap-3.3.5/css/bootstrap.css" />
<script src="${ctx}/static/lib/bootstrap-3.3.5/js/bootstrap.js"></script>

<script type="text/javascript" src="${ctx}/static/js/app.js"></script>
<script type="text/javascript" src="${ctx}/static/js/accordion.js"></script>
<script type="text/javascript" src="${ctx}/static/js/tabs.js"></script>
</head>
<body>
	<div id="container">
		<div id="header">
			ctx: ${ctx}
			<div id="nav-div-id" class="nav-div">
				<ul class="tabs">
					<li class="tabs-li"><a href="#" class="tab-li-a active">欢迎使用</a></li>

				</ul>
			</div>
		</div>

		<div id="layout-left">
			<dl class="accordion" id="my-accordion">
				<dt>系统管理</dt>
				<dd>
					<a href="${ctx}/api/user/all">用户管理</a>
				</dd>
				<dd>
					<a href="${ctx}/api/operation/all">操作权限管理</a>
				</dd>
				<dd>
					<a href="${ctx}/api/resource/all">资源管理</a>
				</dd>
				<dd>
					<a href="${ctx}/api/role/view">角色管理</a>
				</dd>					
				<dt>浏览器脚本</dt>
				<dd>
					<a href="http://www.w3school.com.cn/js/index.asp">JavaScript</a>
				</dd>
				<dd>
					<a href="http://www.w3school.com.cn/jquery/index.asp">jquery</a>
				</dd>
				<dt>XML教程</dt>
				<dd>
					<a href="#">nav1</a>
				</dd>
				<dd>
					<a href="#">nav2</a>
				</dd>

			</dl>

		</div>

		<iframe id="iframe-tab-0" class="layout-iframe" src="http://www.w3school.com.cn/"> </iframe>

		<div id="footer">footer</div>

	</div>
</body>
</html>