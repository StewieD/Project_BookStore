<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Change Password</title>
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
<%
String absolutePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>

</head>
<style>
.red {
	color: red;
}

.green {
	color: green;
}
</style>
<!--  Start script of timeout redirect to homepage after 5s -->
<script>
	var timeout = 5; //set time here 5sec
	function timer() {
		if (--timeout > 0) {
			document.forma.clock.value = timeout;
			window.setTimeout("timer()", 1000);
		} else {
			document.forma.clock.value = "Time over";
			///disable submit-button etc 
		}
		if (document.forma.clock.value == "Time over") {
			top.document.location.replace('../index.jsp'); //redirect page url
		}
	}
</script>
<!--  End script of timeout redirect to homepage after 5s -->
<body>
	<!-- Navbar -->
	<%@include file="../header.jsp"%>
	<!-- End Navbar -->
	<%
	Object object1 = session.getAttribute("khachHang");
	KhachHang khachHang1 = null;
	if (object1 != null) {
		khachHang1 = (KhachHang) object1;
	}
	if (khachHang1 == null) {
	%><h1>Bạn chưa đăng nhập hệ thống vui lòng về trang chủ</h1>
	<%
	} else {
	%>
	<%
	String error = request.getAttribute("error") + "";
	error = (error.equals("null")) ? "" : error;
	String success = request.getAttribute("success") + "";
	success = (success.equals("null")) ? "" : success;
	%>
	<div class="container ">
		<h1>Change PassWord</h1>

		<!--  Start timeout redirect to homepage after 5 seconds -->
		<%
		if (success.length() > 0) {
		%>
		<form name="forma">
			<%
			String clock = null;
			%>
			You will go to homepage after:<input type="text" size='1'
				name="clock" value="<%=clock%>" style="border: 1px solid white">seconds
			<script>
				timer(); //calljs timer()
			</script>
		</form>
		<%
		}
		%>
		<!-- 	End	timeout redirect to homepage after 5 seconds -->

		<span class="red"><%=error%></span>
		<div class="bg-success text-white"><%=success%>
		</div>

		<form action="<%=absolutePath%>/khachhangcontroller" method="post">
			<input type="hidden" name="action" value="changepassword">
			<div class="mb-1">
				<label for=" password" class="form-label">Old password </label> <input
					type="password" class="form-control" id="oldpassword"
					name="oldpassword" placeholder="Mật khẩu Cũ"
					onkeyup="kiemTraMoiCu()" required>
			</div>
			<div class="mb-1">
				<label for="password" class="form-label">New password </label> <input
					type="password" class="form-control" id="newpassword"
					name="newpassword" placeholder="Mật khẩu Mới"
					onkeyup="kiemTraMoiCu()" required>
				<div class="red" id="msg-oldnew"></div>
			</div>

			<div class="mb-1">
				<label for="password2" class="form-label">Confirm new
					password </label> <input type="password" class="form-control"
					id="newpassword2" name="newpassword2"
					placeholder="Nhập lại mật khẩu mới" required
					onkeyup="kiemTraMatKhau()">
				<div class="red" id="msg"></div>
			</div>
			<button class=" btn btn-lg btn-outline-dark" type="submit">Update
				password</button>
		</form>
	</div>
	<%
	}
	%>
	<!-- Footer -->
	<jsp:include page="../footer.jsp"/>
	<!-- End Footer -->
</body>
<script>
	function kiemTraMatKhau() {
		matKhau = document.getElementById("newpassword").value
		matKhauNhapLai = document.getElementById("newpassword2").value;
		if (matKhau != matKhauNhapLai) {
			document.getElementById("msg").innerHTML = "Mật khẩu Không Khớp";
			return false;
		} else {
			document.getElementById("msg").innerHTML = "";
			return true;
		}
	}
	function kiemTraMoiCu() {
		matKhauMoi = document.getElementById("newpassword").value;
		matKhauCu = document.getElementById("oldpassword").value;
		if (matKhauMoi == matKhauCu && matKhauMoi.length > 0) {
			document.getElementById("msg-oldnew").innerHTML = "New password must be different!";
			return false;
		} else {
			document.getElementById("msg-oldnew").innerHTML = "";
			return true;
		}
	}
</script>
</html>