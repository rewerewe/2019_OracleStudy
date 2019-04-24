/*===================
 	DBConn.jave
 ====================*/

package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn
{
	private static Connection dbconn;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		if (dbconn == null)
		{
//			String url = "jdbc:oracle:thin@localhost:1521:xe";
			String url = "jdbc:oracle:thin@localhost:1521:idelful";
			String user = "scott";
//			String pwd = "tiger";
			String pwd = "rladbsqja1";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			dbconn = DriverManager.getConnection(url,user,pwd);
					
		}
		return dbconn;
	
	}
	
	public static Connection getConnection(String url, String user, String pwd) throws ClassNotFoundException, SQLException
	{
		if (dbconn == null)
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			dbconn = DriverManager.getConnection(url,user,pwd);
						
		}
		
		return dbconn;
		
	}
	
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
