/*==============================================
 	ScoreProcess.java
 	- JDBC04 재작성 (Preparedstatement 적용하여)
 ==============================================*/

package com.test;

import java.util.ArrayList;
import java.util.Scanner;

public class ScoreProcess
{
	private ScoreDAO dao;

	// 생성자 정의
	public ScoreProcess()
	{
		dao = new ScoreDAO();

	}

	// 성적 입력
	public void sungjukInsert()
	{
		try
		{
			// DB 연결
			dao.connection();

			Scanner sc = new Scanner(System.in);

			do
			{
				System.out.println();
				System.out.print(" 번 학생 성적 입력(이름 국어 영어 수학) : ");
				String name = sc.next();

				if (name.equals("."))
					break;

				int kor = sc.nextInt();
				int eng = sc.nextInt();
				int mat = sc.nextInt();

				// ScoreDTO 에 담기
				ScoreDTO dto = new ScoreDTO();
				dto.setName(name);
				dto.setKor(kor);
				dto.setEng(eng);
				dto.setMat(mat);

				int result = dao.add(dto);

				if (result > 0)
					System.out.println("성적이 입력되었습니다.");

			} while (true);

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

	}

	// 성적 조회
	public void sungjukSelectAll()
	{
		try
		{
			// DB 연결
			dao.connection();

			Scanner sc = new Scanner(System.in);

			System.out.println();
			System.out.println(" 번호	이름 	국어	영어	 수학	 총점	 평균	 석차");

			for (ScoreDTO dto : dao.lists())
			{
				System.out.printf("%3d %4s %5d %5d %5d %5d %5.1f %5d", dto.getSid(), dto.getName(), dto.getKor(),
						dto.getEng(), dto.getMat(), dto.getTot(), dto.getAvg(), dto.getRank());
			}

		} catch (Exception e)
		{
			System.out.println(e.toString());

		}
	}

	// 성적 이름으로 검색
	public void sungjukSearchName()
	{
		try
		{
			// 사용자로부터 이름 입력 받기
			Scanner sc = new Scanner(System.in);

			System.out.println("검색할 이름 입력 : ");
			String name = sc.next();

			// DB 연결
			dao.connection();

			// 매개변수로 검색할 이름 넘겨주기
			ArrayList<ScoreDTO> arrayList = dao.lists(name);

			if (arrayList.size() > 0)
			{
				System.out.println();
				System.out.print(" 번호	이름 	국어	영어	 수학	 총점	 평균	 석차");

				for (ScoreDTO dto : arrayList)
				{
					System.out.printf("%3d %4s %5d %5d %5d %5d %5.1f %5d", dto.getSid(), dto.getName(), dto.getKor(),
							dto.getEng(), dto.getMat(), dto.getTot(), dto.getAvg(), dto.getRank());
				}

			} else
			{
				System.out.println("이름 검색 결과가 없습니다.");
			}

			// DB 연결 종료

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}

	// 성적 수정
	public void sungjukUpdate()
	{
		// 성적 수정할 학생번호 입력 받기
		Scanner sc = new Scanner(System.in);
		System.out.print("수정할 학생 번호를 입력하세요 : ");
		int sid = sc.nextInt();

		// DB 연결
		dao.connection();

		// 수정 메소드 호출하며, 매개변수로 학생번호 넘겨주기
		ArrayList<ScoreDTO> arrayList = dao.lists(sid);

		if (arrayList.size() > 0)
		{
			System.out.println();
			System.out.println("번호	이름 	국어	영어	 수학	 총점	 평균	 석차");

			for (ScoreDTO dto : arrayList)
			{
				System.out.printf("%d %s %d %d %d %d %d %d ", dto.getSid(), dto.getName(), dto.getKor(), dto.getEng(),
						dto.getMat(), dto.getTot(), dto.getAvg(), dto.getRank());
			}

			String name = sc.next();
			int kor = sc.nextInt();
			int eng = sc.nextInt();
			int mat = sc.nextInt();

			// ScoreDTO 에 담아주기

			ScoreDTO dto = new ScoreDTO();
			dto.setSid(sid);
			dto.setName(name);
			dto.setKor(kor);
			dto.setEng(eng);
			dto.setMat(mat);

			int result = dao.modify(dto);
			if (result > 0)
				System.out.println("성적이 수정되었습니다.");
		
		} else
		{
			System.out.println("수정 대상이 존재하지 않습니다.");
		}

	}

	// 성적 삭제
	public void sungjukDelete()
	{
		try
		{
			// 사용자로부터 삭제할 학생의 번호 입력 받기
			Scanner sc = new Scanner(System.in);
			System.out.println("삭제할 학생 번호를 입력하세요 : ");
			int sid = sc.nextInt();
			
			// DB 연결
			dao.connection();
			
			// 학생번호로 성적 조회 메소드 호출하여, 매개변수로 학생번호 넘겨주기
			ArrayList<ScoreDTO> arrayList = dao.lists(sid);
			
			for (ScoreDTO dto : arrayList)
			{
				System.out.printf("%d %s %d %d %d %d %d %d "
						          , dto.getSid(), dto.getName()
						          , dto.getKor(), dto.getEng(), dto.getMat()
						          , dto.getTot(), dto.getAvg(), dto.getRank() );
			}
			
			System.out.print(">> 정말 삭제하시겠습니까?(Y/N) : ");
			String response = sc.next();
			if (response.equals("Y") || response.equals("y") )
			{
				int result  = dao.delete(sid);
				if (result > 0 )
					System.out.println("삭제가 완료되었습니다.");
			} else
			{
				System.out.println("삭제가 완료되었습니다.");
				
			}
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}	
	}
}
