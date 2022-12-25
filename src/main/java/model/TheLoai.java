package model;

public class TheLoai {
 private String maTheLoai;
 private String tenTheLoai;
 
public TheLoai() {
}

public TheLoai(String maTheLoai, String tenTheLoai) {
	this.maTheLoai = maTheLoai;
	this.tenTheLoai = tenTheLoai;
}

/**
 * @return the maTheLoai
 */
public String getMaTheLoai() {
	return maTheLoai;
}

/**
 * @param maTheLoai the maTheLoai to set
 */
public void setMaTheLoai(String maTheLoai) {
	this.maTheLoai = maTheLoai;
}

/**
 * @return the tenTheLoai
 */
public String getTenTheLoai() {
	return tenTheLoai;
}

/**
 * @param tenTheLoai the tenTheLoai to set
 */
public void setTenTheLoai(String tenTheLoai) {
	this.tenTheLoai = tenTheLoai;
}

@Override
public String toString() {
	return "TheLoai [maTheLoai=" + maTheLoai + ", tenTheLoai=" + tenTheLoai + "]";
}
 
}

