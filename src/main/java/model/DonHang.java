package model;

import java.sql.Date;

public class DonHang {
	private String maDonHang;
	private KhachHang khachHang;
	private String diaChi;
	private String diaChiNhanHang;
	private String trangThai;
	private String hinhThucThanhToan;
	private double soTienDaThanhToan;
	private double soTienConthieu;
	private Date ngayDatHang;
	private Date ngayGiaoHang;
	
	public DonHang() {
		super();
	}
	public DonHang(String maDonHang, KhachHang khachHang, String diaChi, String diaChiNhanHang, String trangThai,
			String hinhThucThanhToan, double soTienDaThanhToan, double soTienConthieu, Date ngayDatHang,
			Date ngayGiaoHang) {
		super();
		this.maDonHang = maDonHang;
		this.khachHang = khachHang;
		this.diaChi = diaChi;
		this.diaChiNhanHang = diaChiNhanHang;
		this.trangThai = trangThai;
		this.hinhThucThanhToan = hinhThucThanhToan;
		this.soTienDaThanhToan = soTienDaThanhToan;
		this.soTienConthieu = soTienConthieu;
		this.ngayDatHang = ngayDatHang;
		this.ngayGiaoHang = ngayGiaoHang;
	}
	/**
	 * @return the maDonHang
	 */
	public String getMaDonHang() {
		return maDonHang;
	}
	/**
	 * @param maDonHang the maDonHang to set
	 */
	public void setMaDonHang(String maDonHang) {
		this.maDonHang = maDonHang;
	}
	/**
	 * @return the khachHang
	 */
	public KhachHang getKhachHang() {
		return khachHang;
	}
	/**
	 * @param khachHang the khachHang to set
	 */
	public void setKhachHang(KhachHang khachHang) {
		this.khachHang = khachHang;
	}
	/**
	 * @return the diaChi
	 */
	public String getDiaChi() {
		return diaChi;
	}
	/**
	 * @param diaChi the diaChi to set
	 */
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	/**
	 * @return the diaChiNhanHang
	 */
	public String getDiaChiNhanHang() {
		return diaChiNhanHang;
	}
	/**
	 * @param diaChiNhanHang the diaChiNhanHang to set
	 */
	public void setDiaChiNhanHang(String diaChiNhanHang) {
		this.diaChiNhanHang = diaChiNhanHang;
	}
	/**
	 * @return the trangThai
	 */
	public String getTrangThai() {
		return trangThai;
	}
	/**
	 * @param trangThai the trangThai to set
	 */
	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}
	/**
	 * @return the hinhThucThanhToan
	 */
	public String getHinhThucThanhToan() {
		return hinhThucThanhToan;
	}
	/**
	 * @param hinhThucThanhToan the hinhThucThanhToan to set
	 */
	public void setHinhThucThanhToan(String hinhThucThanhToan) {
		this.hinhThucThanhToan = hinhThucThanhToan;
	}
	/**
	 * @return the soTienDaThanhToan
	 */
	public double getSoTienDaThanhToan() {
		return soTienDaThanhToan;
	}
	/**
	 * @param soTienDaThanhToan the soTienDaThanhToan to set
	 */
	public void setSoTienDaThanhToan(double soTienDaThanhToan) {
		this.soTienDaThanhToan = soTienDaThanhToan;
	}
	/**
	 * @return the soTienConthieu
	 */
	public double getSoTienConthieu() {
		return soTienConthieu;
	}
	/**
	 * @param soTienConthieu the soTienConthieu to set
	 */
	public void setSoTienConthieu(double soTienConthieu) {
		this.soTienConthieu = soTienConthieu;
	}
	/**
	 * @return the ngayDatHang
	 */
	public Date getNgayDatHang() {
		return ngayDatHang;
	}
	/**
	 * @param ngayDatHang the ngayDatHang to set
	 */
	public void setNgayDatHang(Date ngayDatHang) {
		this.ngayDatHang = ngayDatHang;
	}
	/**
	 * @return the ngayGiaoHang
	 */
	public Date getNgayGiaoHang() {
		return ngayGiaoHang;
	}
	/**
	 * @param ngayGiaoHang the ngayGiaoHang to set
	 */
	public void setNgayGiaoHang(Date ngayGiaoHang) {
		this.ngayGiaoHang = ngayGiaoHang;
	}
	
}