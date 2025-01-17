/*===================
 	Test003.java

 ====================*/

/*
○ JDBC 프로그램 작성

 	1. 드라이버 인스턴스 생성
 	   사용할 파일들(데이터베이스와의 연결 과정에서 사용된 파일들)이 있는지 확인한다.
 	   이 과정에서는 굳이 인스턴스를 생성하지 않고,
 	   드라이버가 있는지만 확인하더라도 프로그램이 실행하는데에는 지장이 없다.
 	   
 	   ※ 드라이버 클래스를 찾는 방법
 	      『Class』 라는 클래스의 『forName()』 메소드를 사용. 
 	      이 메소드는 매개변수로 넘겨받은 이름의 클래스를 찾아주는 역할을 수행하며
 	      해당 클래스를 찾지 못할 경우 『ClassNotFoundException』 예외를 발생시키게 된다.
 	      
	2. 연결 객체 생성
	   
	   (Class.forName() 을 활용하여..) 찾은 드라이버 클래스를 가지고 
	   설치된 데이터베이스 서버와 연결하는 Connection 객체를 생성한다.
	   
	   ※ Connection 객체는 DriverManager 클래스의 
	      『getConnection()』 이라는 static 메소드로 생성한다.
	      예외는 데이터베이스 서버와 연결하는 과정에서 문제가 있을경우 발생하게 되며 
	      SQLException 예외를 발생시키게 된다.
	      
	3. 작업 객체 생성
	   
	   연결된 포트를 통해 질의문을 보낼 수 있도록 도와주는 객체를 생성한다.
	   자바에서는 크게 세 가지 방법으로 질의를 처리한다.
	   
	   1) Statement 객체 생성
	      정적 질의를 처리할 때 주로 사용
	      - 한번 쓰고 버려짐
	      
	      
	   2) PreparedStatement 객체 생성    
	      동적 질의를 처리할 때 주로 새용
	      ▶ 우리가 사용해야 할 가장 중요한 부분, 시큐어코딩
	      ▶ Statement 객체의 하위 객체. Statement 객체에 비해 여러번 사용가능함. 
	      
	   3) CallableStatement 객체 생성
	      프로시저나 함수를 호출할 수 있도록 사용 
*/

package com.test;

import java.sql.Connection;
import java.sql.Statement;
import java.util.Scanner;

import com.util.DBConn;

public class Test003
{
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);

		Connection conn = DBConn.getConnection();

		do
		{

			System.out.print("번호를 입력하세요(-1 종료) : ");
			String sid = sc.next();

			// 반복문의 조건을 무너뜨리는 코드 구성
			if (sid.contentEquals("-1"))
				break;

			System.out.print("이름을 입력하세요 : ");
			String name = sc.next();

			System.out.print("전화번호를 입력하세요 : ");
			String tel = sc.next();

			if (conn != null)
			{
				System.out.println("데이터베이스 연결 성공-!!!");

				try
				{
					Statement stmt = conn.createStatement();
					String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES (%s, '%s', '%s')", sid,
							name, tel);

					// 데이터베이스로부터 질의 결과를 가져와야 하는 경우
					// → 『executeQuery()』 메소드 사용.
					// 특정 내용을 데이터베이스에 적용해야 하는 경우
					// → 『executeUpdate()』 메소드 사용.
					int result = stmt.executeUpdate(sql);

					if (result > 0)
						System.out.println("회원 정보가 입력되었습니다.");
				} catch (Exception e)
				{
					System.out.println(e.toString());
				}
			}

		} while (true);

		sc.close();
		DBConn.close();

		System.out.println("데이터베이스 연결 닫힘-!!!");
		System.out.println("프로그램 종료됨-!!!");

	}

}

/*
번호를 입력하세요(-1 종료) : 3
이름을 입력하세요 : 정임혜
전화번호를 입력하세요 : 010-3333-3333
데이터베이스 연결 성공-!!!
회원 정보가 입력되었습니다.
번호를 입력하세요(-1 종료) : -1
데이터베이스 연결 닫힘-!!!
프로그램 종료됨-!!!


1	조수연	010-1111-1111
2	이지혜	010-2222-2222
3	정임혜	010-3333-3333
  
 */
