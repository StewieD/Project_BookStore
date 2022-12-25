package model;

import java.sql.Date;

public class TacGia {
	private String hoVaTen;
	private String maTacGia;
	private Date ngaySinh;
	private String tieuSu;
	
	public TacGia() {
	}
	
	public TacGia(String maTacGia, String hoVaTen, Date ngaySinh, String tieuSu) {
		this.hoVaTen = hoVaTen;
		this.maTacGia = maTacGia;
		this.ngaySinh = ngaySinh;
		this.tieuSu = tieuSu;
	}
	/**
	 * @return the hoVaTen
	 */
	public String getHoVaTen() {
		return hoVaTen;
	}
	/**
	 * @param hoVaTen the hoVaTen to set
	 */
	public void setHoVaTen(String hoVaTen) {
		this.hoVaTen = hoVaTen;
	}
	/**
	 * @return the maTacGia
	 */
	public String getMaTacGia() {
		return maTacGia;
	}
	/**
	 * @param maTacGia the maTacGia to set
	 */
	public void setMaTacGia(String maTacGia) {
		this.maTacGia = maTacGia;
	}
	/**
	 * @return the ngaySinh
	 */
	public Date getNgaySinh() {
		return ngaySinh;
	}
	/**
	 * @param ngaySinh the ngaySinh to set
	 */
	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	/**
	 * @return the tieuSu
	 */
	public String getTieuSu() {
		return tieuSu;
	}
	/**
	 * @param tieuSu the tieuSu to set
	 */
	public void setTieuSu(String tieuSu) {
		this.tieuSu = tieuSu;
	}

	@Override
	public String toString() {
		return "TacGia [hoVaTen=" + hoVaTen + ", maTacGia=" + maTacGia + ", ngaySinh=" + ngaySinh + ", tieuSu=" + tieuSu
				+ "]";
	}
	
}
