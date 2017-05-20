
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
