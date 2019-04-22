/*===================
 	Test002.java
 	- 데이터베이스 연결
 	- 데이터 입력
 ====================*/

package com.test;

import java.sql.Connection;
import java.sql.Statement;

import com.util.DBConn;

public class Test002
{
	public static void main(String[] args)
	{
		Connection conn = DBConn.getConnection();
		
		if (conn == null)
		{
			System.out.println("데이터 베이스 연결 실패-!!!");
			System.exit(0);
			
		}
		
		// System.out.println("데이터 베이스 연결 성공-!!!");
		try
		{	// 작업 개체 준비
			Statement stmt = conn.createStatement();
			
			// 데이터 입력 쿼리 실행 과정
			// 한 번 실행하면 다시 실행하지 못하는 상황이다.
			// 기본키 제약조건이 설정되어 있으므로 동일한 키 값이 중복될 수 없기 때문이다. 
			// (1) 쿼리문 끝에 세미콘론 ; 없는지 꼭 확인 
			// SQL에서 DML 구문은 커밋/롤백을 해주어야 하는데 자바에서는 AUTO COMMIT 되기 때문에 
			// (2) 오라클에서는 트랜잭션처리되어 무한루프가 돌아 문제 생긴다. Developer 에서 commit 되었는지 반드시 확인해야 한다. 
			
			// 쿼리문 준비 - 문자열 형태로 전송해봅시다. → 크게 보면 자료구조 파트입니다. 
			String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES (2, '이지혜', '010-2222-2222')";
			//-- 주의. 쿼리문 끝에 『;』 붙이지 않는다.
			//-- 주의. 자바에서 실행한 DML 구문은 내부적으로 자동 COMMIT 된다.
			//-- 주의. 오라클에서 트랜잭션 처리가 끝나지 않으면 데이터 액션 처리가 이루어지지 않는다.
			
			int result = stmt.executeUpdate(sql);
			//-- (1) 담아 실어 보낸 데이터가 오라클로 가서 구조/데이터/환경이 변경/추가/삭제 되면 executeUpdate (INSERT, UPDATE, DELETE)
			//   (2) 변경된 값을 숫자형태(정수형)로 반환한다. 
			//                                                               변경/추가/삭제 안되면 executeQuery (SELECT)
			
			if (result > 0)
			{
				System.out.println("데이터 입력 성공-!!!!");
			} else
			{
				System.out.println("입력 실패 ㅠ_ㅠ");
			}
			
		}
		catch (Exception e)
		{
			System.out.println();
		}
		
		DBConn.close();
	}

}
