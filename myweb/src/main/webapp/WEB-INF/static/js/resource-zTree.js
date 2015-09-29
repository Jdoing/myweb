//;
//$(function() {

var setting = {
	check : {
		enable : true,
		chkboxType : {
			"Y" : "",
			"N" : ""
		}
	},
	view : {
		dblClickExpand : false
	},
	data : {
		simpleData : {
			enable : true
		}
	},
	callback : {
		beforeClick : beforeClick,
		onCheck : onCheck
	}
};

function beforeClick(treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	zTree.checkNode(treeNode, !treeNode.checked, null, true);
	return false;
}

function onCheck(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree
			.getCheckedNodes(true), v = "";
	for (var i = 0, l = nodes.length; i < l; i++) {
		v += nodes[i].name + ",";
	}
	if (v.length > 0)
		v = v.substring(0, v.length - 1);
	var cityObj = $("#citySel");
	cityObj.attr("value", v);
}

function showMenu() {
	var cityObj = $("#citySel");
	var cityOffset = $("#citySel").offset();
	$("#menuContent").css({
		left : cityOffset.left + "px",
		top : cityOffset.top + cityObj.outerHeight() + "px"
	}).slideDown("fast");

	$("body").bind("mousedown", onBodyDown);
}
function hideMenu() {
	$("#menuContent").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!(event.target.id == "menuBtn" || event.target.id == "citySel"
			|| event.target.id == "menuContent" || $(event.target).parents(
			"#menuContent").length > 0)) {
		hideMenu();
	}
}

var zNodes = [];

$(function() {
	$.ajax({
		url : '/myweb/api/resource/list',
		type : 'GET',
		async : false,
		dataType : "json",
		success : function(data) {
			$.each(data, function(i, v) {
				zNodes.push({
					id : v.id,
					pId : v.parentId,
					name : v.name
				});
			});

		},

	});

	$.fn.zTree.init($("#treeDemo"), setting, zNodes);

})

// });
