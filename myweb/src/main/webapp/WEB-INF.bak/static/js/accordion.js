;
(function($) {
	function click_dt() {
		$(this).nextUntil('dt').slideDown('fast');
		$(this).siblings('dt').nextUntil('dt').slideUp('fast');

	}

	function click_dd() {
		$(this).addClass('highlight').siblings('dd').removeClass('highlight');
		$(this).children('a').addClass('select');
		$(this).siblings('dd').children('a').removeClass('select');

		$(this).children('a').click();

		return false;
	}

	function click_a() {

		var url = $(this).attr('href');

		var count = 1;
		var iframe_id = "iframe-tab-" + count;
		var $iframe = $('<iframe id="' + iframe_id + '"</iframe>');

		$iframe.attr({
			'src' : url,
			'class' : 'layout-iframe'
		});

		$('#iframe-tab-0').after($iframe);
		$iframe.siblings('iframe').hide();

		$('.tabs').tabs('add');

		return false;
	}

	var count = 0;
	function click_aaa() {
		var url = $(this).attr('href');

		$nav = $('.tabs > li:last').clone(true).appendTo('.tabs');
		$nav.children('a').text('欢迎使用' + ++count);

		console.log($nav.children('a').text());

		var tabX = $('.tabs').offset().left;
		var navX = $nav.offset().left;

		console.log('tabX is ' + tabX);
		console.log('navX is ' + navX);
		console.log('total is:' + $('#nav-div-id').width());
		console.log((navX - tabX + 100));
		// if ((navX - tabX + 100) > $('#nav-div-id').width()) {

		console.log(count);
		if (count > 7) {
			// alert("ooo");
			$('.tabs > li').each(function() {
				$(this).animate({
					left : "-=100px"
				}, 1000);
			});

		}

		return false;
	}

	function click_aa() {
		var url = $(this).attr('href');

		var count = 1;
		var iframe_id = "iframe-tab-" + count;
		var $iframe = $('<iframe id="' + iframe_id + '"</iframe>');

		$iframe.attr({
			'src' : url,
			'class' : 'layout-iframe'
		});

		$('#iframe-tab-0').after($iframe);
		$iframe.siblings('iframe').hide();

		return false;
	}

	var methods = {
		init : function(options) {
			return this.each(function() {
				var $this = $(this);

				$this.children('dd').hide();

				// 给dd绑定事件
				$this.children('dt').click(click_dt);

				$this.children('dd').click(click_dd);

				$this.find('a').click(click_a);

				$this.children('dt:first').nextUntil('dt').slideDown('fast');
				// 给a绑定事件
				// $this.find('a').click(function(){
				// $(this).parent().addClass('highlight');
				// $(this).parent().siblings('dd').removeClass('highlight');
				// $(this).addClass('select');
				// $(this).parent().siblings('dd').children('a').removeClass('select');
				// return false;
				// });

				// $this.children('dd').click(function() {
				// $(this).addClass('highlight').siblings('dd').removeClass('highlight');
				// $(this).children('a').addClass('select');
				// $(this).siblings('dd').children('a').removeClass('select');
				// });

			});

		},

		destroy : function(options) {

		},
	};

	$.fn.accordion = function() {
		var method = arguments[0];

		if (methods[method]) {
			method = methods[method];
			arguments = Array.prototype.slice.call(arguments, 1);
		} else if (typeof (method) == 'object' || !method) {
			method = methods.init;
		} else {
			$.error('Method ' + method + ' does not exist on jQuery.accordion');
			return this;
		}

		return method.apply(this, arguments);

	};

})(jQuery);
