;
$(function() {
	$('.accordion').accordion();
	$('.tabs').tabs();

	$('.btn-add').click(function() {
		alert("cc");
		var count = 1;
		var iframe_id = "iframe-tab-" + count;
		var $iframe = $('<iframe id="' + iframe_id + '"</iframe>');

		var url = "/myweb/api/user/add";
		$iframe.attr({
			'src' : url,
			'class' : 'layout-iframe'
		});

		$('iframe:last').after($iframe);
		$iframe.siblings('iframe').hide();

		return false;
	});

});
