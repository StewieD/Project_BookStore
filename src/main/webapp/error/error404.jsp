<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error 404</title>
</head>
<body>
	<% String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); %>
	<h1 style = "text-align: center"> Rất tiếc trang bạn tìm không tồn tại</h1>
	<img alt="Error 404"  width=100% src="<%=path%>/img/Error 404 Not Found.png">
</body>
</html>