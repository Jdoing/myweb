<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="application" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${ctx}/static/lib/jquery/jquery-1.11.3.min.js"></script>

<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx}/static/lib/jquery-easyui-1.4.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/lib/jquery-easyui-1.4.3/themes/icon.css">
<script type="text/javascript" src="${ctx}/static/lib/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript">
	$(function() {

		$('#ff').form({
			url : "${ctx}/api/user/register",
			onSubmit : function() {
				return $(this).form('validate');
			},
			success : function(data) {
				if (data = 'OK'){
					$.messager.alert("操作提示", "注册成功！", "info");
					window.location.href = '/myweb/api/user/login.page';
				}
					
				else
					alert("register fail");
			}
		});

		$('#btn-register').click(function() {
			$('#ff').submit();

		});
	});
</script>

</head>
<body class="easyui-layout">
	<div data-options="region:'north',split:false,border:false" style="height: 100px;"></div>
	<div data-options="region:'west',split:false,border:false" style="width: 400px;"></div>
	<div data-options="region:'center',split:false,border:false" style="padding: 5px;">
		<div class="easyui-panel" title="Register" style="width: 400px; padding: 30px 60px;">
			<form id="ff" method="post">
				<div style="margin-bottom: 20px">
					<div>用户名：</div>
					<input class="easyui-textbox" name="username" data-options="required:true" style="width: 100%; height: 32px">
				</div>
				<div style="margin-bottom: 20px">
					<div>密码:</div>
					<input class="easyui-textbox" type="password" name="password" data-options="required:true" style="width: 100%; height: 32px">
				</div>
				<div style="margin-bottom: 20px">
					<div>邮箱:</div>
					<input class="easyui-textbox" name="email" data-options="required:false,prompt:'Enter a email address...',validType:'email'" style="width: 100%; height: 32px">
				</div>

				<div>
					<a href="#" id="btn-register" class="easyui-linkbutton" iconCls="icon-ok" style="width: 100%; height: 32px">Register</a>
				</div>
			</form>
		</div>
	</div>

</body>
</html>