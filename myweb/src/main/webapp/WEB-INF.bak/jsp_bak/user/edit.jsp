<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--CSS -->
<link rel="stylesheet" href="${ctx}/static/lib/bootstrap-3.3.5/css/bootstrap.css" />

<!--JS -->
<script src="${ctx}/static/lib/jquery/jquery-1.11.3.min.js"></script>
<script src="${ctx}/static/lib/bootstrap-3.3.5/js/bootstrap.js"></script>
<script type="text/javascript" src="${ctx}/static/js/user.js"></script>
<title>编辑用户</title>
</head>
<body>
	<div class="panel panel-default">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">新增</a></li>
			<li><a href="#">修改</a></li>
			<li><a href="#">删除</a></li>
			<li><a href="#">返回</a></li>
		</ul>

	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="col-sm-offset-4">
					<form class="form-horizontal">
						<fieldset>
							<div class="control-group">

								<!-- Text input-->
								<label class="control-label" for="input01">用户名</label>
								<div class="controls">
									<input type="text" name="username" placeholder="name" class="input-xlarge">
									<p class="help-block">登录用的账号</p>
								</div>
							</div>

							<div class="control-group">

								<!-- Text input-->
								<label class="control-label" for="input01">密码</label>
								<div class="controls">
									<input type="text" name="password" placeholder="password" class="input-xlarge">
									<p class="help-block">登录用的密码</p>
								</div>
							</div>

							<div class="control-group">

								<!-- Text input-->
								<label class="control-label" for="input01">邮箱</label>
								<div class="controls">
									<input type="text" name="email" placeholder="email" class="input-xlarge">
									<p class="help-block">找回密码时用到的邮箱</p>
								</div>
							</div>

							<div class="control-group">
								<!-- Button -->
								<div class="controls">
									<button class="btn btn-success btn-submit">提交</button>
								</div>
							</div>

						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>


</body>
</html>