package test;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import database.JDBCUtil;

public class testJDBCUtil {
	public static void main(String[] args) {
		int check = 0;
		try {
			//Step 1: get Connection
			Connection conn = JDBCUtil.getConnection();
			//Step 2 test: statement
			Statement st = conn.createStatement();
			//Step 2: SQL
			String sql ="insert into theloai(matheloai,tentheloai) "+" values ('TL03','Kinh Dị');";
			//Step 4: excute
			check = st.executeUpdate(sql);
			System.out.println(sql);
			System.out.println("Affected row: "+check);
			//Step 5: close Connection
			JDBCUtil.closeConnection(conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
