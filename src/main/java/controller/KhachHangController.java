package controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Date;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import DAO.KhachHangDAO;
import model.KhachHang;
import util.MaHoa;

/**
 * Servlet implementation class KhachHang
 */
@MultipartConfig
@WebServlet("/khachhangcontroller")
public class KhachHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KhachHangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action.equals("signin")) {
			signin(request, response);
		} else if(action.equals("signout")){
			signout(request, response);
		}
		else if(action.equals("register")){
			register(request, response);
		}
		else if(action.equals("changeavatar")){
			changeavatar(request, response);
		}
		else if(action.equals("changeinfo")){
			changeinfo(request, response);
		}
		else if(action.equals("changepassword")){
			changepassword(request, response);
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	private void signin(HttpServletRequest request, HttpServletResponse response) {
		String userName = request.getParameter("username");
		String passWord = request.getParameter("password");
		
		passWord = MaHoa.toSHA1(passWord);
		KhachHang kh = new KhachHang();
		kh.setTenDangNhap(userName);
		kh.setMatKhau(passWord);
		String url ="";
		KhachHang khachHang = KhachHangDAO.getInstance().selectByIdAndPassWord(kh);
		if(khachHang!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("khachHang", khachHang);
			session.setMaxInactiveInterval(5*60);
			url = "/index.jsp";
		}else {
			request.setAttribute("baoLoi", "Incorrect username or password.");
			url = "/khachhang/signin.jsp";
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private void signout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private void changepassword(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String oldPassWord = request.getParameter("oldpassword");
		String newPassWord = request.getParameter("newpassword");
		String newPassWord2 = request.getParameter("newpassword2");
		System.out.println("true");
		String oldPassWordSha1 = MaHoa.toSHA1(oldPassWord);
		String error = "";
		String success = "";
		String url = "khachhang/changepassword.jsp";
		KhachHang khachHang = null;
		// Kiểm tra mật khẩu cũ có giống không
		HttpSession session = request.getSession();
		Object object = session.getAttribute("khachHang");
		if (object != null) {
			khachHang = (KhachHang) object;
		}
		if (khachHang == null) {
			error += "Bạn chưa đăng nhập vào hệ thống";
		} else {
			if (!newPassWord.equals(newPassWord2)) {
				error += "Password confirmation doesn't match the password";
			}
			if (newPassWord.equals(oldPassWord)) {
				error += " & New password must be different!";
			}
			if (!oldPassWordSha1.equals(khachHang.getMatKhau())) {
				error += " & Old password isn't valid";
			}
			if (!(error.length()>0)){
				String newPassWordSha1 = MaHoa.toSHA1(newPassWord);
				khachHang.setMatKhau(newPassWordSha1);
				if (KhachHangDAO.getInstance().changePassWord(khachHang)) {
					success += "Password changed successfully!";
				} else {
					error += "The change password operation failed!";
				}
			}
		}
		request.setAttribute("error", error);
		request.setAttribute("success", success);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void changeinfo(HttpServletRequest request, HttpServletResponse response) {
		String hoVaTen = request.getParameter("hoVaTen");
		String gioiTinh = request.getParameter("gioiTinh");
		String ngaySinh = request.getParameter("ngaySinh");
		String diaChi = request.getParameter("diaChi");
		String diaChiNhanHang = request.getParameter("diaChiNhanHang");
		String email = request.getParameter("email");
		String dienThoai = request.getParameter("dienThoai");
		String dongYNhapEmail = request.getParameter("dongYNhapEmail");
		String success = "";

		HttpSession session = request.getSession();
		Object object = session.getAttribute("khachHang");
		KhachHang khachHang = null;
		if (object != null) {
			khachHang = (KhachHang) object;
		}
		if (khachHang != null) {
			String maKhachHang = khachHang.getMaKhachHang();
			KhachHang kh = new KhachHang(maKhachHang, "", "", hoVaTen, gioiTinh, diaChi, diaChiNhanHang,
					Date.valueOf(ngaySinh), dienThoai, email, dongYNhapEmail != null);
			if (KhachHangDAO.getInstance().changeInfo(kh)==1) {
				success+="Your infor changed successfully!";
				KhachHang kh2 = KhachHangDAO.getInstance().selectById(kh);
				request.getSession().setAttribute("khachHang", kh2);
			}
		}
		request.setAttribute("success", success);
		RequestDispatcher rd = request.getRequestDispatcher("khachhang/profile.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void changeavatar(HttpServletRequest request, HttpServletResponse response) {
		try {
			Part part = request.getPart("image");

			String fileName = Path.of(part.getSubmittedFileName()).getFileName().toString();
			String realPath = request.getServletContext().getRealPath("/images");
			System.out.println(fileName);
			System.out.println(realPath);

			if (!Files.exists(Path.of(realPath))) {
				Files.createDirectory(Path.of(realPath));
			}
			part.write(realPath + "/" + fileName);
			request.setAttribute("fileName", fileName);

			RequestDispatcher rd = request.getRequestDispatcher("khachhang/profile.jsp");
			rd.forward(request, response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void register(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String hoVaTen = request.getParameter("hoVaTen");
		String gioiTinh =  request.getParameter("gioiTinh");
		String ngaySinh =  request.getParameter("ngaySinh");
		String diaChi = request.getParameter("diaChi");
		String diaChiNhanHang = request.getParameter("diaChiNhanHang");
		String email = request.getParameter("email");
		String dienThoai = request.getParameter("dienThoai");
		String dieukhoan = request.getParameter("dieukhoan");
		String dongYNhapEmail =  request.getParameter("dongYNhapEmail");
		
		String url;
		String baoLoi = "";
		KhachHangDAO khachHangDAO =  new KhachHangDAO();
		if(khachHangDAO.checkExistUserName(username)) {
			baoLoi+= "Đã tồn tại";
		}
		if(!password.equals(password2)) {
			baoLoi+= "Mật khẩu không khớp";
		}else {
			password = MaHoa.toSHA1(password);
		}
		if(dieukhoan==null) {
			baoLoi+= "Chưa chấp nhận điều khoản";
		}
		if(baoLoi.length()>0) {
			request.setAttribute("username",username);
			request.setAttribute("password",password);
			request.setAttribute("password2",password2);
			request.setAttribute("hoVaTen",hoVaTen);
			request.setAttribute("gioiTinh",gioiTinh);
			request.setAttribute("ngaySinh",ngaySinh);
			request.setAttribute("diaChi",diaChi);
			request.setAttribute("diaChiNhanHang",diaChiNhanHang);
			request.setAttribute("email",email);
			request.setAttribute("dienThoai",dienThoai);
			request.setAttribute("dieukhoan",dieukhoan);
			request.setAttribute("dongYNhapEmail",dongYNhapEmail);
			request.setAttribute("baoLoi",baoLoi);
			url = "/register.jsp";
		}else {
			Random random = new Random();
			String maKhachHang = System.currentTimeMillis()+ random.nextInt(1000)+"";
			khachHangDAO.insert(new KhachHang(maKhachHang, username, password, hoVaTen, gioiTinh, diaChi, diaChiNhanHang, Date.valueOf(ngaySinh), dienThoai, email, dongYNhapEmail!=null));
			url = "/index.jsp";
		}
		System.out.println(baoLoi);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
