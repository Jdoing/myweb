<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<script type="text/javascript" src="${ctx}/static/js/user.js"></script>
<title>用户管理</title>
</head>

<body>
	<div class="panel panel-default">
		<div class="panel-heading">Panel heading</div>

		<div class="panel-body">
			<div class="btn-group" role="toolbar">
				<button type="button" class="btn btn-default btn-add">
					<i class="icon-file-alt"></i> 新增
				</button>
				<button type="button" class="btn btn-default" btn-edit>
					<i class="icon-edit"></i> 修改
				</button>

			</div>
			<table
				class="table table-striped table-bordered table-hover table-condensed">
				<thead>
					<tr>
						<th>编号</th>
						<th>姓名</th>
						<th>邮箱</th>
						<th>状态</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${userList}" var="user">
						<tr>
							<td>${user.id}</td>
							<td>${user.username }</td>
							<td>${user.email }</td>
							<td>${user.locked}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>