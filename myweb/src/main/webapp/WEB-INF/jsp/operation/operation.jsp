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

<script type="text/javascript" src="${ctx}/static/js/datagrid.js"></script>
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
<title>操作权限</title>
</head>
<body>
	<table id="dg" class="easyui-datagrid"  data-options="fit:true,singleSelect:true,url:'/myweb/api/operation/all',method:'get',toolbar:'#toolbar'">
		<thead>
			<tr>
				<th data-options="field:'id',width:80">编号</th>
				<th data-options="field:'name',width:80">操作名称</th>
				<th data-options="field:'operation',width:80">操作标识</th>
				<th data-options="field:'description',width:80">描述</th>
			</tr>
		</thead>


	</table>

    <div id="toolbar">
        <a href="javascript:void(0)" url="${ctx}/api/operation/save" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
        <a href="${ctx}/api/operation/" url="${ctx}/api/operation/update?id=" class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑</a>
        <a href="javascript:void(0)" url="${ctx}/api/operation/delete" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
    </div>

	<div id="dlg" class="easyui-dialog" data-options="iconCls:'icon-save',resizable:true,modal:true" style="width: 400px; height: 280px; padding: 10px 20px" closed="true" buttons="#dlg-buttons">
		<div class="ftitle">操作信息</div>
		<form id="fm" method="post">
			<div class="fitem">
				<label>操作名称:</label> <input name="name" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>操作标识:</label> <input name="operation" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>描述:</label> <input name="description" class="easyui-textbox">
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" style="width: 90px">Save</a> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
			onclick="javascript:$('#dlg').dialog('close')" style="width: 90px">Cancel</a>
	</div>


</body>
</html>