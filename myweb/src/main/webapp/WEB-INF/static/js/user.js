;
$(function() {

	$('#tl-user-list').datagrid(
			{
				fit : true,
				rownumbers : false,
				singleSelect : true,
				url : '/myweb/api/user/all',
				method : 'get',
				toolbar : [
						{
							text : '增加用户',
							iconCls : 'icon-add',
							handler : function() {
								$('#dlg').dialog('open').dialog('center')
										.dialog('setTitle', 'New User');
								$('#fm').form('clear');
							}
						},
						'-',
						{
							text : '设置角色',
							iconCls : 'icon-edit',
							handler : function() {
								$('#dlg-edit-role').dialog('open').dialog(
										'center').dialog('setTitle', '设置角色');
								$('#fm-edit-role').form('clear');

							}

						}, '-', {
							text : '删除',
							iconCls : 'icon-remove',
							handler : function() {
								deleteUser();
							}
						}

				]

			});

	function deleteUser() {
		var selectRow = $('#tl-user-list').datagrid('getSelected');
		if (selectRow) {
			$.ajax({
				type : 'DELETE',
				url : '/myweb/api/user/' + selectRow.id,
				success : function(data) {
					if (data == "OK")
						$.messager.alert("Message", data, 'info');
					else
						$.messager.alert("Warning", data, 'error');

					$('#tl-user-list').datagrid('reload');
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					$.messager.alert("Warning", data, 'error');
				}
			});
		} else
			$.messager.alert("Warning", '请选择删除的行！', 'warning');

	}

	$('#btn-add').click(
			function() {
				// window.location.href = '/myweb/api/user/edit';
				$('#dlg').dialog('open').dialog('center').dialog('setTitle',
						'New User');
				$('#fm').form('clear');

			});

	$('#dlg-buttons > a:first').click(function() {

		$('#fm').form('submit', {
			url : '/myweb/api/user/save',
			onSubmit : function(param) {
				return $(this).form('validate');
			},
			success : function(result) {
				if (result == "OK") {
					$('#dlg').dialog('close'); // close the dialog
					$('#tl-user-list').datagrid('reload'); // reload the user
				} else
					alert("fail: " + result);
			}
		});

	});

	$('#dlg-buttons-edit-role > a:first').click(function() {
		$.messager.progress();

		$('#fm-edit-role').form('submit', {
			url : '/myweb/api/user/update',
			onSubmit : function(param) {
				param.userId = $('#tl-user-list').datagrid('getSelected').id;
				if (param.userId)
					return $(this).form('validate');
				else
					$.messager.alert('提示', '请选择编辑的行', 'warning');
			},
			success : function(result) {
				if (result == "OK") {
					$('#dlg-edit-role').dialog('close'); // close the dialog
					$('#tl-user-list').datagrid('reload'); // reload the user
				} else
					$.messager.alert("Warning", result, 'error');
				$.messager.progress('close');
			}
		});

	});

});
