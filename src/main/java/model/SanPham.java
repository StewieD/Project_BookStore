package model;

public class SanPham {
	private String maSanPham;
	private String tenSanPham;
	private TacGia tacGia;
	private int namXuatBan;
	private double giaNhap;
	private double giaBia;
	private double giaBan;
	private int soLuong;
	private TheLoai theLoai;
	private String ngonNgu;
	private String moTa;
	
	public SanPham() {
	}

	public SanPham(String maSanPham, String tenSanPham, TacGia tacGia, int namXuatBan, double giaNhap, double giaBia,
			double giaBan, int soLuong, TheLoai theLoai, String ngonNgu, String moTa) {
		this.maSanPham = maSanPham;
		this.tenSanPham = tenSanPham;
		this.tacGia = tacGia;
		this.namXuatBan = namXuatBan;
		this.giaNhap = giaNhap;
		this.giaBia = giaBia;
		this.giaBan = giaBan;
		this.soLuong = soLuong;
		this.theLoai = theLoai;
		this.ngonNgu = ngonNgu;
		this.moTa = moTa;
	}

	/**
	 * @return the maSanPham
	 */
	public String getMaSanPham() {
		return maSanPham;
	}

	/**
	 * @param maSanPham the maSanPham to set
	 */
	public void setMaSanPham(String maSanPham) {
		this.maSanPham = maSanPham;
	}

	/**
	 * @return the tenSanPham
	 */
	public String getTenSanPham() {
		return tenSanPham;
	}

	/**
	 * @param tenSanPham the tenSanPham to set
	 */
	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}

	/**
	 * @return the tacGia
	 */
	public TacGia getTacGia() {
		return tacGia;
	}

	/**
	 * @param tacGia the tacGia to set
	 */
	public void setTacGia(TacGia tacGia) {
		this.tacGia = tacGia;
	}

	/**
	 * @return the namXuatBan
	 */
	public int getNamXuatBan() {
		return namXuatBan;
	}

	/**
	 * @param namXuatBan the namXuatBan to set
	 */
	public void setNamXuatBan(int namXuatBan) {
		this.namXuatBan = namXuatBan;
	}

	/**
	 * @return the giaNhap
	 */
	public double getGiaNhap() {
		return giaNhap;
	}

	/**
	 * @param giaNhap the giaNhap to set
	 */
	public void setGiaNhap(double giaNhap) {
		this.giaNhap = giaNhap;
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
	 * @return the theLoai
	 */
	public TheLoai getTheLoai() {
		return theLoai;
	}

	/**
	 * @param theLoai the theLoai to set
	 */
	public void setTheLoai(TheLoai theLoai) {
		this.theLoai = theLoai;
	}

	/**
	 * @return the ngonNgu
	 */
	public String getNgonNgu() {
		return ngonNgu;
	}

	/**
	 * @param ngonNgu the ngonNgu to set
	 */
	public void setNgonNgu(String ngonNgu) {
		this.ngonNgu = ngonNgu;
	}

	/**
	 * @return the moTa
	 */
	public String getMoTa() {
		return moTa;
	}

	/**
	 * @param moTa the moTa to set
	 */
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	@Override
	public String toString() {
		return "SanPham [maSanPham=" + maSanPham + ", tenSanPham=" + tenSanPham + ", tacGia=" + tacGia + ", namXuatBan="
				+ namXuatBan + ", giaNhap=" + giaNhap + ", giaBia=" + giaBia + ", giaBan=" + giaBan + ", soLuong="
				+ soLuong + ", theLoai=" + theLoai + ", ngonNgu=" + ngonNgu + ", moTa=" + moTa + "]";
	}
	
}
