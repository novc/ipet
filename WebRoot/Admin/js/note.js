$(document).ready(function(){
	$("#dg").datagrid({
		url:"http://nov:8080/ipet/getNoteServlet",
		fitColumns:true,
		striped:true,
		rownumbers:true,
		pagination:true,
		title:"留言管理",
		pageSize:10,
		loadFilter:pagerFilter,
		rownumbers:"true",
		columns:[[
			{field:'id',title:'留言ID',width:60,align:'center'},
			{field:'title',title:'标题',width:150,align:'center'},
			{field:'author',title:'作者',width:300,align:'center'},
			{field:'content',title:'内容',width:200,align:'center'},
			{field:'ly_time',title:'留言时间',width:200,align:'center'},
			
			{field:'flag4',width:100,align:'center',formatter: function(f2,res){
					return "<a href='javascript:deleteNote("+res.id+")' >删除</a>";
			}}
		]]
		
	})
})

function deleteNote(id){
	$.ajax({
		url:"http://nov:8080/ipet/deleteNoteServlet",
		type:"POST",
		data:{
			"noteId":id
		},
		success:function(msg){
			window.alert(msg);
			window.location.reload(true);
		}
	})
}





