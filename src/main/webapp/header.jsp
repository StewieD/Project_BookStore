<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   String absolutePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
   %>
<nav class="navbar navbar-expand-lg">
		<div class="container-fluid">
			<a class="navbar-brand" href="<%=absolutePath1%>/index.jsp"> <img src="<%=absolutePath1%>/img/Icon.png"
				alt="Bootstrap" height="56">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search"
						placeholder="Nội dung tìm kiếm" aria-label="Search">
					<button class="btn btn-outline-dark" type="submit">Tìm</button>
				</form>
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="<%=absolutePath1%>/index.jsp">Trang chủ</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Giảm giá</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Thể loại </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Nonfiction</a></li>
							<li><a class="dropdown-item" href="#">Fiction</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Classic books &
									Novels</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link disabled">Hết hàng</a>
					</li>
				</ul>

				<%
				Object object = session.getAttribute("khachHang");
				KhachHang khachHang = null;
				if (object != null) {
					khachHang = (KhachHang) object;
				}
				if (khachHang == null) {
				%>
				<form action="<%=absolutePath1%>/khachhang/signin.jsp" >
					<button class="btn btn-outline-dark"  style="margin: 5px;" type="submit">Sign In
						</button>
				</form>
				<form action="<%=absolutePath1%>/khachhang/register.jsp" >
					<button class="btn btn-outline-dark" style="margin: 5px;" type="submit">Sign Up
						</button>
				</form>
				<%
				} else {
				%>
				<!-- Button became DropDown--> 
				<%-- 				<a style="margin: 0 20px 0px 20px">Xin Chào <strong><%=khachHang.getHoVaTen()%></strong></a> --%>
				<!-- 				<form action="product.jsp" style="margin-left: 5px"> -->
				<!-- 					<button class="btn btn-outline-dark " type="submit">Thêm -->
				<!-- 						sản phẩm</button> -->
				<!-- 				</form> -->
				<!-- 				<form action="sign-out" style="margin-left: 5px"> -->
				<!-- 					<button class="btn btn-outline-dark " type="submit">Đăng -->
				<!-- 						xuất</button> -->
				<!-- 				</form> -->
				<div class="nav-item dropdown" >
					<a class="nav-link dropdown-toggle" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"><strong><%=khachHang.getHoVaTen()%></strong>
					</a>
					<ul class="dropdown-menu dropdown-menu-start dropdown-menu-lg-end">
						<li><a class="dropdown-item" href="<%=absolutePath1%>/khachhang/profile.jsp">Your
								profile</a></li>
						<li><a class="dropdown-item" href="<%=absolutePath1%>/product.jsp">Add the
								product</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="<%=absolutePath1%>/khachhang/changepassword.jsp">Change password</a></li>
						<li><a class="dropdown-item" href="<%=absolutePath1%>/khachhangcontroller?action=signout">Sign out</a></li>
					</ul>
				</div>
				<form action="<%=absolutePath1%>/khachhangcontroller">
					<input name="action" value="signout" type="hidden" >
					<button class="btn btn-outline-dark ml-5 " style="margin: 5px;" type="submit">Sign out
						</button>
				</form>
				<%
				}
				%>
			</div>
		</div>
	</nav>