package model;

public class ChiTietDonHang {
	private String maChiTietDonHang;
	private DonHang donHang;
	private SanPham sanPham;
	private int soLuong;
	private double giaBia;
	private double giamGia;
	private double giaBan;
	private int thueVAT;
	private double tongThanhTien;
	public ChiTietDonHang() {
	}
	public ChiTietDonHang(String maChiTietDonHang, DonHang donHang, SanPham sanPham, int soluong, double giaBia,
			double giamGia, double giaBan, int thuevat, double tongThanhTien) {
		this.maChiTietDonHang = maChiTietDonHang;
		this.donHang = donHang;
		this.sanPham = sanPham;
		this.soLuong = soluong;
		this.giaBia = giaBia;
		this.giamGia = giamGia;
		this.giaBan = giaBan;
		this.thueVAT = thuevat;
		this.tongThanhTien = tongThanhTien;
	}
	/**
	 * @return the maChiTietDonHang
	 */
	public String getMaChiTietDonHang() {
		return maChiTietDonHang;
	}
	/**
	 * @param maChiTietDonHang the maChiTietDonHang to set
	 */
	public void setMaChiTietDonHang(String maChiTietDonHang) {
		this.maChiTietDonHang = maChiTietDonHang;
	}
	/**
	 * @return the donHang
	 */
	public DonHang getDonHang() {
		return donHang;
	}
	/**
	 * @param donHang the donHang to set
	 */
	public void setDonHang(DonHang donHang) {
		this.donHang = donHang;
	}
	/**
	 * @return the sanPham
	 */
	public SanPham getSanPham() {
		return sanPham;
	}
	/**
	 * @param sanPham the sanPham to set
	 */
	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}
	/**
	 * @return the soLuong
	 */
	public int getSoLuong() {
		return soLuong;
	}
	/**
	 * @param soLuong the soLuong to set
	 */
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	/**
	 * @return the giaBia
	 */
	public double getGiaBia() {
		return giaBia;
	}
	/**
	 * @param giaBia the giaBia to set
	 */
	public void setGiaBia(double giaBia) {
		this.giaBia = giaBia;
	}
	/**
	 * @return the giamGia
	 */
	public double getGiamGia() {
		return giamGia;
	}
	/**
	 * @param giamGia the giamGia to set
	 */
	public void setGiamGia(double giamGia) {
		this.giamGia = giamGia;
	}
	/**
	 * @return the giaBan
	 */
	public double getGiaBan() {
		return giaBan;
	}
	/**
	 * @param giaBan the giaBan to set
	 */
	public void setGiaBan(double giaBan) {
		this.giaBan = giaBan;
	}
	/**
	 * @return the thueVAT
	 */
	public int getThueVAT() {
		return thueVAT;
	}
	/**
	 * @param thueVAT the thueVAT to set
	 */
	public void setThueVAT(int thueVAT) {
		this.thueVAT = thueVAT;
	}
	/**
	 * @return the tongThanhTien
	 */
	public double getTongThanhTien() {
		return tongThanhTien;
	}
	/**
	 * @param tongThanhTien the tongThanhTien to set
	 */
	public void setTongThanhTien(double tongThanhTien) {
		this.tongThanhTien = tongThanhTien;
	}
	
}
