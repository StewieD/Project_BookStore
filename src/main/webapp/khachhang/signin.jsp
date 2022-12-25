<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sign-In</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
	integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
	crossorigin="anonymous"></script>
<!-- Custom styles for this template -->
<%
String href = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>

<link href="<%=href%>/css/sign-in.css" rel="stylesheet">
<style type="text/css">
.red{
color: red;
}
</style>
</head>
<body>
	<% 
	String baoLoi = request.getAttribute("baoLoi")+"";
	baoLoi = (baoLoi.equals("null"))?"":baoLoi;
	%>
	<main class="form-signin w-100 m-auto">
		<form class="text-center" action="<%=href%>/khachhangcontroller" method="POST">
			<input type="hidden" name="action" value="signin">
			<img class="mb-3" src="<%=href%>/img/StewieD.png"
				alt="" width="90%">
			<h1 class="h3 mb-2 fw-normal">Please sign in</h1>
			<div><span class="red"><%=baoLoi %></span></div>
			<div class="form-floating">
				<input type="text" class="form-control" name="username" id="floatingInput"
					placeholder="Username"> <label for="floatingInput">Username
					</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" name="password"  id="floatingPassword"
					placeholder="Password"> <label for="floatingPassword">Password</label>
			</div>

			<div class="checkbox mb-2">
				<label> <input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div>
			<button class="w-100 btn btn-lg btn-outline-dark" type="submit">Sign
				in</button>
				New to Account? <a href="register.jsp" style="color:black;" >Create an account</a>
			<p class="mt-3 mb-1 text-muted">&copy; 2017–2022</p>
		</form>
	</main>
</body>
</html>