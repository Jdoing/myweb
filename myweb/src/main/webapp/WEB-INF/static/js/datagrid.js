;
$(function() {

	$('a[iconCls=icon-add]').click(doSave);
	$('a[iconCls=icon-edit]').click(doEdit);
	$('a[iconCls=icon-remove]').click(doDelete);

	var url;
	function doSave() {
		$('#dlg').dialog('open').dialog('center').dialog('setTitle', '增加');
		$('#fm').form('clear');
		url = $(this).attr('url');

		return false;
	}

	function doEdit() {
		var selectRow = $('#dg').datagrid('getSelected');

		var href = $(this).attr('href');
		if (selectRow) {
			$('#fm').form('load', href + selectRow.id);

			$('#dlg').dialog('open').dialog('center').dialog('setTitle', '修改');

			url = $(this).attr('url') + selectRow.id;
		} else
			$.messager.alert('操作提示', '请选择要编辑的行', 'warning');

		return false;
	}

	function doDelete() {
		var selectRow = $('#dg').datagrid('getSelected');
		url = $(this).attr('url');
		if (selectRow) {
			$.messager.confirm('确认', '你确定删除吗?', function(r) {
				if (r) {
					$.post(url, {
						id : selectRow.id
					}, function(result) {
						if (result == "OK") {
							$.messager.alert('操作提示', '操作成功!', 'info');
							$('#dlg').dialog('close');
							$('#dg').datagrid('reload');
						} else {
							$.messager.alert('操作提示', '操作失敗!', 'error');
							$('#dlg').dialog('close');
						}
					}, 'text');
				}
			});
		} else
			$.messager.alert('操作提示', '请选择要删除的行', 'warning');

		return false;
	}

	$('#dlg-buttons > a:first').click(function() {

		$('#fm').form('submit', {
			url : url,
			onSubmit : function(param) {
				return $(this).form('validate');
			},
			success : function(result) {
				if (result == "OK") {
					$.messager.alert('操作提示', '操作成功!', 'info');
					$('#dlg').dialog('close');
					$('#dg').datagrid('reload');
				} else {
					$.messager.alert('操作提示', '操作失敗!', 'error');
					$('#dlg').dialog('close');
				}

			}
		});

	});

});