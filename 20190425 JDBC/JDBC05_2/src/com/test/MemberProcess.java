/*=========================================
 	MemberProcess.java
 	- 콘솔기반 서브메뉴 입출력 전용 클래스
 =========================================*/

package com.test;

import java.util.ArrayList;
import java.util.Scanner;

public class MemberProcess
{
	// MemberDAO 와 Process 연결 
	private MemberDAO dao;
	
	// 생성자 정의 
	public MemberProcess()
	{
		dao = new MemberDAO();
	}
	
	// 직원 정보 입력 메소드 정의
	public void memberInsert()
	{
		Scanner sc = new Scanner(System.in);
		
		try
		{
			// DB 연결
			dao.connection();
			
			// 지역 리스트 구성
			ArrayList<String> citys = dao.searchCity();
//			String cityStr = "";	
			StringBuilder cityStr = new StringBuilder();
			
			for (String city : citys)
			{
//				cityStr += city + "/";
//				문자열결합 StringBuffer  append()
				cityStr.append(city + "/");	
			}
					
			// 부서 리스트 구성
			ArrayList<String> buseos = dao.searchBuseo();
			
			StringBuilder buseoStr = new StringBuilder();
			
			for (String buseo : buseos)
			{
				buseoStr.append(buseo + "/");
			}
			
			
			// 직위 리스트 구성
			ArrayList<String> jikwis = dao.searchJikwi();
			StringBuilder jikwiStr = new StringBuilder();
			
			for (String jikwi : jikwis)
			{
				jikwiStr.append(jikwi + "/");
			}
		
			
			System.out.println();
			System.out.println("직원 정보 입력 ---------------------------------------------");
			System.out.println("이름 : ");
			String name = sc.next();
			
			System.out.println("주민등록번호(yymmdd-nnnnnnn) :");
			String ssn = sc.next();
			
			System.out.println("입사일(yyyy-mm-dd) :");
			String cityLoc = sc.next();
			System.out.printf("지역(%s) : ", cityStr.toString());
			String ibsadate = sc.next();
			System.out.println("전화번호 : ");
			String tel = sc.next();
			System.out.printf("부서(%s) : ", buseoStr.toString());
			String buseoname = sc.next();
			System.out.printf("직위(%s) : ", jikwiStr.toString());
			String jikwiname = sc.next();
			System.out.printf("기본급(최소 %d원 이상 : ", dao.searchBasicPay(jikwiname));
			int basicPay = sc.nextInt();
			System.out.println("수당 : ");
			int sudang = sc.nextInt();
			
			MemberDTO dto = new MemberDTO();
			dto.setEmpName(name);
			dto.setSsn(ssn);
			dto.setIbsaDate(ibsadate);
			dto.setCityLoc(cityLoc);
			dto.setTel(tel);
			dto.setBuseoName(buseoname);
			dto.setJikwiName(jikwiname);
			dto.setBasicPay(basicPay);
			dto.setSudang(sudang);
			
			int result = dao.add(dto);
			if (result > 0)
				System.out.println("직원 정보 입력 완료-!!!");
			
			System.out.println("---------------------------------------------------");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
			
			finally
			{
				try
				{
					dao.close();
					
				} catch (Exception e2)
				{
					System.out.println(e2.toString());
				}
			}
					
	} // end memberInsert

	/*
	 실행 예)
	=======[ 직원 관리 ]=======
	1. 직원 정보 입력
	2. 직원 전체 출력
		- 사번 정렬
		- 이름 정렬
		- 부서 정렬
		- 직위 정렬
		- 급여 내림차순 정렬
	3. 직원 검색 출력
		- 사번 검색
		- 이름 검색
		- 부서 검색
		- 직위 검색
	4. 직원 정보 수정
	5. 직원 정보 삭제
	============================
	>> 메뉴 선택(1~5, -1 종료) : 1
	
	직원 정보 입력 ---------------------------------------------
	이름 : 김정규
	주민등록번호(yymmdd-nnnnnnn) : 900123-1234567
	입사일(yyyy-mm-dd) : 2019-02-12
	지역(강원/경기/경남/경북/부산/서울/인천/전남/전북/제주/충남/충북) : 경기
	전화번호 : 010-1111-1111
	부서(개발부/기획부/영업부/인사부/자재부/총무부/홍보부) : 개발부
	직위(사장/전무/상무/이사/부장/차장/과장/대리/사원) : 사원
	기본급(최소 840000 이상) : 850000
	수당 : 2000000
	 */
	
	// 직원 검색 출력 메소드 정의 
	public void memberLists()
	{
		//-- 사용자가 입력할 내용 정리 시작
		Scanner sc = new Scanner(System.in);
		
		// 서브 메뉴 출력
		System.out.println("1. 사번 정렬");	// EMP_ID
		System.out.println("2. 이름 정렬"); // EMP_NAME
		System.out.println("3. 부서 정렬");	// BUSEO_NAME
		System.out.println("4. 직위 정렬"); // JIKWI_NAME
		System.out.println("5. 급여 내림차순 정렬"); 	// PAY DESC
		System.out.print(">> 항목 선택(1~5, -1 종료 : ");
		
		String munuStr = sc.next();
		
		try
		{
			int munu = Integer.parseInt(munuStr);
			
			if (munu == -1)
				return;	// 프로그램 종료. memberLists() 종료 
			
			String key = "";
			
			switch (munu)
			{
				case 1 : 
					key = "EMP_ID";
					break;
				case 2 : 
					key = "EMP_NAME";
					break;
				case 3 : 
					key = "BUSEO_NAME";
					break;
				case 4 : 
					key = "JIKWI_NAME";
					break;
				case 5 : 
					key = "PAY DESC";
					break;
							
			}
		//-- 사용자가 입력할 내용 정리 끝
			
		// DB 연결
		dao.connection();
		
		// 직원 리스트 출력
		System.out.println();
		System.out.printf("전체 인원 :  %s 명\n", dao.memberCount());
		System.out.println("사번  이름	 주민번호 	입사일	지역	전화번호	부서 	직위 	기본급	수당	급여");
		ArrayList<MemberDTO> memList = dao.lists(key);
		
		for (MemberDTO memberDTO : memList)
		{
			System.out.printf("%d %s %s %s %s %s %s %s %d %d %d\n"
			                 , memberDTO.getEmpId(), memberDTO.getEmpName()
			                 , memberDTO.getSsn(), memberDTO.getIbsaDate()
			                 , memberDTO.getCityLoc(), memberDTO.getTel()
			                 , memberDTO.getBuseoName(), memberDTO.getJikwiName()
			                 , memberDTO.getBasicPay(), memberDTO.getSudang()
			                 , memberDTO.getPay() );
	
		}

			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		} finally
		{
			try
			{
				dao.close();
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}		
		}
		
	}
	
	// 직원 검색 출력 메소드 정의
	public void memberSearch()
	{
		//-- 사용자가 입력할 내용 정리 시작
		Scanner sc = new Scanner(System.in);
		
		// 서브 메뉴 출력
		System.out.println();
		System.out.println("1. 사번 검색");	// EMP_ID
		System.out.println("2. 이름 검색"); // EMP_NAME
		System.out.println("3. 부서 검색");	// BUSEO_NAME
		System.out.println("4. 직위 검색"); // JIKWI_NAME
		System.out.print(">> 항목 선택(1~4), -1 종료 : ");
		String munuStr  = sc.next();
		
		try
		{
			int menu = Integer.parseInt(munuStr);
			
			if (menu == -1)
				return;
			
			String key = "";
			String value ="";
			
			switch (menu)
			{
				case 1 :
					key = "EMP_ID";
					System.out.println();
					System.out.print("검색할 사원번호를 입력 : ");
					value = sc.next();
					break;
					
				case 2 :
					key = "EMP_NAME";
					System.out.println();
					System.out.print("검색할 이름을 입력 : ");
					value = sc.next();
					break;
					
				case 3 :
					key = "BUSEO_NAME";
					System.out.println();
					System.out.print("검색할 부서이름을 입력 : ");
					value = sc.next();
					break;
					
				case 4 :
					key = "JIKWI_NAME";
					System.out.println();
					System.out.print("검색할 직위를 입력 : ");
					value = sc.next();
					break;
			}
			
			// DB 연결
			dao.connection();
			
			// 직원 리스트 출력
			System.out.println();
			System.out.printf("전체 인원 :  %d 명\n", dao.memberCount(key, value));
			System.out.println("사번  이름	 주민번호 	입사일	지역	전화번호	부서 	직위 	기본급	수당	급여");
			ArrayList<MemberDTO> memList = dao.searchLists(key, value);
			
			for (MemberDTO memberDTO : memList)
			{
				System.out.printf("%d %s %s %s %s %s %s %s %d %d %d\n"
				                 , memberDTO.getEmpId(), memberDTO.getEmpName()
				                 , memberDTO.getSsn(), memberDTO.getIbsaDate()
				                 , memberDTO.getCityLoc(), memberDTO.getTel()
				                 , memberDTO.getBuseoName(), memberDTO.getJikwiName()
				                 , memberDTO.getBasicPay(), memberDTO.getSudang()
				                 , memberDTO.getPay() );
			}
					
				
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
	}// end memberSearch
	
	
	// 직원 정보 수정 메소드 정의 
	public void memberUpdate()
	{
		Scanner sc = new Scanner(System.in);
		
		try
		{
			// 수정할 대상 입력받기
			System.out.print("수정할 직원의 사원번호 입력 : ");
			String value = sc.next();
			
			// DB연결
			dao.connection();
			
			ArrayList<MemberDTO> members = dao.searchLists("EMP_ID", value);
			
			if (members.size() > 0 )
			{
				// 지역 리스트 구성
				ArrayList<String> citys = dao.searchCity();
				StringBuilder cityStr = new StringBuilder();
				for (String city : citys)
				{
					cityStr.append(city + "/");	
				}
						
				// 부서 리스트 구성
				ArrayList<String> buseos = dao.searchBuseo();
				StringBuilder buseoStr = new StringBuilder();
				for (String buseo : buseos)
				{
					buseoStr.append(buseo + "/");
				}
				
				
				// 직위 리스트 구성
				ArrayList<String> jikwis = dao.searchJikwi();
				StringBuilder jikwiStr = new StringBuilder();
				for (String jikwi : jikwis)
				{
					jikwiStr.append(jikwi + "/");
				}
				
				MemberDTO mMember = members.get(0);
				int mEmpID = mMember.getEmpId();
				String mEmpName = mMember.getEmpName();
				String mSsn= mMember.getSsn();
				String mIbsadate= mMember.getIbsaDate();
				String mCityLoc = mMember.getCityLoc();
				String mTel = mMember.getTel();
				String mBuseoName = mMember.getBuseoName();
				String mJikwiName = mMember.getJikwiName();
				int mBasicPay = mMember.getBasicPay();
				int mSudang = mMember.getSudang();
				
				System.out.println();
				System.out.println("직원 정보 수정---------------------------------------------");
				System.out.printf("기존 이름 : %s%n", mEmpName);
				System.out.println("수정 이름 : ");
				String empName = sc.next();
				if (empName.equals("-"))
					empName = mEmpName;
				
				System.out.printf("기존 주민번호(yymmdd-nnnnnnn) : %s%n", mSsn);
				System.out.print("수정 주민번호(yymmdd-nnnnnnn) : ");
				String Ssn = sc.next();
				if (Ssn.equals("-"))
					Ssn = mSsn;
				
				System.out.printf("기존 입사일(yyyy-mm-dd) : %s%n", mIbsadate);
				System.out.print("수정 입사일(yyyy-mm-dd) : ");
				String Ibsadate = sc.next();
				if (Ibsadate.equals("-"))
					Ibsadate = mIbsadate;
				
				System.out.printf("기존 지역 : %s%n", mCityLoc);
				System.out.printf("수정 지역(%s) : %s%n", cityStr.toString());				
				String cityLoc = sc.next();
				if (cityLoc.equals("-"))
					cityLoc = mCityLoc;
				
				System.out.printf("기존 전화번호 : %s%n", mTel);
				System.out.print("수정 전화번호 : ");				
				String tel = sc.next();
				if (tel.equals("-"))
					tel = mTel;
				
				System.out.printf("기존 부서 : %s%n", mBuseoName);
				System.out.printf("수정 부서(%s) : ", buseoStr);				
				String buseoName = sc.next();
				if (buseoName.equals("-"))
					buseoName = mBuseoName;
				
				System.out.printf("기존 직위 : %s%n", mJikwiName);
				System.out.printf("수정 직위(%s) : ", jikwiStr);				
				String jikwiName = sc.next();
				if (jikwiName.equals("-"))
					jikwiName = mJikwiName;
				
				System.out.printf("기존 기본급 : %d%n", mBasicPay);
				System.out.printf("수정 기본급(최소 %d원 이상) : ", dao.searchBasicPay(jikwiName));				
				String basicPayStr = sc.next();
				int basicPay = 0;
				if (basicPayStr.equals("-"))
					basicPay = mBasicPay;
				else
					basicPay = Integer.parseInt(basicPayStr);
				
				System.out.printf("기존 수당 : %d%n", mSudang);
				System.out.print("수정 수당 : ");				
				String sudangStr = sc.next();
				int sudang = 0;
				if (sudangStr.equals("-"))
					sudang = mSudang;
				else
					sudang = Integer.parseInt(sudangStr);
				
				MemberDTO member = new MemberDTO();
				member.setEmpId(mEmpID);
				member.setEmpName(empName);
				member.setSsn(Ssn);
				member.setIbsaDate(Ibsadate);
				member.setCityLoc(cityLoc);
				member.setTel(tel);
				member.setBuseoName(buseoName);
				member.setJikwiName(jikwiName);
				member.setBasicPay(basicPay);
				member.setSudang(sudang);

				int result = dao.modify(member);
				if (result > 0)
						System.out.println("직원정보 수정 완료-!!!");
				
				System.out.println("-----------------------------------------------------------");
				
			} else
			{
				System.out.println("수정 대상을 검색하지 못했습니다. ");
			}
			/* 내가 추가로 작성한 내용 
			// 지역 조회 메소드 
			ArrayList<String> citys = dao.searchCity();
			StringBuilder cityStr = new StringBuilder();
			
			for (String city : citys)
			{
				cityStr.append(city + "/");
			}
			
			// 부서 조회 메소드
			ArrayList<String> buseos = dao.searchBuseo();
			StringBuilder buseoStr = new StringBuilder();
			
			for (String buseo : buseos)
			{
				buseoStr.append(buseo + "/");
			}
			
			// 직위 조회 메소드
			ArrayList<String> jikwis = dao.searchJikwi();
			StringBuilder jikwiStr = new StringBuilder();
			
			for (String jikwi : jikwis)
			{
				jikwiStr.append(jikwi + "/");
			}
			
			ArrayList<MemberDTO> members = dao.searchLists("EMP_ID", value);
			
			for (MemberDTO memberDTO : members)
			{
							
				// 사용자에게 입력받을 정보 처리 
				System.out.println();
				System.out.println("수정할 직원 정보 입력 --------------------------------------");
				System.out.printf("기존 이름 : %s\n", memberDTO.getEmpName());
				System.out.print("수정 이름 : ");
				String name = sc.next();
				if (name.equals("-"))
					name = memberDTO.getEmpName();
					
				System.out.printf("기존 주민등록번호(yymmdd-nnnnnnn) : %s\n", memberDTO.getSsn());
				System.out.print("수정 주민등록번호(yymmdd-nnnnnnn) : ");
				String ssn = sc.next();
				if (ssn.equals("-"))
					ssn = memberDTO.getSsn();
				
				System.out.printf("기존 입사일(yyyy-mm-dd) : %s\n", memberDTO.getIbsaDate());
				System.out.print("수정 입사일(yyyy-mm-dd) :");
				String ibsadate = sc.next();
				if (ibsadate.equals("-"))
					ibsadate = memberDTO.getIbsaDate();
				
				System.out.printf("기존 지역(%s) : %s\n", cityStr.toString(), memberDTO.getCityLoc());
				System.out.print("수정 지역 : ");
				String cityname = sc.next();
				if (cityname.equals("-"))
					cityname = memberDTO.getCityLoc();
				
				System.out.printf("기존 전화번호 : %s\n", memberDTO.getTel());
				System.out.print("수정 전화번호 : ");
				String tel = sc.next();
				if (tel.equals("-"))
					tel = memberDTO.getTel();
				
				System.out.printf("기존 부서(%s) : %s\n", buseoStr.toString(), memberDTO.getBuseoName());
				System.out.print("수정 부서 : ");
				String buseoname = sc.next();
				if (buseoname.equals("-"))
					buseoname = memberDTO.getBuseoName();
				
				System.out.printf("기존 직위(%s) : %s\n", jikwiStr.toString(), memberDTO.getJikwiName());
				System.out.print("수정 직위 : ");
				String jikwiname = sc.next();
				if (jikwiname.equals("-"))
					jikwiname = memberDTO.getJikwiName();
				
				System.out.printf("기존 기본급(최소 %d원 이상) : %s\n", dao.searchBasicPay(jikwiname), memberDTO.getBasicPay());
				System.out.printf("수정 기본급(최소 %d원 이상) : ", dao.searchBasicPay(jikwiname));
				String basicPay = sc.next();
				if (basicPay.equals("-"))
					basicPay = String.valueOf(memberDTO.getBasicPay());
				
				System.out.printf("기존 수당 : %s\n", memberDTO.getSudang());
				System.out.print("수정 수당 : ");
				String sudang = sc.next();
				if (sudang.equals("-"))
					sudang = String.valueOf(memberDTO.getSudang());
				
				MemberDTO dto = new MemberDTO();
				dto.setEmpName(name);
				dto.setSsn(ssn);
				dto.setIbsaDate(ibsadate);
				dto.setCityLoc(cityname);
				dto.setTel(tel);
				dto.setBuseoName(buseoname);
				dto.setJikwiName(jikwiname);
				dto.setBasicPay(Integer.valueOf(basicPay));
				dto.setSudang(Integer.valueOf(sudang));
				dto.setEmpId(Integer.valueOf(value));
			
				int result = dao.modify(dto);
				
				if(result > 0)
					System.out.println("직원 정보가 수정되었습니다.");
				
				System.out.println("------------------------------------------------------------");
			}
			
			*/
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				dao.close();
				
			} catch (Exception e2)
			{
				System.out.println(e2.toString());	
			}
		}
		
		
	}
	
	// 직원 정보 삭제 메소드 정의 
	
	
	
}
