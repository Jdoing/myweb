<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="${ctx}/static/lib/jquery/jquery-1.11.3.min.js"></script>
<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx}/static/lib/jquery-easyui-1.4.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/lib/jquery-easyui-1.4.3/themes/icon.css">
<script type="text/javascript" src="${ctx}/static/lib/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>

<script type="text/javascript" src="${ctx}/static/js/user.js"></script>
<title>用户列表</title>
<style type="text/css">
form {
	margin: 0;
	padding: 10px 30px;
}

.ftitle {
	font-size: 14px;
	font-weight: bold;
	padding: 5px 0;
	margin-bottom: 10px;
	border-bottom: 1px solid #ccc;
}

.fitem {
	margin-bottom: 5px;
}

.fitem label {
	display: inline-block;
	width: 80px;
}

.fitem input {
	width: 160px;
}
</style>
</head>
<body>
	<table id="tl-user-list" class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th style="display: none" data-options="field:'id',width:80">用户ID</th>
				<th data-options="field:'username',width:100">用户名</th>
				<th data-options="field:'email',width:100,align:'right'">用户邮箱</th>
				<th data-options="field:'locked',width:100,align:'center'">用户是否被锁定</th>
			</tr>
		</thead>
	</table>

	<div id="dlg" class="easyui-dialog" data-options="iconCls:'icon-save',resizable:true,modal:true" style="width: 400px; height: 280px; padding: 10px 20px" closed="true" buttons="#dlg-buttons">
		<div class="ftitle">用户设置</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
				<label>用户名:</label> <input name="username" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>密码:</label> <input name="password" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>电子邮箱:</label> <input name="email" class="easyui-textbox" validType="email">
			</div>
			<div class="fitem">
				<label>角色:</label> <select class="easyui-combobox" name="roles" style="width: 170px; height: 50px"
					data-options="
                    url:'${ctx}/api/role/all',
                    method:'get',
                    valueField:'id',
                    textField:'name',
                    panelHeight:'auto',
                    multiline:true,
                    multiple:true"></select>
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" style="width: 90px">确定</a> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
			onclick="javascript:$('#dlg').dialog('close')" style="width: 90px">取消</a>
	</div>

	<div id="dlg-edit-role" class="easyui-dialog" data-options="iconCls:'icon-save',resizable:true,modal:true" style="width: 400px; height: 280px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons-edit-role">
		<div class="ftitle">角色设置</div>
		<form id="fm-edit-role" action="${ctx}/api/user/update" method="post">
			<div class="fitem">
				<label>角色:</label> <select class="easyui-combobox" name="roles" style="width: 170px; height: 50px"
					data-options="
                    url:'${ctx}/api/role/all',
                    method:'get',
                    valueField:'id',
                    textField:'name',
                    panelHeight:'auto',
                    multiline:true,
                    multiple:true"></select>
			</div>
		</form>
	</div>
	<div id="dlg-buttons-edit-role">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" style="width: 90px">确定</a> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
			onclick="javascript:$('#dlg-edit-role').dialog('close')" style="width: 90px">取消</a>
	</div>
</body>
</html>