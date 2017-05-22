$(document).ready(function(){
	$("#dg").datagrid({
		url:"http://nov:8080/ipet/getUserPagerServlet",
		fitColumns:true,
		striped:true,
		rownumbers:true,
		pagination:true,
		title:"用户管理",
		pageSize:10,
		loadFilter:pagerFilter,
		rownumbers:"true",
		columns:[[
		          
			{field:'id',title:'ID',align:'center'},
			{field:'name',title:'用户名',align:'center'},
			{field:'password',title:'密码',align:'center'},
			{field:'email',title:'邮箱',align:'center'},
			{field:'trueName',title:'收件人',align:'center'},
			{field:'sex',title:'性别',align:'center'},
			{field:'birthday',title:'生日',align:'center'},
			{field:'address',title:'地址',align:'center'},
			{field:'postcode',title:'邮编',align:'center'},
			{field:'phone',title:'电话号码',align:'center'},
			{field:'mphone',title:'手机号码',align:'center'},
			{field:'question',title:'密保问题',align:'center'},
			{field:'answer',title:'答案',align:'center'},
			{field:'flag4',align:'center',formatter: function(f2,res){
				return "<a href='javascript:deleteUser("+res.id+")' >删除</a>";
			}}
		]]
		
	})
})

function deleteUser(id){
	window.confirm("确认删除用户？");
	$.ajax({
		url:"http://nov:8080/ipet/deleteUser",
		type:"POST",
		data:{
			"userIds":id
		},
		success:function(msg){
			window.alert(msg);
			window.location.reload(true);
		}
	})
}





