<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx}/static/lib/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<link rel="stylesheet" href="${ctx}/static/lib/bootstrap-3.3.5/css/bootstrap.css" />

<script type="text/javascript" src="${ctx}/static/lib/jquery/jquery-1.11.3.min.js"></script>

<script src="${ctx}/static/lib/bootstrap-3.3.5/js/bootstrap.js"></script>
<script type="text/javascript" src="${ctx}/static/lib/zTree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="${ctx}/static/lib/zTree/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="${ctx}/static/lib/zTree/js/jquery.ztree.exedit-3.5.js"></script>
<script type="text/javascript" src="${ctx}/static/js/resource.js"></script>
<style type="text/css">
.ztree li span.button.add {
	margin-left: 2px;
	margin-right: -1px;
	background-position: -144px 0;
	vertical-align: top;
	*vertical-align: middle
}

.content {
	margin: 0;
	padding: 0;
}

.resource-tree {
	float: left;
	height: auto;
	width: 200px;
}

.detail {
	float: left;
	height: auto;
	width: 600px;
}
</style>
<title>资源列表</title>
</head>
<body>
	<div class="content">
		<div class="resource-tree">
			<ul id="treeDemo" class="ztree"></ul>
		</div>
		<div class="detail">
			<div class="panel  panel-default">
				<ul class="nav nav-tabs">
					<li><a href="#"><i class="icon-eye-open"></i>查看</a></li>
					<li class="active"><a href="#"><i class="icon-file-alt"></i>增加</a></li>
					<li><a href="#"><i class="icon-edit"></i>修改</a></li>
					<li><a href="#"><i class="icon-reply"></i> 返回</a></li>
				</ul>

				<div class="panel-body">
					<div class="container-fluid">
						<div class="row-fluid">
							<form class="form-horizontal" method="post" action="${ctx}/api/resource/save">
								<div class="form-group">
									<label class="col-sm-4 control-label">父节点名称</label>
									<div class="col-sm-4">
										<i class="ztree_setting"></i><input type="text" class="form-control" name="name" placeholder="name"></input>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">子节点名称</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" name="name" placeholder="name"></input>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">资源标识</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" name="identity" placeholder="operation"></input>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">URL地址</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" name="url" placeholder="description"></input>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-4 col-sm-4">
										<button type="submit" class="btn btn-primary">
											<i class="icon-file-alt"></i> 增加子节点
										</button>
									</div>
								</div>

							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>



</body>
</html>