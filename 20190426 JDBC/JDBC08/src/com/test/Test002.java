/*==================================================
 	Test002.java
 	- CallableStatement 를 활용한 SQL 구문 전송 실습2
 ===================================================*/

package com.test;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import com.utill.DBConn;

import oracle.jdbc.internal.OracleTypes;

public class Test002
{
	public static void main(String[] args)
	{
		try
		{
			Connection conn = DBConn.getConnection();
			
			if (conn !=  null)
			{
				System.out.println("데이터 베이스 연결 성공 -!!!!!");
				
				try
				{
					
					String sql = "{call PRC_MEMBERSELECT(?)}";
					
					CallableStatement cstmt = conn.prepareCall(sql);
					
					// 프로시저 내부에서 sys_refcursor 를 사용하고 있기 때문에 
					// OracleTypes.CURSOR 를 사용하기 위한 등록과정이 필요한 상황.
					// 1. Project Explorer 상에서 해당 프로젝트 마우스 우클릭
					//    > Build Path > Configure Build Path > Libraries 탭 선택 > add External jar 클릭 
					//    > 『ojdbc6.jar』 또는 『ojdbc14.jar』 파일 추가 등록
					//    (외부 jar 파일 연결)
					// 2. 『import oracle.jdbc.OracleTypes;』 구문 추가
					
					// ** check ***
					// 내가 어떤 프로시저한테 값을 직접 주면 될텐데 stmt.setXXX
					// 내가 구성하지 않은 프로시저(REFCURSOR 데이터타입)는 데이터타입을 등록시켜주어야 훈이(사용할 사람)도 쓸 수 있게 된다.  
					cstmt.registerOutParameter(1, OracleTypes.CURSOR);
					
					// 객체 타입으로 가져와서 형변환해주어야 한다. 
					cstmt.execute();
					cstmt.getObject(1);
					
					ResultSet rs = (ResultSet) cstmt.getObject(1);
					
					while (rs.next())
					{
						String sid = rs.getString("SID");
						String name = rs.getString("NAME");
						String tel = rs.getString("TEL");
						
						String str = String.format("%3s %7s %10s", sid, name, tel);
						
						System.out.println(str);
					}
					rs.close();
					cstmt.close();
					
					
				} catch (Exception e)
				{
					System.out.println(e.toString());
				}
				
				
			}
			
			DBConn.close();
			System.out.println("데이터베이스 연결 종료-!!!");
			System.out.println("연결 종료됨");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
}

/*
 데이터 베이스 연결 성공 -!!!!!
  1     전훈의 010-1111-1111
  2     전훈의 010-1111-1111
  3     전훈의 010-1111-1111
  4     윤진석 010-2222-2222
  5     최보라 010-3333-3333
  6     이지혜 010-1212-1212
  7     이지혜 010-1212-1212
  8     이기승 010-9090-9090
  9     윤희진 010-7777-7777
 10     유진석 010-1111-2222
 11     정임혜 010-1212-3434
 12     최보라 010-5454-5454
 13     유진석 010-6767-6767
데이터베이스 연결 종료-!!!
연결 종료됨
 
 */
