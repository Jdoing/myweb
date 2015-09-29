<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--CSS -->
<link rel="stylesheet"
	href="${ctx}/static/lib/bootstrap-3.3.5/css/bootstrap.css" />
<link rel="stylesheet"
	href="${ctx}/static/lib/bootstrap-3.3.5/css/bootstrap-theme.css" />
<link rel="stylesheet"
	href="${ctx}/static/lib/Font-Awesome-3.2.1/css/font-awesome.css" />

<!--JS -->
<script src="${ctx}/static/lib/jquery/jquery-1.11.3.min.js"></script>
<script src="${ctx}/static/lib/bootstrap-3.3.5/js/bootstrap.js"></script>
<title>操作权限列表</title>
</head>
<body>

	<div class="panel panel-default">
		<ul class="nav nav-tabs">
			<li class="active"><a
				href="/es-web/admin/sys/permission/permission"> <i
					class="icon-table"></i> 所有操作权限列表
			</a></li>
			<li><a
				href="/es-web/admin/sys/permission/permission?search.show_eq=true">
					<i class="icon-table"></i> 可用操作权限列表
			</a></li>
			<li><a
				href="/es-web/admin/sys/permission/permission?search.show_eq=false">
					<i class="icon-table"></i> 不可用操作权限列表
			</a></li>
		</ul>

		<div class="row-fluid tool ui-toolbar">
			<div class="col-sm-4">
				<div class="btn-group">

					<a class="btn btn-create no-disabled" href="${ctx}/api/operation/add"> <i class="icon-file-alt"></i>
						新增
					</a> <a id="update" class="btn btn-update disabled"> <i
						class="icon-edit"></i> 修改
					</a> <a class="btn btn-delete disabled"> <i class="icon-trash"></i>
						删除
					</a>
				</div>
			</div>
		</div>
		<div class="panel-body">
			<table
				class="table table-striped table-bordered table-hover table-condensed">
				<thead>
					<tr>
						<th>编号</th>
						<th>操作名称</th>
						<th>操作标识</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${operationList}" var="operation">
						<tr>
							<td>${operation.id}</td>
							<td>${operation.name }</td>
							<td>${operation.operation }</td>
							<td>${operation.description}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>