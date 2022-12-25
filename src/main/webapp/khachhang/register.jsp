<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Register</title>
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
<style type="text/css">
.red {
	color: red;
}
</style>
<%
String absolutePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>

</head>
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
	if (khachHang != null) {
	%><h1>Bạn đã đăng nhập hệ thống vui lòng về trang chủ</h1>
	<%
	} else {
	String baoLoi = request.getAttribute("baoLoi") + "";
	baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;

	String username = request.getAttribute("username") + "";
	username = (username.equals("null")) ? "" : username;

	String password = request.getAttribute("password") + "";
	password = (password.equals("null")) ? "" : password;

	String password2 = request.getAttribute("password2") + "";
	password2 = (password2.equals("null")) ? "" : password2;

	String hoVaTen = request.getAttribute("hoVaTen") + "";
	hoVaTen = (hoVaTen.equals("null")) ? "" : hoVaTen;

	String gioiTinh = request.getAttribute("gioiTinh") + "";
	baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;

	String ngaySinh = request.getAttribute("ngaySinh") + "";
	ngaySinh = (ngaySinh.equals("null")) ? "" : ngaySinh;

	String diaChi = request.getAttribute("diaChi") + "";
	diaChi = (diaChi.equals("null")) ? "" : diaChi;

	String diaChiNhanHang = request.getAttribute("diaChiNhanHang") + "";
	diaChiNhanHang = (diaChiNhanHang.equals("null")) ? "" : diaChiNhanHang;

	String email = request.getAttribute("email") + "";
	email = (email.equals("null")) ? "" : email;

	String dienThoai = request.getAttribute("dienThoai") + "";
	dienThoai = (dienThoai.equals("null")) ? "" : dienThoai;

	String dieukhoan = request.getAttribute("dieukhoan") + "";
	dieukhoan = (dieukhoan.equals("null")) ? "" : dieukhoan;

	String dongYNhapEmail = request.getAttribute("dongYNhapEmail") + "";
	dongYNhapEmail = (dongYNhapEmail.equals("null")) ? "" : dongYNhapEmail;
	
	%>
	
	<div class="container">
		<form action="<%=absolutePath%>/khachhangcontroller">
			<input type="hidden" name="action" value="register">
			<div class="row">
				<div class="col-md-6">
					<h3 style="text-align: center;">Tài Khoản</h3>
					<div class="mb-1">
						<label for="username" class="form-label">User Name <span
							class="red">*</span>
						</label> <input type="text" class="form-control" id="username"
							name="username" placeholder="Username" value="<%=username%>"
							required>

					</div>
					<div class="mb-1">
						<label for="" password" class="form-label">mật khẩu <span
							class="red">*</span></label> <input type="password" class="form-control"
							id="password" name="password" placeholder="Mật khẩu" required
							onkeyup="kiemTraMatKhau()"><i class="bi bi-eye-slash"
							id="togglePassword"></i>

					</div>
					<div class="mb-1">
						<label for="password2" class="form-label">Nhập lại mật
							khẩu <span class="red">*</span>
						</label> <input type="password" class="form-control" id="password2"
							name="password2" placeholder="Nhập lại mật khẩu" required
							onkeyup="kiemTraMatKhau()">
						<div class="red" id="msg"></div>
					</div>


					<h3 style="text-align: center;">Thông tin khách hàng</h3>
					<div class="mb-1">
						<label for="hoVaTen" class="form-label">Họ và tên <span
							class="red">*</span></label> <input type="text" class="form-control"
							id="hoVaTen" name="hoVaTen" placeholder="Họ và tên"
							value="<%=hoVaTen%>" required>
					</div>
					<div class="mb-1">
						<label for="gioiTinh" class="form-label">Giới tính </label> <select
							class="form-control" id="gioiTinh" name="gioiTinh">
							<option></option>
							<option value="Nam"
								<%=(gioiTinh.equals("Nam")) ? "selected" : ""%>>Nam</option>
							<option value="Nu" <%=(gioiTinh.equals("Nu")) ? "selected" : ""%>>Nữ</option>
						</select>
					</div>
					<div class="mb-1">
						<label for="ngaySinh" class="form-label">Ngày Sinh </label> <input
							type="Date" class="form-control" id="ngaySinh" name="ngaySinh"
							value="<%=ngaySinh%>">
					</div>
				</div>
				<div class="col-md-6">
					<h3 style="text-align: center;">Thông tin liên lạc</h3>
					<div class="mb-1">
						<label for="diaChi" class="form-label">Địa Chỉ <span
							class="red">*</span></label> <input type="text" class="form-control"
							id="diaChi" name="diaChi" value="<%=diaChi%>" required>
					</div>
					<div class="mb-1">
						<label for="diaChiNhanHang" class="form-label">Địa Chỉ
							Nhận Hàng </label> <input type="text" class="form-control"
							id="diaChiNhanHang" name="diaChiNhanHang"
							value="<%=diaChiNhanHang%>">
					</div>
					<div class="mb-1">
						<label for="email" class="form-label">email <span id="red">*</span></label>
						<input type="text" class="form-control" id="email" name="email"
							value="<%=email%>" required>
					</div>
					<div class="mb-1">
						<label for="dienThoai" class="form-label">Điện thoại <span
							id="red">*</span></label></label> <input type="text" class="form-control"
							id="dienThoai" name="dienThoai" value="<%=dienThoai%>" required>
					</div>
					<div class="mb-1">
						<label for="dieukhoan" class="form-label">Đồng ý với <a>điền
								khoản của công ty</a> <span class="red">*</span></label> <input
							type="checkbox" class="form-check-input" id="dieukhoan"
							name="dieukhoan" onchange="xuLyChonDongY()" required>
					</div>
					<div class="mb-1">
						<label for="dongYNhapEmail" class="form-label">Đồng ý nhận
							email</label> <input type="checkbox" class="form-check-input"
							id="dongYNhapEmail" name="dongYNhapEmail"
							<%=(dongYNhapEmail.equals("on")) ? "checked" : ""%>>
					</div>
					<input type="submit" id="submit"
						class="btn btn-outline-dark form-control " value="Đăng ký"
						style="visibility: hidden">
				</div>
			</div>
		</form>
	</div>
	<%} %>
	<!-- Footer -->
	<jsp:include page="../footer.jsp" />
	<!-- End Footer -->
</body>
<script>
	function kiemTraMatKhau() {
		matKhau = document.getElementById("password").value
		matKhauNhapLai = document.getElementById("password2").value;
		if (matKhau != matKhauNhapLai) {
			document.getElementById("msg").innerHTML = "Mật khẩu Không Khớp";
			return false;
		} else {
			document.getElementById("msg").innerHTML = "";
			return true;
		}
	}
	function xuLyChonDongY() {

		dongYDieuKhoan = document.getElementById("dieukhoan");
		if (dongYDieuKhoan.checked == true) {
			document.getElementById("submit").style.visibility = "visible";
		} else {
			document.getElementById("submit").style.visibility = "hidden";
		}
	}
</script>
</html>