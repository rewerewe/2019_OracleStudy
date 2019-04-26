/*==================================================
 	Test001.java
 	- CallableStatement 를 활용한 SQL 구문 전송 실습1
 ===================================================*/

package com.test;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.util.Scanner;

import javax.xml.stream.events.Namespace;

import com.utill.DBConn;

public class Test001
{
	public static void main(String[] args)
	{
		try
		{
			Scanner sc = new Scanner(System.in);
			Connection conn = DBConn.getConnection();
			
			do
			{
				System.out.print("이름 입력(-1 종료) : ");
				String name = sc.next();
				
				
				if(name.equals("-1"))
					break;
				
				System.out.print("전화번호 입력 : ");
				String tel = sc.next();
				
				if (conn != null)
				{
					System.out.println("데이터베이스 연결 성공---!!!");
					
					try
					{
						// 기존에 담겨있는 것들이 있는 모듈, 이라 블레이스 {} 로 감싸주어야 한다는 것 이해할 것.
						String sql = "{call PRC_MEMBERINSERT(?, ?)}";
						
						// CallableStatement 객체 생성
						// PreparedStatement 처럼 slq 문이 전처리되어 먼저 전달되기 때문에 매개변수를 넘겨주어야 한다. 
						CallableStatement cstmt = conn.prepareCall(sql);
						
						// 매개변수 전달
						cstmt.setString(1, name);
						cstmt.setString(2, tel);
						
						int result = cstmt.executeUpdate();
						if (result > 0)
							System.out.println("프로시저 호출 및 데이터 입력 완료-!!!!");
								
						
					} catch (Exception e)
					{
						System.out.println(e.toString());
					}
					
				}
				
				
			} while (true);
			
			
			DBConn.close();
			
			System.out.println("\n데이터베이스 연결 종료-!!!");
			System.out.println("프로그램 종료됨");
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
}

/*
 이름 입력 : 정임혜
전화번호 입력 : 010-1212-3434
데이터베이스 연결 성공---!!!
프로시저 호출 및 데이터 입력 완료-!!!!
이름 입력 : 최보라
전화번호 입력 : 010-5454-5454
데이터베이스 연결 성공---!!!
프로시저 호출 및 데이터 입력 완료-!!!!
이름 입력 : 유진석
전화번호 입력 : 010-6767-6767
데이터베이스 연결 성공---!!!
프로시저 호출 및 데이터 입력 완료-!!!!
이름 입력 : -1
전화번호 입력 : -1
데이터베이스 연결 성공---!!!
프로시저 호출 및 데이터 입력 완료-!!!!
이름 입력 : .

데이터베이스 연결 종료-!!!
프로그램 종료됨

 */
