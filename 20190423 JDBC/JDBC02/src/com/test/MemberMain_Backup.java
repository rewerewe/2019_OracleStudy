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

package com.test;

import java.sql.SQLException;
import java.util.Scanner;

public class MemberMain_Backup
{

	public static void main(String[] args) throws ClassNotFoundException, SQLException
	{
		// 인스턴스 생성 - 전역함수로 못씀. main 을 선언해주니 에러해결됨.
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		Scanner sc = new Scanner(System.in);
		int i = 0;

		// 
		while (true)
		{
			i++;
			
			// 사용자로부터 입력받기 
			System.out.print("이름 전화번호 입력(1) : ");
			String name = sc.next();
			String tel = sc.next();
			
			if (i < 4)
				break;
			
			
			dto.setSid("MEMBERSEQ.NEXTVAL");
			dto.setName(name);
			dto.setTel(tel);
			
			dao.add(dto);

			// 전체 인원수 확인 하는 count() 메소드 
			int num = dao.count();
			
			System.out.println("----------------------------------");
			System.out.println("전체 회원 수 : %d ", num);
			System.out.println("----------------------------------");
			System.out.println("번호 	이름		전화번호");			
			System.out.println("----------------------------------");
			
			dao.lists();
			
			
		}
		
	}


}

/*  현우 풀이과정

package conn.test;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

import conn.util.DBConn;

public class MemberMain
{
   public static void main(String[] args) throws ClassNotFoundException, SQLException
   {
      Connection conn = DBConn.getConnection();
      
      
      Scanner sc = new Scanner(System.in);
      MemberDAO dao = new MemberDAO();
      MemberDTO dto = new MemberDTO();
      
      
      int i = 1;
      
      do
      {
         
         System.out.printf("이름 전화번호 입력 (%d)", i);
         String a = sc.next();
         String b = sc.next();
         i++;
         
         if (i==5)
         break;
         
         dto.setSid("MEMBERSEQ.NEXTVAL");
         
         dto.setName(a);
         
         dto.setTel(b);
         
         dao.add(dto);

         
      }
      while(true);
      
         
      ArrayList<MemberDTO> list = dao.lists();
      
         System.out.println("============================");
         System.out.printf("전체 회원수 : %d\n",dao.count());
         System.out.println("============================");
         System.out.println("번호    이름        전화번호");   
         for(MemberDTO each : dao.lists())
         {
            System.out.printf("%3s %8s %12s\n",each.getSid(),each.getName(),each.getTel());
         }
      
   }

}

 */



/*  경환씨 풀이과정 

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

public class MemberMain
{
   public static void main(String[] args) throws ClassNotFoundException, SQLException
   {
      // 변수 선언
      int i = 1;
      String name, tel;
      ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
      MemberDTO obj;
      
      // DTO 인스턴스 생성
      MemberDTO dto = new MemberDTO();
      // DAO 인스턴스 생성
      MemberDAO dao = new MemberDAO();
      // Scanner 인스턴스 생성
      Scanner sc = new Scanner(System.in);
      
      while(true)
      {
         System.out.printf("이름 전화번호 입력(%d) :", i);
         name = sc.next();
         
         if (name.equals("."))
            break;
         
         tel = sc.next();
         
         dto.setName(name);
         dto.setTel(tel);
         
         dao.add(dto);
         
         System.out.println("회원정보 입력 완료!");
         i++;
      }
      
      arr = dao.lists();
      Iterator<MemberDTO> it = arr.iterator();
      
      System.out.println("---------------------------------------------");
      System.out.printf("전체 회원 수 : %d\n", dao.count());      
      System.out.println("---------------------------------------------");
      System.out.println("번호   이름   전화번호");
      
      // iterator로 결과 출력 
      while(it.hasNext())
      {
         obj = it.next();
         System.out.printf("%s\t%s\t%s\n", obj.getSid(), obj.getName(), obj.getTel());
      }
      
      // for문으로 결과 출력
//      for (int j = 0; j<arr.size(); j++)
//         System.out.printf("%s\t%s\t%s\n", arr.get(j).getSid(), arr.get(j).getName(), arr.get(j).getTel());
      
      System.out.println("---------------------------------------------");
      
      dao.close();
      sc.close();
   }
}
 */