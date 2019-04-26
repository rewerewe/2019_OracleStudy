/*========================================
 	Test001.java
 	- PreparedStatement 쿼리문 전송 실습 3
 ========================================*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

import com.util.DBConn;

public class Test003
{
	public static void main(String[] args)
	{
		try
		{

			Scanner sc = new Scanner(System.in);
			Connection conn = DBConn.getConnection();

			if (conn != null)
			{
				System.out.println("데이터베이스 연결 성공");

				try
				{
					String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";

					PreparedStatement pstmt = conn.prepareStatement(sql);

					ResultSet rs = pstmt.executeQuery();
					while (rs.next())
					{
						int sid = rs.getInt("SID");
						String name = rs.getString("NAME");
						String tel = rs.getString("TEL");

						String str = String.format("%3d %7s %10s", sid, name, tel);

						System.out.println(str);
					}

					rs.close();
					pstmt.close();

				} catch (Exception e)
				{
					System.out.println(e.toString());
				}
			}

			DBConn.close();

			System.out.println("\n데이터베이스 연결 닫힘-!!!!");
			System.out.println("프로그램 종료됨");

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

	}
}

/*
 데이터베이스 연결 성공
  1     전훈의 010-1111-1111
  2     전훈의 010-1111-1111
  3     전훈의 010-1111-1111
  4     윤진석 010-2222-2222
  5     최보라 010-3333-3333
  7     이지혜 010-1212-1212
  8     이기승 010-9090-9090
  9     윤희진 010-7777-7777

데이터베이스 연결 닫힘-!!!!
프로그램 종료됨
 */