<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色列表</title>
<!-- JQuery -->
<script type="text/javascript" src="${ctx}/static/lib/jquery/jquery-1.11.3.min.js"></script>
<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx}/static/lib/jquery-easyui-1.4.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/lib/jquery-easyui-1.4.3/themes/icon.css">
<script type="text/javascript" src="${ctx}/static/lib/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>

<script type="text/javascript" src="${ctx}/static/js/role.js"></script>
<style type="text/css">
#fm {
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
	<table id="role-grid" class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'id',width:80">角色ID</th>
				<th data-options="field:'name',width:100">角色名</th>
				<th data-options="field:'role',width:100,align:'right'">角色标识</th>
				<th data-options="field:'description',width:80,align:'center'">角色描述</th>
			</tr>
		</thead>
	</table>

	<div id="dlg" class="easyui-dialog" data-options="iconCls:'icon-save',resizable:true,modal:true"
		style="width: 400px; height: 280px; padding: 10px 20px" closed="true" buttons="#dlg-buttons">
		<div class="ftitle">增加角色</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
				<label>角色名:</label> <input name="name" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>角色标识:</label> <input name="role" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>角色描述:</label> <input name="description" class="easyui-textbox">
			</div>

		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" style="width: 90px">Save</a> <a href="javascript:void(0)"
			class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width: 90px">Cancel</a>
	</div>

	<div id="dlg-auth" class="easyui-dialog" data-options="iconCls:'icon-save',resizable:true,modal:true"
		style="width: 400px; height: 280px; padding: 10px 20px" closed="true" buttons="#btn-group-auth">
		<form id="fm-auth" method="post" novalidate>
			<div class="fitem">
				<label>资源:</label><input id="sel-resource" class="easyui-combobox" name="resource" style="width: 200px;">
			</div>
			
			<div class="fitem">
				<label>操作权限:</label><input id="sel-operation" class="easyui-combobox" name="operations" style="width: 200px;height:50px">
			</div>
		</form>

	</div>

	<div id="btn-group-auth">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" style="width: 90px">Save</a> <a href="javascript:void(0)"
			class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg-auth').dialog('close')" style="width: 90px">Cancel</a>
	</div>


</body>
</html>