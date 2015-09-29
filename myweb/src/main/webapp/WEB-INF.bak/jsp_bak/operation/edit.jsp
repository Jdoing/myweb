<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--CSS -->
<link rel="stylesheet" href="${ctx}/static/lib/bootstrap-3.3.5/css/bootstrap.css" />
<link rel="stylesheet" href="${ctx}/static/lib/Font-Awesome-3.2.1/css/font-awesome.css" />

<!--JS -->
<script src="${ctx}/static/lib/jquery/jquery-1.11.3.min.js"></script>
<script src="${ctx}/static/lib/bootstrap-3.3.5/js/bootstrap.js"></script>
<title>操作编辑</title>
</head>
<body>
	<div class="panel panel-default">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#"><i class="icon-file-alt"></i> 新增</a></li>
			<li><a href="#"><i class="icon-reply"></i> 返回</a></li>
		</ul>
		<div class="panel-body">
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="col-sm-offset-3">
						<form class="form-horizontal" method="post" action="${ctx}/api/operation/save">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="name">操作名称</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="name" placeholder="name"></input>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="operation">操作标识</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="operation" placeholder="operation"></input>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="description">操作描述</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="description" placeholder="description"></input>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-4">
									<button type="submit" class="btn btn-primary">
										<i class="icon-file-alt"></i> 新增
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