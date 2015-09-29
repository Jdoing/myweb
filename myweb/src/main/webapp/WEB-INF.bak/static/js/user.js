;
$(function() {

	$('.btn-add').click(function() {
		// alert("${ctx}");
		// window.location.href = "${ctx}/api/user/add";
		window.location.href = '/myweb/api/user/add';
	});

	$('button.btn-submit').click(function() {
		var $form = $(this).closest('form');
		$form.attr({
			'action' : '/myweb/api/user/save',
			'method' : 'post',
		});
		$form.submit();

	});

});
