/*===============================
 	MemberMain.java
===============================*/

/*
 ○ 문제
    TBL_Member 테이블을 활용하여 
    이름과 전화번호를 여러건 입력받고, 전체 출력하는 프로그램을 구현한다.
    단, 데이터베이스 연동이 이루어져야 하고
    MemberDAO, MemberDTO 클래스를 활용해야 한다.
    
실행 예)

이름 전화번호 입력(1) : 전훈의 010-1111-1111
회원 정보 입력 완료-!!!
이름 전화번호 입력(2) : 유진석 010-2222-2222
회원 정보 입력 완료-!!!
이름 전화번호 입력(3) : 최보라 010-3333-3333
회원 정보 입력 완료-!!!
이름 전화번호 입력(4) : .

----------------------------------
전체 회원 수 : 3명  
----------------------------------
번호 	이름		전화번호 
1		전훈의		010-1111-1111
2		유진석		010-2222-2222
3		최보라		010-3333-3333
----------------------------------
 */

// 함께 풀이한 내용 
package com.test;

import java.sql.SQLException;
import java.util.Scanner;

import com.util.DBConn;

public class MemberMain
{
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);

		// (2) 예외처리로 try~catch 사용
		try
		{
			// (1) 현재 인원수 확인 - 인스턴스 생성
			MemberDAO dao = new MemberDAO();

			int count = dao.count();

			do
			{

				// (3) DB로 연결해 현재 인원 수 확인하여 출력
				System.out.printf("이름 전화번호 입력(%d) : ", (++count));
				String name = sc.next();
				
				// (5) MemberDTO 타입으로 넘겨주어야 한다. 어떻게 넘겨주지?
				// 매개변수로 넘겨주어야 하기 때문에 MemberDTO 를 만들어 주어야 하는 것이다.

				// (6) MemberDTO 객체 구성
				MemberDTO dto = new MemberDTO();
				// (7) 사용자에 입력받은 값
				dto.setName(name);

				// 반복문의 조건을 무너뜨리는 코드 구성
				if (name.contentEquals("."))
					break;
				String tel = sc.next();
				
				dto.setTel(tel);

				// (4) 생성된 인스턴스 기반으로 메소드 호출 add();
				// (6-2) 데이터베이스에 데이터를 입력하는 메소드 호출
				int result = dao.add(dto);
				if (result > 0)
					System.out.println("회원 정보 입력 완료-!!!");

			} while (true);

			System.out.println("----------------------------------");
			System.out.println("전체 회원 수 : 3명  ");
			System.out.println("----------------------------------");
			System.out.println("번호 	이름		전화번호 ");

			for (MemberDTO obj : dao.lists())
			{
				System.out.printf("%s %s %s%n", obj.getSid(), obj.getName(), obj.getTel());
			}

			System.out.println("----------------------------------");

		} catch (Exception e)
		{
			System.out.println(e.toString());
		} finally
		{
			try
			{
				DBConn.close();
				System.out.println("데이터베이스 닫힘");
				System.out.println("프로그램 종료됨");
			} catch (SQLException e)
			{
				System.out.println(e.toString());
			}
		}

	}
}
/*
 [실행결과]
이름 전화번호 입력(1) : 전훈의 010-1111-1111
회원 정보 입력 완료-!!!
이름 전화번호 입력(2) : 윤진석 010-2222-2222
회원 정보 입력 완료-!!!
이름 전화번호 입력(3) : 최보라 010-3333-3333
회원 정보 입력 완료-!!!
이름 전화번호 입력(4) : .
----------------------------------
전체 회원 수 : 3명  
----------------------------------
번호 	이름		전화번호 
1 전훈의 010-1111-1111
2 전훈의 010-1111-1111
3 전훈의 010-1111-1111
4 윤진석 010-2222-2222
5 최보라 010-3333-3333
----------------------------------
데이터베이스 닫힘
프로그램 종료됨
 * */
