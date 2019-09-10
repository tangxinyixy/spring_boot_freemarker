<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8"/>
	<title>列表页面</title>
	
	<script type="text/javascript" src="jquery/jquery-2.2.4.js" charset="utf-8"></script>
	
	<script type="text/javascript">
	function reload(){
        window.location.reload();
    }
    
    $(function(){
    	/* 删除 */
		$("a[name = deleteName]").click(function(){
			if(confirm("确定删除?")){
				var id = $(this).attr("id");
				$.ajax({
					url:"${request.contextPath}/book/"+id,
					type:"delete",
					dataType:"json",
					success:function(obj){
						if(obj.state == 1){
                             reload();
                             alert("删除成功");
						}
					},
					error:function(XMLHttpRequest,textStatus,errorThrown){
						alert("系统内部错误，请联系管理员！！！")
					}
				});
			}
		});
		/*
		$("#aa").click(function(){
    	var oBox = document.getElementById("data");
				var aInput = oBox.getElementsByTagName("input");
				
				for(var i = 0; i < aInput.length; i++) {
					aInput[i].checked = true;
				}
    });
    
    
    $("#bb").click(function(){
    alert(2);
    	var oBox = document.getElementById("data");
				var aInput = document.getElementsByTagName("input");
				for(var i = 0; i < aInput.length; i++) {
					aInput[i].checked = false;
				}
    });*/
    });
    
    
</script>
</head>
<body>
	<a href="${request.contextPath}/bookAdd">添加部门</a><a href="${request.contextPath}/downloadExcel">下载excle表</a>
	<table border="1" cellpadding="10" cellspacing="0" id="data">
		<tr>
			<!--<th>选择导出数据</th>-->
			<th>ID</th>
			<th>名字</th>
			<th>年龄</th>
			<th>地址</th>
			<th>修改</th>
			<th>删除</th>
		</tr>
		
		<#list list as books>
			<tr >
				<!--<td><input type="checkbox" />选我</td>-->
				<td>${books.id}</td>
				<td>${books.name}</td>
				<td>${books.age}</td>
				<td>${books.addr}</td>
				<td><a href="${request.contextPath}/selectId/${books.id}">修改</a></td>
				<td><a href='javascript:void(0)' name='deleteName' id="${books.id}" >删除</a></td>
			</tr>
		</#list>
		
	</table>
	<!--
	<input type="checkbox"  id="aa"/>全选
	<input type="checkbox" id="bb"/>全不选 -->
		
</body>
</html>