$(document).ready(function(){
	$("#dg").datagrid({
		url:"http://nov:8080/ipet/getAllInformServlet",
		fitColumns:true,
		striped:true,
		rownumbers:true,
		pagination:true,
		title:"公告管理",
		pageSize:10,
		loadFilter:pagerFilter,
		rownumbers:"true",
		columns:[[
			{field:'informId',title:'公告ID',width:60,align:'center'},
			{field:'informTitle',title:'公告标题',width:150,align:'center'},
			{field:'informContent',title:'公告内容',width:300,align:'center'},
			{field:'informTime',title:'发布时间',width:200,align:'center'},
			{field:'flag4',width:100,align:'center',formatter: function(f2,res){
					return "<a href='javascript:deleteInform("+res.informId+")' >删除</a>";
			}}
		]]
		
	})
})

function deleteInform(informId){
	$.ajax({
		url:"http://nov:8080/ipet/deleteInformServlet",
		type:"POST",
		data:{
			informId:informId
		},
		success:function (msg){
			window.alert(msg);
			window.location.reload(true);
		}
	})
}

