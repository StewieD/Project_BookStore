<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error403</title>
</head>
<body>
<% String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();%>
<h1>Error Forbidden</h1>
<img alt="Error Forbidden" style="width=100%" src="<%=path%>/img/Error 500.png">
</body>
</html>