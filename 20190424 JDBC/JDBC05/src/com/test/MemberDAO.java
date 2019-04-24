package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

import com.util.DBConn;

public class MemberDAO
{
	private static Connection conn;

	// DB 연결
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		return conn;
	}

	// 직원 입력 메소드 정의 (insert)
	public static int add(MemberDTO dto) throws SQLException
	{
		int result = 0;

		// 연결 객체 생성
		Statement stmt = conn.createStatement();

		// 쿼리문 준비
		String sql = String.format(
				"INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG)"
						+ " VALUES (EMPSEQ.NEXTVAL, '%s', '%s', '%s', %d, '%s', %d, %d, %d, %d)",
				dto.getEmpid(), dto.getEmpname(), dto.getSsn(), dto.getIbsadate(), dto.getCityid(), dto.getTel(),
				dto.getBuseoid(), dto.getJikwiid(), dto.getBasicpay(), dto.getSudang());

		// 쿼리문 전달
		result = stmt.executeUpdate(sql);

		stmt.close();

		return result;
	}

	// 직원 전체 출력 메소드 정의 (select)
	public static ArrayList<MemberDTO> lists(int selection) throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();

		// 연결 객체 생성
		Statement stmt = conn.createStatement();

		String sql = "";

		// switch문 분기 → 쿼리문 준비
		switch (selection)
		{
		// 사번 정렬
		case 1:
			sql = "SELECT EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG FROM TBL_EMP ORDER BY EMP_ID";
			break;

		// 이름 정렬
		case 2:
			sql = "SELECT EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG FROM TBL_EMP ORDER BY EMP_NAME";
			break;

		// 부서 정렬
		case 3:
			sql = "SELECT EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG FROM TBL_EMP ORDER BY BUSEO_ID";
			break;

		// 직위 정렬
		case 4:
			sql = "SELECT EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG FROM TBL_EMP ORDER BY JIKWI_ID";
			break;

		// 급여 내림차순
		case 5:
			sql = "SELECT EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG FROM TBL_EMP ORDER BY BASICPAY DESC";
			break;
		}

		// 쿼리문 전달
		ResultSet rs = stmt.executeQuery(sql);

		// ResultSet 처리
		if (rs.next())
		{
			MemberDTO dto = new MemberDTO();
			dto.setEmpid(rs.getString("EMP_ID"));
			dto.setEmpname(rs.getString("EMP_NAME"));
			dto.setSsn(rs.getString("SSN"));
			dto.setIbsadate(rs.getString("IBSADATE"));
			dto.setCityid(rs.getInt("CITY_ID"));
			dto.setTel(rs.getString("TEL"));
			dto.setBuseoid(rs.getInt("BUSEO_ID"));
			dto.setJikwiid(rs.getInt("JIKWI_ID"));
			dto.setBasicpay(rs.getInt("BASICPAY"));
			dto.setSudang(rs.getInt("SUDANG"));

			result.add(dto);
		}
		
		rs.close();
		stmt.close();
		
		return result;
	}

	// 직원 검색 출력 메소드 정의 (select)
	public ArrayList<MemberDTO> list(int seleciton, String condition) throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();

		// 연결 객체 생성
		Statement stmt = conn.createStatement();

		String sql = "";

		// switch문 분기 후 쿼리문 구성
		switch (seleciton)
		{
		// 1. 사번 검색
		case 1:
			sql = String.format(
					"SELECT EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG FROM TBL_EMP WHERE EMP_ID='%s'",
					condition);
			break;

		// 2. 이름 검색
		case 2:
			sql = String.format(
					"SELECT EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG FROM TBL_EMP WHERE EMP_NAME='%s'",
					condition);
			break;

		// 3. 부서 검색
		case 3:
			sql = String.format(
					"SELECT EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG FROM TBL_EMP WHERE BUSEO_ID='%s'",
					condition);
			break;

		// 4. 직위 검색
		case 4:
			sql = String.format(
					"SELECT EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG FROM TBL_EMP WHERE JIKWI_ID='%s'",
					condition);
			break;

		}

		// 쿼리문 전달
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next())
		{
			MemberDTO dto = new MemberDTO();
			dto.setEmpid(rs.getString("EMP_ID"));
			dto.setEmpname(rs.getString("EMP_NAME"));
			dto.setSsn(rs.getString("SSN"));
			dto.setIbsadate(rs.getString("IBSADATE"));
			dto.setCityid(rs.getInt("CITY_ID"));
			dto.setTel(rs.getString("TEL"));
			dto.setBuseoid(rs.getInt("BUSEO_ID"));
			dto.setJikwiid(rs.getInt("JIKWI_ID"));
			dto.setBasicpay(rs.getInt("BASICPAY"));
			dto.setSudang(rs.getInt("SUDANG"));

			result.add(dto);
		}
		
		rs.close();
		stmt.close();

		return result;
	}

	// 직원 수 확인 메소드 정의 (select)
	public int count() throws SQLException
	{
		int result = 0;

		// 연결 객체 생성
		Statement stmt = conn.createStatement();

		// 쿼리문 준비
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_EMP";

		// 쿼리문 전달
		ResultSet rs = stmt.executeQuery(sql);

		// ResultSet 처리
		while (rs.next())
			result = rs.getInt("COUNT");

		rs.close();
		stmt.close();

		return result;
	}

	// 직원 정보 수정 메소드 정의 (update)
	public int modify(int selection, String EMPID, String value) throws SQLException
	{
		int result = 0;
		Scanner sc = new Scanner(System.in);

		// 연결 객체 생성
		Statement stmt = conn.createStatement();

		String sql = "";

		// 쿼리문 구성
		switch (selection)
		{
		// 변경가능한 직원 정보 항목으로 분기 → 번호로 선택받기
		// (1) 이름
		case 1:
			sql = String.format("UPDATE TBL_EMP SET EMP_NAME='%s' WHERE EMP_ID ='%s'", value, EMPID);
			break;

		// (2) TEL
		case 2:
			sql = String.format("UPDATE TBL_EMP SET TEL='%s' WHERE EMP_ID ='%s'", value, EMPID);
			break;

		// (3) 부서ID
		case 3:
			sql = String.format("UPDATE TBL_EMP SET BUSEO_ID=%s WHERE EMP_ID ='%s'", value, EMPID);
			break;

		// (4) 직위ID
		case 4:
			sql = String.format("UPDATE TBL_EMP SET JIKWI_ID=%s WHERE EMP_ID ='%s'", value, EMPID);
			break;

		// (5) 기본급
		case 5:
			sql = String.format("UPDATE TBL_EMP SET BASICPAY=%s WHERE EMP_ID ='%s'", value, EMPID);
			break;

		// (6) 수당
		case 6:
			sql = String.format("UPDATE TBL_EMP SET SUDANG=%s WHERE EMP_ID ='%s'", value, EMPID);
			break;
		}

		// 쿼리문 전달
		result = stmt.executeUpdate(sql);

		stmt.close();

		return result;
	}

	// 직원 정보 삭제 메소드 정의 (delete)
	public int remove(int sid) throws SQLException
	{
		int result = 0;
		
		// 연결 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = String.format("DELETE FROM TBL_EMP WHERE EMP_ID = '%d';", sid);
		
		// 쿼리문 전달
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		
		return result;
	}
	
	// DB 연결 종료
	public void close() throws SQLException
	{
		DBConn.close();
	}

}
