<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ADD</title>
</head>
<body>
	 <form action="${request.contextPath}/book" method="POST">
		 
	姓名:<input id="name" name="name" type="text" />
	
	年龄:<input id="age" name="age" type="text" />
	
	地址:<input id="addr" name="addr" type="text" />
	
		<input type="reset" value="重置"><input type="submit" value="提交">
	</form>
</body>
</html>