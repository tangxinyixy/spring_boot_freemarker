<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UPDATE</title>
</head>
<body>
		 <form action="${request.contextPath}/book" method="POST">
			
			<input type="hidden" name="_method" value="PUT" />
			<input type="hidden" name="id" value=${bookEntity.id} />
		
			姓名:<input id="name" name="name" type="text" value =${bookEntity.name} />
		
			年龄:<input id="age" name="age" type="text" value =${bookEntity.age} />
	
			地址:<input id="addr" name="addr" type="text" value =${bookEntity.addr} />
	
			<input type="reset" value="重置"><input type="submit" value="提交">
	</form>
</body>
</html>