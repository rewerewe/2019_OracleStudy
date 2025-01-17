/*========================================
 	Test001.java
 	- PreparedStatement 쿼리문 전송 실습 2
 ========================================*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Scanner;

import com.util.DBConn;

public class Test002
{
	public static void main(String[] args)
	{
		try
		{

			Scanner sc = new Scanner(System.in);
			Connection conn = DBConn.getConnection();

			do
			{

				System.out.print("번호 입력(-1 종료) : ");
				String sid = sc.next();

				if (sid.equals("-1"))
					break;

				System.out.println("이름 입력 : ");
				String name = sc.next();

				System.out.println("전화번호 입력 : ");
				String tel = sc.next();

				if (conn != null)
				{
					System.out.println("데이터베이스 연결 성공");

					try
					{
						String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES (?, ?, ?)";

						PreparedStatement pstmt = conn.prepareStatement(sql);
						
						pstmt.setInt(1, Integer.parseInt(sid));
						pstmt.setString(2, name);
						pstmt.setString(3, tel);
						
						int result = pstmt.executeUpdate();
						if (result > 0)
							System.out.println("회원 정보 입력 완료-!!!");

						pstmt.close();

					} catch (Exception e)
					{
						System.out.println();
					}
				}

			} while (true);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

	}
}
