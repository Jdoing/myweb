;(function($) {

	var methods = {
		init : function(options) {
			var $this = $(this);
			return $this.each(function() {
				var $this = $(this);
				var settings = $this.data('tabs');

				if ( typeof (settings) == 'undefined') {
					var defaults = {
						count : 0,
						onSomeEvent : function() {
						}
					};

					settings = $.extend({}, defaults, options);
					$this.data('tabs', settings);
				} else {
					settings = $.extend({}, settings, options);
				}

			});

		},

		add : function(options) {
			var $this = $(this);
			return $this.each(function() {
				//var $this = $(this);
				$nav = $(this).children('li:last').clone(true);
				$(this).append($nav);

				$nav.children('a').addClass('active');
				$nav.siblings('li').children('a').removeClass('active');

				$nav.children('a').text('欢迎使用' + ++$this.data('tabs').count);

				if ($this.data('tabs').count > 7) {
					$(this).children('li').each(function() {
						$(this).animate({
							left : "-=102px"
						}, 'fast');
					});

				}

				return false;
			});

		},

		destroy : function(options) {
			return $(this).each(function() {
				var $this = $(this);
				$this.removeData('pluginName');
			});
		},

		val : function(options) {
			var someValue = this.eq(0).html();

			return someValue;
		},
	};

	$.fn.tabs = function() {
		var method = arguments[0];

		if (methods[method]) {
			method = methods[method];
			arguments = Array.prototype.slice.call(arguments, 1);
		} else if ( typeof (method) == 'object' || !method) {
			method = methods.init;
		} else {
			$.error('Method ' + method + ' does not exist on jQuery.tabs');
			return this;
		}

		return method.apply(this, arguments);
	};

})(jQuery);
