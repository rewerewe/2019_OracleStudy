/*=========================
 	DBConn.java
 =========================*/

package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	private static Connection dbConn;

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		if (dbConn == null) {
			// FIXME
//			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String url = "jdbc:oracle:thin:@localhost:1521:idealful";
			String user = "scott";
//			String pwd = "tiger";
			String pwd = "rladbsqja1";

			Class.forName("oracle.jdbc.driver.OracleDriver");
			dbConn = DriverManager.getConnection(url, user, pwd);

		} // end if

		return dbConn;

	}// end getConnection

	public static Connection getConnection(String url, String user, String pwd)
			throws ClassNotFoundException, SQLException {
		if (dbConn == null) {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			dbConn = DriverManager.getConnection(url, user, pwd);
		}

		return dbConn;

	}// end getConnection

	public static void close() throws SQLException {
		if (dbConn != null) {
			if (!dbConn.isClosed())
				dbConn.close();
		}

		dbConn = null;

	}// end close
}