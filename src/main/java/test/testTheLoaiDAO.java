package test;

import DAO.TheLoaiDAO;
import model.TheLoai;

public class testTheLoaiDAO {
	public static void main(String[] args) {
		TheLoai tl1 = new TheLoai("TL05", "Vui vẻ");
		TheLoaiDAO.getInstance().insert(tl1);
	}
}
