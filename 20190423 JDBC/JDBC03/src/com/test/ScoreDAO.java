package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
	// 주요 변수 선언 (DB 연결 객체)
	private Connection conn;

	// 생성자 정의
	public ScoreDAO()
	{
		conn = DBConn.getConnection();
	}

	// 메소드 정의 (데이터 입력 insert) → 학생 점수 입력
	public int add(ScoreDTO dto)
	{
		// 반환할 결과값을 담아낼 변수
		int result = 0;

		try
		{
			// 작업 객체 생성
			Statement stmt = conn.createStatement();

			// 쿼리문 준비
			String sql = String.format(
					"INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)" + " VALUES (SCORESEQ.NEXTVAL,'%s', %d, %d, %d)",
					dto.getName(), dto.getKor(), dto.getEng(), dto.getMat());

			// 쿼리문 전달
			result = stmt.executeUpdate(sql);

			stmt.close();

		} catch (Exception e)
		{
			System.out.println(e.toString());

		}

		// 최종 결과값 반환
		return result;

	}// end add()

	// 메소드 정의 (데이터 조회 select) → 전체 학생 수 조회
	public int count()
	{
		// 결과값 반환할 변수 선언 및 초기화
		int result = 0;

		try
		{
			// 작업 객체 생성
			Statement stmt = conn.createStatement();

			// 쿼리문 준비
			String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";

			// 쿼리문 실행
			ResultSet rs = stmt.executeQuery(sql);

			// ResultSet 처리
			while (rs.next())
			{
				rs.getInt("COUNT");
			}

			// 리소스 반납
			rs.close();
			stmt.close();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		// 최종 결과값 반환
		return result;

	}// end count

	// 메소드 정의 (데이터 조회 select) → 전체 학생 점수
	public ArrayList<ScoreDTO> lists()
	{
		// 결과값 반환할 변수 선언 및 초기화
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();

		try
		{
			// 작업 객체 생성
			Statement stmt = conn.createStatement();

			// 쿼리문 준비
			String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT)TOT, (KOR+ENG+MAT/3)AVG FROM TBL_SCORE ORDER BY SID";

			// 쿼리문 실행
			ResultSet rs = stmt.executeQuery(sql);

			// ResultSet 처리
			while (rs.next())
			{
				ScoreDTO dto = new ScoreDTO();

				dto.setSid(dto.getInt("SID"));
				dto.setName(dto.getString("NAME"));
				dto.setKor(dto.getInt("KOR"));
				dto.setEng(dto.getInt("ENG"));
				dto.setMat(dto.getInt("MAT"));
				dto.setTot(dto.getInt("TOT"));
				dto.setAvg(dto.getInt("AVG"));

				result.add(dto);
			}

			// 리소스 반납
			rs.close();
			stmt.close();
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		// 최종 결과값 반환
		return result;

	}// end list

	// 메소즈 정의 → 연결 종료
	public void close()
	{
		DBConn.close();
	}

}// end class
