<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资源编辑</title>
<!--CSS -->
<link rel="stylesheet" href="${ctx}/static/lib/bootstrap-3.3.5/css/bootstrap.css" />
<link rel="stylesheet" href="${ctx}/static/lib/Font-Awesome-3.2.1/css/font-awesome.css" />

<!--JS -->
<script src="${ctx}/static/lib/jquery/jquery-1.11.3.min.js"></script>
<script src="${ctx}/static/lib/bootstrap-3.3.5/js/bootstrap.js"></script>
</head>
<body>
	<div class="panel  panel-default">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#"><i class="icon-file-alt"></i> 新增</a></li>
			<li><a href="#"><i class="icon-reply"></i> 返回</a></li>
		</ul>
		<div class="panel-body">
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="col-sm-offset-3">
						<form class="form-horizontal" method="post" action="${ctx}/api/resource/save">
							<div class="form-group">
								<label class="col-sm-2 control-label">父节点名称</label>
								<div class="col-sm-4">
									<i class="ztree_setting"></i> 资源
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">子节点名称</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="name" placeholder="name"></input>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">资源标识</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="identity" placeholder="operation"></input>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">URL地址</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="url" placeholder="description"></input>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-4">
									<button type="submit" class="btn btn-primary">
										<i class="icon-file-alt"></i> 增加子节点
									</button>
									<a href="#" class="btn"> <i class="icon-reply"></i> 返回
									</a>
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>