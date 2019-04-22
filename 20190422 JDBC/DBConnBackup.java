/*========================
       DBConn.java
       
==========================*/

//- 처음 DB 와 연결할 때, 가장 많은 리소스가 소모된다. 
//- 그래서 DBConn이라는 연결 객체를 서로 공유해서 사용하려고 한다. 
//- 그랬을 때 리소스 소모를 줄이고, 성능을 향상 시킬 수 있다. 
//- 따라서 싱글톤으로 디자이패턴을 구성하는 것이 바람직하다. 
//- 그러므로 DBConn 은 외우게 될 것

// ※ 싱글톤(Singleton) 디자인 패턴을 이용한 Database 연결 객체 생성 전용 클래스 
//    → DB 연결 과정이 가장 부하가 크기 때문에 한번 연결된 객체를 사용하는 것이 좋다. 
//    src 의 파일이 아니라 build 의 파일이 실행되는 것.

package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnBackup
{
	// 변수선언 : Connection형으로 dbConn을 선언
	private static Connection dbConn;
	//- dbConn은 자동으로 null 로 초기화 될 것이다. 
	//→ 한번 연결된 객체를 계속 사용하겠다는 의미

	// 메소드 정의
	public static Connection getConnection()
	{
		// 한 번 연결된 객체를 계속 사용
		// 즉, 연결되지 않은 경우에만 연결을 시도하겠다는 의미
		// → 싱글톤(디자인 패턴)
		if (dbConn == null)
		{
			try
			{
				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				// localhost 는 오라클 서버의 ip 주소를 기재하는 부분
				// 1521 은 오라클 Port Number
				// xe 는 오라클 SID(Express Edition 은 xe)
				// 오라클 서버의 IP : 현재 컴퓨터의 오라클로 연결하겠다. 
				
				String user = "scott";	//-- 오라클 사용자 계정 이름 
				String pwd = "tiger";   //-- 오라클 사용자 계정 암호 

				Class.forName("oracle.jdbc.driver.OracleDriver");
				//-- Oracle Driver 클래스에 대한 객체를 생성 

				dbConn = DriverManager.getConnection(url, user, pwd);
				//-- 오라클 서버 실제 연결
				//   갖고 있는 인자값(매개변수)은 오라클주소, 계정명, 패스웓,
			
			// Class.forName으로 발생할 수 있는 에러 ClassNotFoundException, SQLException → 즉, 오라클 서버 연결에 실패했을 때 	 	
			} catch (Exception e) 
			{
				System.out.println(e.toString());
				//-- 오라클 서버 연결 실패 시 오류 메시지 출력 부분 
			}
		}

		return dbConn;
		//-- 구성된 연결 객체 반환 
	}

	// getConncetion() 메소드 오버로딩 → 연결
	public static Connection getConnection(String url, String user, String pwd)
	{
		if (dbConn == null)
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				dbConn = DriverManager.getConnection(url, user, pwd);
			} 
			catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		return dbConn;
	}

	
	// 메소드 정의 → 연결 종료
	public static void close()
	{
		// dbConn 변수(멤버 변수)는 
		// DataBase 가 연결된 상태일 경우 Connection 을 갖는다.
		// 연결되지 않은 상태라면 null 을 갖는다. 
		if (dbConn != null)
		{
			try
			{
				// 메소드 중 is 가 있다면 반환값이 True or False 일 것이다. 
				// 연결 객체의 siClosed() 메소드를 통해 연결 상태 확인
				//-- 연결이 닫혀있는 경우 true 반환
				//   연결이 닫혀있지 않은 경우 false 반환
				if (!dbConn.isClosed())
					dbConn.close();
					//-- 연결 객체의 close() 메소드를 통해 연결 종료 
			} 
			catch (Exception e)
			{
				System.out.println(e.toString());
			}

		}
		
		dbConn = null;
		//-- 연결 객체 초기화
	}
}
