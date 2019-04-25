package com.test;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

public class Process
{
	private MemberDAO dao;

	// MemberDAO 클래스와 process 클래스 연결
	public Process()
	{
		dao = new MemberDAO();
	}

	// 1. 직원 정보 입력 기능
	public void memberInsert()
	{
		// 예외처리
		try
		{
			// DB 연결
			dao.connection();

			// 레코드 수 확인
			int count = dao.count();

			// 입력받기 (직원 정보 입력값)
			Scanner sc = new Scanner(System.in);

			// 반복되는 내용이라 do~while 구성
			System.out.println("직원 정보 입력-------------------------------------------------------");
			System.out.print("이름 : ");
			String name = sc.next();

			System.out.print("주민등록번호(yymmdd-nnnnnnn) : ");
			String ssn = sc.next();

			System.out.print("입사일(yyyy-mm-dd) : ");
			String ibsadate = sc.next();

			System.out.print("지역(강원/경기/경남/경북/부산/서울/인천/전남/전북/제주/충남/충북) : ");
			String cityname = sc.next();

			System.out.print("전화번호 : ");
			String tel = sc.next();

			System.out.print("부서(개발부/기획부/영업부/인사부/자재부/총무부/홍보부) : ");
			String buseoname = sc.next();

			System.out.print("직위(사장/전무/상무/이사/부장/차장/과장/대리/사원) : ");
			String jikwiname = sc.next();

			System.out.print("기본급(최소 840000 이상) : ");
			int basicpay = sc.nextInt();

			System.out.print("수당 : ");
			int sudang = sc.nextInt();

			// MemberDTO 객체 구성 → dto 인스턴스 객체가 있어야 함.
			MemberDTO dto = new MemberDTO();
			dto.setEmpname(name);
			dto.setSsn(ssn);
			dto.setIbsadate(ibsadate);
			
			int cityid = dao.citycheck(cityname);
			dto.setCityid(cityid);
			
			dto.setTel(tel);
			int buseoid = dao.buseocheck(buseoname);
			
			dto.setBuseoid(buseoid);
			int jikwiid = dao.jikwicheck(jikwiname);
			dto.setBuseoid(jikwiid);
			dto.setBasicpay(basicpay);
			dto.setSudang(sudang);

			int result = dao.add(dto);
			if (result > 0)
				System.out.println("직원 정보가 입력되었습니다.");

			dao.close();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

	}// end memberInsert

	// 2. 직원 전체 출력 기능
	public void memberSelectAll()
	{

		try
		{
			// DB 연결
			dao.connection();

			// 전체 인원수 count() 메소드 호출
			int count = dao.count();

			// 입력받기(정렬 선택 값)
			Scanner sc = new Scanner(System.in);
			
			System.out.println("1. 사번 정렬");
			System.out.println("2. 이름 정렬");
			System.out.println("3. 부서 정렬");
			System.out.println("4. 직위 정렬");
			System.out.println("5. 급여 내림차순 정렬");
			System.out.print(">> 항목 선택(1~5, -1 종료 : ");
			int selection = sc.nextInt();
			
			// 수신된 내용 출력
			ArrayList<MemberDTO> arrayList = dao.lists(selection);

			System.out.println();
			System.out.printf("전체 인원 : %d 명", count);
			System.out.println("사번  이름	 주민번호 	입사일	지역	전화번호	부서 	직위 	기본급	수당	급여");

			for (MemberDTO dto : arrayList)
			{
				System.out.printf("%s %S %s %s %s %d %s %d %d %d %d\n", dto.getEmpid(), dto.getEmpname(), dto.getSsn(),
						dto.getIbsadate(), dto.getCityid(), dto.getTel(), dto.getBuseoid(), dto.getJikwiid(),
						dto.getBasicpay(), dto.getSudang());
			}

			// DB 연결 종료
			sc.close();
			dao.close();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

	}// end memberSelectAll

	// 3. 직원 검색 출력 기능
	public void memberSearch()
	{
		try
		{
			// DB 연결
			dao.connection();

			// 전체 인원수 count() 메소드 호출
			int count = dao.count();

			// 입력받기(정렬 선택 값)
			Scanner sc = new Scanner(System.in);
			System.out.println(">> 메뉴 선택(1~5, -1 종료) : ");
			int selection = sc.nextInt();

			String condition = sc.next();

			// 검색 내용 수신 - dao 의 검색 출력 메소드 (매개변수 2개) 호출
			ArrayList<MemberDTO> arrayList = dao.lists(selection, condition);

			// 수신된 내용 출력
			if (arrayList.size() > 0)
			{
				System.out.println();
				System.out.printf("전체 인원 : %d 명", count);
				System.out.println("사번  이름	 주민번호 	입사일	지역	전화번호	부서 	직위 	기본급	수당	급여");

				for (MemberDTO dto : arrayList)
				{
					System.out.printf("%s %S %s %s %s %d %s %d %d %d %d\n", dto.getEmpid(), dto.getEmpname(),
							dto.getSsn(), dto.getIbsadate(), dto.getCityid(), dto.getTel(), dto.getBuseoid(),
							dto.getJikwiid(), dto.getBasicpay(), dto.getSudang());
				}

			} else
			{
				System.out.println("검색 결과가 존재하지 않습니다.");
			}

			// DB 연결 종료
			sc.close();
			dao.close();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

	}

	// 4. 직원 정보 수정 기능
	public void memberUpdate()
	{
		try
		{
			// 입력받기(수정할 직원의 empid)
			Scanner sc = new Scanner(System.in);
			System.out.println("수정할 직원의 ID를 입력하세요 : ");
			String empid = sc.next();

			// DB 연결
			dao.connection();

			// 수정 대상 수신
			ArrayList<MemberDTO> arrayList = dao.lists(1, empid);

			// 수신된 내용 출력
			if (arrayList.size() > 0)
			{
				System.out.println();
				System.out.println("사번  이름	 주민번호 	입사일	지역	전화번호	부서 	직위 	기본급	수당	급여");

				for (MemberDTO dto : arrayList)
				{
					System.out.printf("%s %S %s %s %s %d %s %d %d %d %d\n", dto.getEmpid(), dto.getEmpname(),
							dto.getSsn(), dto.getIbsadate(), dto.getCityid(), dto.getTel(), dto.getBuseoid(),
							dto.getJikwiid(), dto.getBasicpay(), dto.getSudang());
					System.out.println();
					System.out.println("수정 데이터 입력(이름 전화번호 부서 직위 기본급 수당) : ");
				}

				String name = sc.next();
				String tel = sc.next();
				String buseoname = sc.next();
				String jikwiname = sc.next();
				int basicpay = sc.nextInt();
				int sudang = sc.nextInt();

				// dto 구성
				MemberDTO dto = new MemberDTO();
				dto.setEmpname(name);
				dto.setTel(tel);
				int buseoid = dao.buseocheck(buseoname);
				dto.setBuseoid(buseoid);
				int jikwiid = dao.jikwicheck(jikwiname);
				dto.setBuseoid(jikwiid);
				dto.setBasicpay(basicpay);
				dto.setSudang(sudang);
				dto.setEmpid(empid);

				int result = dao.modify(dto);
				if (result > 0)
					System.out.println("수정이 완료되었습니다.");

			} else
			{
				System.out.println("수정 대상이 존재하지 않습니다.");
			}

			// DB 연결 종료
			sc.close();
			dao.close();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

	}

	// 5. 직원 정보 삭제 기능
	public void memberDelete()
	{
		try
		{
			// 입력받기(삭제할 직원의 empid)
			Scanner sc = new Scanner(System.in);
			System.out.println("삭제할 직원의 ID를 입력하세요 : ");
			String empid = sc.next();

			// DB 연결
			dao.connection();

			// 수정 대상 수신
			ArrayList<MemberDTO> arrayList = dao.lists(1, empid);

			// 수신된 내용 출력
			if (arrayList.size() > 0)
			{
				System.out.println();
				System.out.println("사번  이름	 주민번호 	입사일	지역	전화번호	부서 	직위 	기본급	수당	급여");

				for (MemberDTO dto : arrayList)
				{
					System.out.printf("%s %S %s %s %s %d %s %d %d %d %d\n", dto.getEmpid(), dto.getEmpname(),
							dto.getSsn(), dto.getIbsadate(), dto.getCityid(), dto.getTel(), dto.getBuseoid(),
							dto.getJikwiid(), dto.getBasicpay(), dto.getSudang());
				}

				System.out.println(">> 정말 삭제하시겠습니까?(Y/N) ");
				String response = sc.next();
				if (response.equals("Y") || response.equals("y"))
				{
					int result = dao.remove(empid);
					if (result > 0)
						System.out.println("삭제가 완료되었습니다.");
				} else
				{
					System.out.println("삭제가 완료되었습니다.");
				}

				// DB 연결 종료
				sc.close();
				dao.close();

			} else
			{
				System.out.println("삭제 대상이 존재하지 않습니다.");
			}

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

	}

}
