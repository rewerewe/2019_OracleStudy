/*========================
 	Test001.java
 	- 쿼리문 전송 실습 1
 =========================*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import com.util.DBConn;

public class Test001
{
	public static void main(String[] args)
	{
		try
		{
			Connection conn = DBConn.getConnection();

			if (conn != null)
			{

				System.out.println("데이터베이스 연결 성공-!!!!");

				try
				{
					/*---------------------------------------------------------------------------------------------------------
					Statement stmt = conn.createStatement();

					String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES (MEMBERSEQ.NEXTVAL, '이지혜', '010-1212-1212')";

					int result = stmt.executeUpdate(sql);

					if (result > 0)
						System.out.println("데이터 입력 성공-!!!");

					stmt.close();
					DBConn.close();
					*/
					
					/*
					Statement stmt = conn.createStatement();

					String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES (MEMBERSEQ.NEXTVAL, '이기승', '010-9090-9090')";

					int result = stmt.executeUpdate(sql);

					if (result > 0)
						System.out.println("데이터 입력 성공-!!!");

					stmt.close();
					DBConn.close();
					--------------------------------------------------------------------------------------------------------- */
					
					String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES (MEMBERSEQ.NEXTVAL, ?, ?)";
					
					// PraparedStatement 생성 
					PreparedStatement pstmt = conn.prepareStatement(sql);
					
					// IN 매개변수 넘겨주기
					// 아래 구문에서 1, 2는 ? (퀘스천)의 순번이 된다. 
					pstmt.setString(1, "윤희진");
					pstmt.setString(2, "010-7777-7777");
					
					// 작업 객체가 이미 sql문을 가지고 있기에 매개변수로 넘겨주지 않는다.
					int result = pstmt.executeUpdate();
					
					if (result > 0)
							System.out.println("데이터 입력 성공-!!!");
					
					pstmt.close();
					DBConn.close();
					

				} catch (Exception e)
				{
					System.out.println(e.toString());
				}

			}

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
}


/*
-- TBL_MEMBER 데이터 조회

1	전훈의	010-1111-1111
2	전훈의	010-1111-1111
3	전훈의	010-1111-1111
4	윤진석	010-2222-2222
5	최보라	010-3333-3333
6	이지혜	010-1212-1212
7	이지혜	010-1212-1212


-- '이기승' sql문 한번 더 실행
/*
1	전훈의	010-1111-1111
2	전훈의	010-1111-1111
3	전훈의	010-1111-1111
4	윤진석	010-2222-2222
5	최보라	010-3333-3333
6	이지혜	010-1212-1212
7	이지혜	010-1212-1212
8	이기승	010-9090-9090


-- '윤희진' 으로 PreparedStatement 실행

1	전훈의	010-1111-1111
2	전훈의	010-1111-1111
4	윤진석	010-2222-2222
5	최보라	010-3333-3333
6	이지혜	010-1212-1212
7	이지혜	010-1212-1212
8	이기승	010-9090-9090
9	윤희진	010-7777-7777

*/

