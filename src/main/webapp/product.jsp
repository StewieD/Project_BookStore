<%@page import="DAO.TheLoaiDAO"%>
<%@page import="model.TheLoai"%>
<%@page import="model.TacGia"%>
<%@page import="model.KhachHang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.TacGiaDAO"%>
<%@page import="DAO.SanPhamDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Add Product</title>
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
</head>
<body>
	<!-- Navbar -->
	<%@include file="header.jsp"%>
	<!-- End Navbar -->
	<%
	// lấy thông tin từ dât bảng tác giả & thể loại
	ArrayList<TacGia> listTacGia = TacGiaDAO.getInstance().selectAll();
	ArrayList<TheLoai> listTheLoai = TheLoaiDAO.getInstance().selectAll();
	//Lấy lại thông tin vừa submit
	String error = request.getAttribute("error")+"";
	error = (error.equals("null"))?"":error;
	String tenSanPham = request.getAttribute("tenSanPham")+"";
	tenSanPham = (tenSanPham.equals("null"))?"":tenSanPham;
	String maTacGia = request.getAttribute("maTacGia")+"";
	maTacGia = (maTacGia.equals("null"))?"":maTacGia;
	String namXuatBan = request.getAttribute("namXuatBan")+"";
	namXuatBan = (namXuatBan.equals("null"))?"":namXuatBan;
	String giaNhap = request.getAttribute("giaNhap")+"";
	giaNhap = (giaNhap.equals("null"))?"":giaNhap;
	String giaBia = request.getAttribute("giaBia")+"";
	giaBia = (giaBia.equals("null"))?"":giaBia;
	String giaBan = request.getAttribute("giaBan")+"";
	giaBan = (giaBan.equals("null"))?"":giaBan;
	String soLuong = request.getAttribute("soLuong")+"";
	soLuong = (soLuong.equals("null"))?"":soLuong;
	String maTheLoai = request.getAttribute("maTheLoai")+"";
	maTheLoai = (maTheLoai.equals("null"))?"":maTheLoai;
	String ngonNgu = request.getAttribute("ngonNgu")+"";
	ngonNgu = (ngonNgu.equals("null"))?"":ngonNgu;
	String moTa = request.getAttribute("moTa")+"";
	moTa = (moTa.equals("null"))?"":moTa;
	//Array Quốc Gia
	String[] quocGia = {"Đảo Ascension",
			"Andorra",
			"Các tiểu vương quốc Ả Rập thống nhất",
			"Antigua & Barbuda",
			"Anguilla",
			"Anbani",
			"Armenia",
			"Angola",
			"Nam Cực",
			"Argentina",
			"Samoa thuộc Mỹ",
			"Áo",
			"Úc",
			"Aruba",
			"Quần đảo Åland",
			"Azerbaijan",
			"Bosnia & Herzegovina",
			"Barbados",
			"Bangladesh",
			"Bỉ",
			"Burkina Fasco",
			"Bungari",
			"Bahrain",
			"Burundi",
			"Benin",
			"St. Barthélemy",
			"Bermuda",
			"Brunei",
			"Bolivia",
			"Caribe Hà Lan",
			"Braxin",
			"Bahamas",
			"Bhutan",
			"Đảo Bouvet",
			"Botswana",
			"Belarus",
			"Belize",
			"Canada",
			"Quần đảo Cocos (Keeling)",
			"Congo (Cộng hòa dân chủ)",
			"Cộng hòa Trung Phi",
			"Congo (Cộng hòa)",
			"Thụy Sỹ",
			"Bờ Biển Ngà",
			"Quần đảo Cook",
			"Chile",
			"Cameroon",
			"Colombia",
			"Costa Rica",
			"Mũi Verde",
			"Curaçao",
			"Đảo Christmas",
			"Đảo Síp",
			"Cộng hòa Séc",
			"Đức",
			"Djibouti",
			"Đan Mạch",
			"Dominica",
			"Cộng hòa Dominica",
			"Algeria",
			"Ecuador",
			"Estonia",
			"Ai Cập",
			"Tây Sahara",
			"Eritrea",
			"Tây Ban Nha",
			"Ethiopia",
			"Phần Lan",
			"Fiji",
			"Quần đảo Falkland (Islas Malvinas)",
			"Micronesia",
			"Quần đảo Faroe",
			"Pháp",
			"Gabon",
			"Vương quốc Anh",
			"Quốc đảo Grenada",
			"Georgia",
			"Lãnh thổ Guiana của Pháp",
			"Guernsey",
			"Ghana",
			"Gibraltar",
			"Greenland",
			"Gambia",
			"Guinea",
			"Guadeloupe",
			"Guinea Xích đạo",
			"Hy Lạp",
			"Quần đảo Nam Georgia và Nam Sandwich",
			"Guatemala",
			"Đảo Guam",
			"Guinea-Bissau",
			"Guyana",
			"Hồng Kông",
			"Quần đảo Heard & McDonald",
			"Honduras",
			"Croatia",
			"Haiti",
			"Hungari",
			"Indonesia",
			"Ireland",
			"Israel",
			"Đảo Man",
			"Ấn Độ",
			"Lãnh thổ Trên Ấn Độ Dương thuộc Anh",
			"Iraq",
			"Iceland",
			"Ý",
			"Jersey",
			"Jamaica",
			"Jordan",
			"Nhật Bản",
			"Kenya",
			"Kyrgyzstan",
			"Campuchia",
			"Kiribati",
			"Quốc đảo Comoros",
			"St. Kitts & Nevis",
			"Hàn Quốc",
			"Kuwait",
			"Quần đảo Cayman",
			"Kazakhstan",
			"Lào",
			"Li Băng",
			"St. Lucia",
			"Liechtenstein",
			"Sri Lanka",
			"Liberia",
			"Lesotho",
			"Lithuania",
			"Luxembourg",
			"Latvia",
			"Libya",
			"Ma rốc",
			"Monaco",
			"Moldova",
			"Montenegro",
			"St. Martin",
			"Madagascar",
			"Quần đảo Marshall",
			"Macedonia (FYROM)",
			"Mali",
			"Myanmar (Miến Điện)",
			"Mông Cổ",
			"Ma Cao",
			"Quần đảo Bắc Mariana",
			"Martinique",
			"Mauritania",
			"Montserrat",
			"Malta",
			"Mauritius",
			"Maldives",
			"Malawi",
			"Mexico",
			"Malaysia",
			"Mozambique",
			"Namibia",
			"New Caledonia",
			"Niger",
			"Đảo Norfolk",
			"Nigeria",
			"Nicaragua",
			"Hà Lan",
			"Na Uy",
			"Nepal",
			"Nauru",
			"Niue",
			"New Zealand",
			"Oman",
			"Panama",
			"Peru",
			"Polynesia thuộc Pháp",
			"Papua New Guinea",
			"Philippines",
			"Pakistan",
			"Ba Lan",
			"St. Pierre & Miquelon",
			"Quần đảo Pitcairn",
			"Puerto Rico",
			"Palestine",
			"Bồ Đào Nha",
			"Palau",
			"Paraguay",
			"Qatar",
			"Réunion",
			"Rumani",
			"Serbia",
			"Nga",
			"Rwanda",
			"Ả-rập Xê-út",
			"Quần đảo Solomon",
			"Seychelles",
			"Thụy Điển",
			"Singapore",
			"St. Helena",
			"Slovenia",
			"Svalbard & Jan Mayen",
			"Slovakia",
			"Sierra Leone",
			"San Marino",
			"Senegal",
			"Somalia",
			"Suriname",
			"Nam Sudan",
			"São Tomé & Príncipe",
			"El Salvador",
			"Sint Maarten",
			"Swaziland",
			"Tristan da Cunha",
			"Quần đảo Turks & Caicos",
			"Chad",
			"Các Lãnh thổ Phía Nam của Pháp",
			"Togo",
			"Thái Lan",
			"Tajikistan",
			"Tokelau",
			"Đông Timor",
			"Turkmenistan",
			"Tunisia",
			"Tonga",
			"Thổ Nhĩ Kỳ",
			"Trinidad & Tobago",
			"Tuvalu",
			"Đài Loan",
			"Tanzania",
			"Ukraine",
			"Uganda",
			"Các đảo nhỏ xa trung tâm thuộc Mỹ",
			"Hoa Kỳ",
			"Uruguay",
			"Uzbekistan",
			"Tòa thánh Vatican",
			"St. Vincent & Grenadines",
			"Venezuela",
			"Quần đảo Virgin thuộc Anh",
			"Quần đảo Virgin thuộc Hoa Kỳ",
			"Việt Nam",
			"Vanuatu",
			"Wallis & Futuna",
			"Samoa",
			"Kosovo",
			"Yemen",
			"Mayotte",
			"Nam Phi",
			"Zambia",
			"Zimbabwe",};
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
	
	<div class="container">
		<form action="add-product">
			<div class="row">
				<h3 style="text-align: center">Thông Tin Sản Phẩm</h3>
				<div class="col-md-6">
					<div class="mb-1">
						<label for="tenSanPham" class="form-label">Tên Sản Phẩm <span class="red">*</span> </label> <input
							type="text" class="form-control" id="tenSanPham"
							name="tenSanPham" placeholder="ex: Sản phẩm" value="<%=tenSanPham%>" required >
					</div>
					<div class="mb-1">
						<label for="tacGia" class="form-label">Tác Giả</label> <select
							id="tacGia" name="tacGia" class="form-select"
							aria-label="Default select example">
							<option <%=(maTacGia.equals("null"))?"selected":"" %>></option>
							<%for (TacGia tacGia : listTacGia) {%>
							<option value="<%=tacGia.getMaTacGia()%>" <%=(maTacGia.equals(tacGia.getMaTacGia()))?"selected":"" %>><%=tacGia.getHoVaTen()%></option>
							<%}%>
						</select>
					</div>
					<div class="mb-1">
						<label for="namXuatBan" class="form-label">Năm Xuất Bản </label> <input
							type="number" class="form-control" id="namXuatBan"
							name="namXuatBan" min="1900" max="2023"
							placeholder="Năm Xuất Bản (1900-2023)" value="<%=namXuatBan%>">
					</div>
					<div class="mb-1">
						<label for="theLoai" class="form-label">Thể Loại</label> <select
							class="form-select" id="theLoai" name="theLoai"
							aria-label="Default select example">
							<option <%= (maTheLoai.equals("null")?"selected":"") %>></option>
							<% for(TheLoai theLoai : listTheLoai){%>
								<option value="<%=theLoai.getMaTheLoai()%>" <%=(maTheLoai.equals(theLoai.getMaTheLoai())?"selected":"") %>><%=theLoai.getTenTheLoai()%></option>
							<%}%>
						</select>
					</div>
				</div>
				<div class="col-md-6">
					<div class="mb-1">
						<label for="ngonNgu" class="form-label">Ngôn Ngữ </label> <select
							class="form-select" id="ngonNgu" name="ngonNgu"
							aria-label="Default select example">
							<option <%= (ngonNgu.equals("null")?"selected":"") %>></option>
							<% for(String quocString : quocGia){%>
								<option value="<%=quocString%>" <%=(ngonNgu.equals(quocString)?"selected":"") %>><%=quocString%></option>
							<%}%>
						</select>
					</div>
					<div class="mb-1">
						<label for="moTa" class="form-label"> Mô Tả</label>
						<textarea rows="7" cols="10" id="moTa" name="moTa"
							class="form-control"><%=moTa%></textarea>
					</div>
				</div>
			</div>
			<div class="row">
				<h3 style="text-align: center">Giá Sản Phẩm</h3>
				<div class="col-md-6">
					<div class="mb-1">
						<label for="giaNhap" class="form-label"> Giá Nhập </label> <input
							type="number" step="0.1" class="form-control" id="giaNhap"
							name="giaNhap" value="<%=giaNhap%>" placeholder="ex: 10.5">
					</div>
					<div class="mb-1">
						<label for="giaBia" class="form-label"> Giá Bìa </label> <input
							type="number" step="0.1" class="form-control" id="giaBia"
							name="giaBia" value="<%=giaBia%>" placeholder="ex: 20.5">
					</div>
				</div>
				<div class="col-md-6">
					<div class="mb-1">
						<label for="giaBan" class="form-label"> Giá Bán </label> <input
							type="number" step="0.1" class="form-control" id="giaBan"
							name="giaBan" value="<%=giaBan%>" placeholder="ex: 15.5">
					</div>
					<div class="mb-1">
						<label for="soLuong" class="form-label"> Số lượng </label> <input
							type="number" class="form-control" id="soLuong" name="soLuong" value="<%=soLuong%>" placeholder="ex: 20">
					</div>
				</div>
			</div>
			<input type="submit" value="Thêm sản phẩm"
				class="btn btn-outline-dark mt-4 form-control">
		</form>
	</div>
	<%}%>
	<!-- Footer -->
	<jsp:include page="footer.jsp" />
	<!-- End Footer -->
</body>
</html>