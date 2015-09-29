<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!--Bootstrap -->

<script src="${ctx}/static/lib/bootstrap-3.3.5/js/bootstrap.js"></script>

<script type="text/javascript">
	var index = 0;
	function addPanel() {
		index++;
		$('#tt').tabs('add', {
			title : 'Tab' + index,
			content : '<div style="padding:10px">Content' + index + '</div>',
			closable : true
		});
	}
	function removePanel() {
		var tab = $('#tt').tabs('getSelected');
		if (tab) {
			var index = $('#tt').tabs('getTabIndex', tab);
			$('#tt').tabs('close', index);
		}
	}
</script>
<title>首页</title>
</head>
<body>
	<div id="cc" class="easyui-layout" style="width: 1000px; height: 600px; margin: 0 auto;">
		<div data-options="region:'north',split:true" style="height: 80px;">
			<div class="easyui-layout" data-options="fit:true">
				<div data-options="region:'south'" style="position: relative; left: 200px; overflow: hidden; height: 30px;">


				</div>
			</div>
		</div>
		<div id="west" data-options="region:'west',title:'导航',split:true" style="width: 200px;">
			<div class="easyui-accordion">
				<div title="系统管理" data-options="selected:true">
					<ul>
						<li><a href="${ctx}/api/user/all">用户管理</a></li>
						<li><a href="${ctx}/api/operation/all">操作权限管理</a></li>
						<li><a href="${ctx}/api/resource/all">资源管理</a></li>
						<li><a href="${ctx}/api/role/view">角色管理</a></li>
					</ul>
				</div>
				<div title="个人中心"></div>
			</div>


		</div>
		<div id="center-0" data-options="region:'center',href:''" style="padding: 5px;"></div>
		<div data-options="region:'south',split:true" style="height: 70px;"></div>
	</div>

</body>
</html>