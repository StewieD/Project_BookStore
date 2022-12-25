<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error 500</title>
</head>
<body>
<% String path= request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); %>
	<h1 style="text-align: center">Rất tiếc hệ thóng gặp lỗi vui lòng về lại trang chủ </h1>
	<img alt="Error 500" width=100% src="<%=path %>/img/Error 500.png">
</body>
</html>