$(document).ready(function(){
	$.ajax({
		url:"http://nov:8080/ipet/getAdminPagerServlet",
		type:"POST",
		success:function(msg){
			var res = $.parseJSON(msg);
			console.log(res);
			$(".dg").datagrid({
				data:res,
				fitColumns:true,
				striped:true,
				rownumbers:true,
				pagination:true,
				title:"管理员管理",
				pageSize:10,
				loadFilter:pagerFilter,
				rownumbers:"true",
				columns:[[
				    {field:'id',width:150,title:'ID',align:'center'},
					{field:'adminType',width:150,title:'管理员类别',align:'center'},
					{field:'loginName',width:200,title:'登录名',align:'center'},
					{field:'loginPwd',width:200,title:'密码',align:'center'},
					{field:'adminName',width:200,title:'管理员姓名',align:'center'},
					{field:'flag1',align:'center',formatter: function(f21,res){
						return "<a href='updateAdminInfo.html?id="+res.id+"' >修改</a>";
					}},
					{field:'flag4',align:'center',formatter: function(f2,res){
						return "<a href='javascript:deleteAdmin("+res.id+")' >删除</a>";
					}}
				]]
				
			})
		}
	})
	
})

function deleteAdmin(id){
	window.confirm("确认删除管理员？");
	$.ajax({
		url:"http://nov:8080/ipet/deleteAdmin",
		type:"POST",
		data:{
			"adminIds":id
		},
		success:function(msg){
			window.alert(msg);
			window.location.reload(true);
		}
	})
}





