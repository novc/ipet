//返回上一页
function cancle(){
	window.history.go(-1);
}
//获取地址栏传递的参数 name 是目标参数名
function getUrlPara(name){
	var paraStr = window.location.search.substr(1);
	var arr = paraStr.split("&");
	var res = {};
	for (var i in arr){
		var para =  arr[i].split("=");
		var name = para[0];
		res[name]=para[1]
	}
	if(res[name]){
		return res[name];
	}else{
		return;
	}
	
}

/* 分页功能的实现 */
function pagerFilter(data){
	if (typeof data.length == 'number' && typeof data.splice == 'function'){	// is array
		data = {
			total: data.length,
			rows: data
		}
	}
	var dg = $(this);
	var opts = dg.datagrid('options');
	var pager = dg.datagrid('getPager');
	pager.pagination({
		onSelectPage:function(pageNum, pageSize){
			opts.pageNumber = pageNum;
			opts.pageSize = pageSize;
			pager.pagination('refresh',{
				pageNumber:pageNum,
				pageSize:pageSize
			});
			dg.datagrid('loadData',data);
		}
	});
	if (!data.originalRows){
		data.originalRows = (data.rows);
	}
	var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
	var end = start + parseInt(opts.pageSize);
	data.rows = (data.originalRows.slice(start, end));
	return data;
}


/*-----------------------公告管理-----------------------*/
function setUpdateInform(informId){
	if(window.sessionStorage){
		window.sessionStorage.setItem("updateInformId",informId);
		window.location.href="Admin/pages/updateInform.jsp";
	}else{
		console.log("session error");
	}
} //end of setUpdateInform


function updateInform(){
	$("form").attr("action","updateInformServlet?informId="+sessionStorage.getItem('updateInformId'));
	$("form").submit();
}


function removeInform(pageOffset,pageSize) {
	var deletes = document.getElementsByName("delete");
	var count = 0;
	var informs = new Array();
	for(var i = 0;i<deletes.length;i++) {
		if(deletes[i].checked) {
			count++;
			informs.push(deletes[i].value);
		}
	}
	if(count == 0) {
		alert("请选择要删除的项目");
		return false;
	}
	var oform = document.getElementsByTagName("form")[0];
	oform.action = "deleteInform?informIds="+informs+"&pageOffset="+pageOffset+"&pageSize="+pageSize;
	oform.submit();
}
