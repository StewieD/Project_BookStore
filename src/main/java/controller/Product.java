package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.SanPhamDAO;
import DAO.TacGiaDAO;
import DAO.TheLoaiDAO;
import model.SanPham;
import model.TacGia;
import model.TheLoai;

/**
 * Servlet implementation class Product
 */
@WebServlet("/add-product")
public class Product extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tenSanPham = request.getParameter("tenSanPham");
		String maTacGia = request.getParameter("tacGia");
		String namXuatBan = request.getParameter("namXuatBan");
		String giaNhap = request.getParameter("giaNhap");
		String giaBia = request.getParameter("giaBia");
		String giaBan = request.getParameter("giaBan");
		String soLuong = request.getParameter("soLuong");
		String maTheLoai = request.getParameter("theLoai");
		String ngonNgu = request.getParameter("ngonNgu");
		String moTa = request.getParameter("moTa");
		tenSanPham = tenSanPham.trim();
		moTa = moTa.trim();
		String error = "";
		String url = "";

		if (SanPhamDAO.getInstance().checkExist(tenSanPham)) {
			error += " Đã tồn tại";
			System.out.println(error);
			
		} 
		if(error.length()>0){
			request.setAttribute("error", error);
			request.setAttribute("tenSanPham", tenSanPham);
			request.setAttribute("maTacGia", maTacGia);
			request.setAttribute("namXuatBan", namXuatBan);
			request.setAttribute("giaNhap", giaNhap);
			request.setAttribute("giaBia", giaBia);
			request.setAttribute("giaBan", giaBan);
			request.setAttribute("soLuong", soLuong);
			request.setAttribute("maTheLoai", maTheLoai);
			request.setAttribute("ngonNgu", ngonNgu);
			request.setAttribute("moTa", moTa);
			System.out.println("product");
			url = "/product.jsp";
		}else {
			TacGiaDAO tacGiaDAO = new TacGiaDAO();
			TacGia tacGia = tacGiaDAO.selectByIdString(maTacGia);
			TheLoaiDAO theLoaiDAO = new TheLoaiDAO();
			TheLoai theLoai = theLoaiDAO.selectByIdString(maTheLoai);
			Random random = new Random();
			String maSanPham = System.currentTimeMillis() + random.nextInt(1000) + "";
			SanPham sanPham = new SanPham(maSanPham, tenSanPham, tacGia, Integer.valueOf(namXuatBan),
					Double.valueOf(giaNhap), Double.valueOf(giaBia), Double.valueOf(giaBan), Integer.parseInt(soLuong),
					theLoai, ngonNgu, moTa);
			SanPhamDAO.getInstance().insert(sanPham);
			url = "/success.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
