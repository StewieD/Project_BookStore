package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.cj.jdbc.Driver;

public class JDBCUtil {
  public static Connection getConnection() {
	  Connection conn = null;
	  try {
		//ĐĂng ký
		  DriverManager.registerDriver(new Driver());
		  //Khai báo
		  String username = "root";
		  String password = "";
		  String url="jdbc:mySQL://localhost:3306/webbookstore";
		  //getConnection
		 conn = DriverManager.getConnection(url, username, password);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  return conn;
  }
  public static void closeConnection(Connection conn) {
	  try {
		conn.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  }
}
