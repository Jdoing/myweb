;
$(function() {
	var setting = {
		view : {
			addHoverDom : addHoverDom,
			removeHoverDom : removeHoverDom,
			selectedMulti : false
		},
		edit : {
			enable : true,
			editNameSelectAll : true,
			showRemoveBtn : true,
			showRenameBtn : true
		},
		data : {
			simpleData : {
				enable : true
			}
		},
		callback : {
			beforeEditName : beforeEditName,
			beforeRemove : beforeRemove,
			beforeRename : beforeRename,
			onRemove : onRemove,
			onRename : onRename,
			beforeClick : true,
			onClick : onClick
		}
	};

	function beforeEditName(treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj(treeId);
		zTree.selectNode(treeNode);
		return confirm("进入节点 : " + treeNode.name + " 的编辑状态吗？");
	}
	function beforeRemove(treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj(treeId);
		zTree.selectNode(treeNode);
		return confirm("确认删除 节点 : " + treeNode.name + " 吗？");
	}
	function onRemove(e, treeId, treeNode) {
		alert(treeNode.tId + ", " + treeNode.name);

	}
	function beforeRename(treeId, treeNode, newName, isCancel) {
		if (newName.length == 0) {
			alert("节点名称不能为空.");
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			setTimeout(function() {
				zTree.editName(treeNode)
			}, 10);
			return false;
		}
		return true;
	}
	function onRename(e, treeId, treeNode, isCancel) {
	}
	function showRemoveBtn(treeId, treeNode) {
		return !treeNode.isFirstNode;
	}
	function showRenameBtn(treeId, treeNode) {
		return !treeNode.isLastNode;
	}
	function getTime() {
		var now = new Date(), h = now.getHours(), m = now.getMinutes(), s = now
				.getSeconds(), ms = now.getMilliseconds();
		return (h + ":" + m + ":" + s + " " + ms);
	}

	var newCount = 1;
	function addHoverDom(treeId, treeNode) {
		var sObj = $("#" + treeNode.tId + "_span");
		if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0)
			return;
		var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
				+ "' title='add node' onfocus='this.blur();'></span>";
		sObj.after(addStr);
		var btn = $("#addBtn_" + treeNode.tId);
		if (btn)
			btn.bind("click", function() {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.addNodes(treeNode, {
					id : (100 + newCount),
					pId : treeNode.id,
					name : "new node" + (newCount++)
				});
				return false;
			});
	}

	function removeHoverDom(treeId, treeNode) {
		$("#addBtn_" + treeNode.tId).unbind().remove();
	}

	function onClick(event, treeId, treeNode) {
		var id = treeNode.id;
		$.ajax({
			async : false,
			type : "GET",
			url : "http://localhost:8080/myweb/api/resource/" + id,
			dataType : "json",
			success : function(data) {
				if (data) {
					$('form input[name=name]').val(data.name);
					$('form input[name=identity]').val(data.identity);
					$('form input[name=url]').val(data.url);
				} else {
					alert("get data fail!");
				}
			}
		});

	}

	var zNodes = [];

	$(document).ready(function() {
		$.ajax({
			async : false,
			type : "GET",
			url : "http://localhost:8080/myweb/api/resource/resource",
			dataType : "json",
			success : function(data) {
				if (data) {
					$.each(data, function(i, v) {
						console.log(v.name);
						zNodes.push({
							id : v.id,
							pId : v.parentId,
							name : v.name,
							url : v.url
						});
					});

				} else {
					alert("get data fail!");
				}

			}
		});

		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		$.fn.zTree.getZTreeObj("treeDemo").expandAll(true);

	});
});