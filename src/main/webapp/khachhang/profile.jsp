<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Profile</title>
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
	if (khachHang == null) {
	%><h1>Bạn chưa đăng nhập hệ thống vui lòng về trang chủ</h1>
	<%
	} else {
	String hoVaTen = khachHang1.getHoVaTen();
	hoVaTen = (hoVaTen.equals("null")) ? "" : hoVaTen;
	String gioiTinh = khachHang1.getGioiTinh();
	gioiTinh = (gioiTinh.equals("null")) ? "" : gioiTinh;
	String ngaySinh = khachHang1.getNgaySinh() + "";
	ngaySinh = (ngaySinh.equals("null")) ? "" : ngaySinh;

	String diaChi = khachHang1.getDiaChi();
	diaChi = (diaChi.equals("null")) ? "" : diaChi;

	String diaChiNhanHang = khachHang1.getDiaChiNhanHang();
	diaChiNhanHang = (diaChiNhanHang.equals("null")) ? "" : diaChiNhanHang;

	String email = khachHang1.getEmail();
	email = (email.equals("null")) ? "" : email;

	String dienThoai = khachHang1.getSoDienThoai();
	dienThoai = (dienThoai.equals("null")) ? "" : dienThoai;

	String dongYNhapEmail = khachHang1.getDangKyEmail() + "";
	dongYNhapEmail = (dongYNhapEmail.equals("null")) ? "" : dongYNhapEmail;
	%>

	<div class="container">
		<div class="text-center">
			<form action="<%=absolutePath%>/khachhangcontroller"
				enctype="multipart/form-data" method="post">
				<%
				String fileName = request.getAttribute("fileName") + "";
				String success = request.getAttribute("success") + "";
				fileName = (fileName.equals("null")) ? "" : fileName;
				success = (success.equals("null")) ? "" : success;
				%>
				<input type="hidden" value="changeavatar" name="action">
				<div>
					<img alt="" class="mb-3" width="150" height="150"
						src='images/<%=fileName%>'>
				</div>
				<input type="file" class="form-control" name="image" id="image">
				<input class="form-control" type="submit" value="upload">
			</form>
			<div class="bg-success text-white m-2"><%=success%></div>
		</div>
		<form action="<%=absolutePath%>/khachhangcontroller">
			<div class="row">
				<div class="col-md-6">
					<input type="hidden" name="action" value="changeinfo">
					<h3 style="text-align: center;">Thông tin khách hàng</h3>
					<div class="mb-1">
						<label for="hoVaTen" class="form-label">Họ và tên </label> <input
							type="text" class="form-control" id="hoVaTen" name="hoVaTen"
							placeholder="Họ và tên" value="<%=hoVaTen%>">
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
						<label for="diaChi" class="form-label">Địa Chỉ </label> <input
							type="text" class="form-control" id="diaChi" name="diaChi"
							value="<%=diaChi%>">
					</div>
					<div class="mb-1">
						<label for="diaChiNhanHang" class="form-label">Địa Chỉ
							Nhận Hàng </label> <input type="text" class="form-control"
							id="diaChiNhanHang" name="diaChiNhanHang"
							value="<%=diaChiNhanHang%>">
					</div>
					<div class="mb-1">
						<label for="email" class="form-label">email </label> <input
							type="text" class="form-control" id="email" name="email"
							value="<%=email%>" required>
					</div>
					<div class="mb-1">
						<label for="dienThoai" class="form-label">Điện thoại </label> <input
							type="text" class="form-control" id="dienThoai" name="dienThoai"
							value="<%=dienThoai%>">
					</div>
					<div class="mb-1">
						<label for="dongYNhapEmail" class="form-label">Đồng ý nhận
							email</label> <input type="checkbox" class="form-check-input"
							id="dongYNhapEmail" name="dongYNhapEmail"
							<%=(dongYNhapEmail.equals("true")) ? "checked" : ""%>>
					</div>
					<input type="submit" id="submit"
						class="btn btn-outline-dark form-control " value="Update">
				</div>
			</div>
		</form>
	</div>
	<%
	}
	%>
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
</script>
</html>