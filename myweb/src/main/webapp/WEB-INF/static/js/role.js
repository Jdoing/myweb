;
$(function() {

	$('#role-grid').datagrid(
			{
				fit : true,
				singleSelect : true,
				url : '/myweb/api/role/all',
				method : 'get',
				// toolbar : '#tb',
				toolbar : [
						{
							text : '增加',
							iconCls : 'icon-add',
							plain : "true",

							handler : function() {
								openDialog();
							}
						},
						'-',
						{
							iconCls : 'icon-edit',
							plain : "true",
							text : '授权',
							handler : function() {
								var selecRow = $('#role-grid').datagrid(
										'getChecked');
								// alert(selecRow[0].name);
								$('#dlg-auth').dialog('open').dialog('center')
										.dialog('setTitle',
												'Role authorization');
								$('#fm-auth').form('clear');
							}
						},

						'-',
						{
							text : '删除',
							iconCls : 'icon-remove',
							plain : "true",
							handler : function() {
								var selectRow = $('#role-grid').datagrid(
										'getSelected');
								$.ajax({
									type : 'DELETE',
									url : '/myweb/api/role/delete?id' + '='
											+ selectRow.id,
									success : function(result) {
										if (result == "OK") {
											$('#dlg').dialog('close'); // close
											$('#role-grid').datagrid('reload'); // reload
										} else
											alert("fail: " + result);
									},
									error : function(XMLHttpRequest,
											textStatus, errorThrown) {
										alert(XMLHttpRequest.status);
										alert(XMLHttpRequest.readyState);
										alert(textStatus);
									}
								});

							}
						}

				]

			});

	function openDialog() {
		$('#dlg').dialog('open').dialog('center')
				.dialog('setTitle', 'New Role');
		$('#fm').form('clear');
	}

	$('#dlg-buttons > a:first').click(function() {
		$('#fm').form('submit', {
			url : '/myweb/api/role/save',
			onSubmit : function(param) {
				// param.roles = [ 1, 2 ];
				return $(this).form('validate');
			},
			success : function(result) {
				if (result == "OK") {
					$('#dlg').dialog('close'); // close the dialog
					$('#role-grid').datagrid('reload'); // reload the user
					// data
				} else
					alert("fail: " + result);
			}
		});
	});

	$('#sel-resource').combobox({
		url : '/myweb/api/resource/list',
		method : 'get',
		valueField : 'id',
		textField : 'name',

	});

	$('#sel-operation').combobox({
		url : '/myweb/api/operation/list',
		method : 'get',
		valueField : 'id',
		textField : 'name',
		multiple : true,
		multiline : true,
	});

	$('#btn-group-auth > a:first').click(function() {
		$('#fm-auth').form('submit', {
			url : '/myweb/api/role/auth',
			onSubmit : function(param) {
				var selecRow = $('#role-grid').datagrid('getChecked');

				param.roleId = selecRow[0].id;
				return $(this).form('validate');
			},
			success : function(result) {
				if (result == "OK") {
					$('#dlg-auth').dialog('close'); // close the dialog
					$('#role-grid').datagrid('reload'); // reload the user
				} else
					alert("fail: " + result);
			}
		});
	});
});