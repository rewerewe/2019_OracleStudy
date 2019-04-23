package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn
{
	private static Connection dbconn;

	// java.lang 안에 있는 Exception 이기 때문에 따로 Exception 선언을 해줄 필요없다.
	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		if (dbconn == null)
		{

			String url = "jdbc:oracle:thin:@localhost:1521:xe";

			String user = "scott";
			String pwd = "tiger";

			Class.forName("oracle.jdbc.driver.OracleDriver");

			dbconn = DriverManager.getConnection(url, user, pwd);

		} // end if

		return dbconn;
	}// end getConnection

	public static Connection getConnection(String url, String user, String pwd)
			throws ClassNotFoundException, SQLException
	{
		if (dbconn == null)
		{

			Class.forName("oracle:jdbc:driver.OracleDriver");

			dbconn = DriverManager.getConnection(url, user, pwd);

		} // end if

		return dbconn;

	} // end getConnection

	public static void close() throws SQLException
	{

		if (dbconn != null)
		{

			if (!dbconn.isClosed())
				dbconn.close();

		}

		dbconn = null;
	}
}
