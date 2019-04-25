/*======================================
 	MemberDAO.java
 	- 데이터베이스 액션 처리 전용 클래스 
 ======================================*/

// DB와 연결, 기능하는 메소드 정의한다. 
// 어떤 쿼리문과 매칭시켜야 하는지 헷갈렸다. 
// 쿼리문을 품고있는 메소드의 기능을 얼만큼 쪼개야 할까? 
// 찾기 - 수정 각각 다른 기능. 
// 매개변수를 어떻게 지정해야 할까?
// 아주 작은 단위업무 형태로 쪼개서 생각해야 한다. 계속 연습해보기.
package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberDAO
{
	// 1) 정보 은닉 private + 전역변수	Connection conn 선언 
	private Connection conn;
	
	// 2) DB 연결
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	// 3) DB 연결 종료
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	// 4) 직원 데이터 입력
	public int add(MemberDTO dto) throws SQLException
	{
		int result = 0;
		Statement stmt = conn.createStatement();
		// 어떤 쿼리문이, 어떻게 구성해야 한다는 감이 와야 String.format 사용할지 안할지 알 수 있다. 
		// IBSADATE 날짜형식이지만 문자로 구성했다. 
		// String.format 은 사용자로부터 값을 입력받아야 할때 사용, 단순 조회일 때는 "" 사용  
		String sql = String.format("INSERT INTO TBL_EMP"
				   + "(EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID"
				   + ", TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG)"
				   + " VALUES (EMPSEQ.NEXTVAL, '%s', '%s', TO_DATE('%s', 'YYYY-MM-DD')"
				   + ", (SELECT CITY_ID FROM TBL_CITY WHERE CITY_LOC ='%s')"
				   + ", '%s', (SELECT BUSEO_ID FROM TBL_BUSEO WHERE BUSEO_NAME='%s')"
				   + ", (SELECT JIKWI_ID FROM TBL_JIKWI WHERE JIKWI_NAME='%s')"
				   + ", %d, %d)"
				   , dto.getEmpName(), dto.getSsn(), dto.getIbsaDate()
				   , dto.getCityLoc(), dto.getTel(), dto.getBuseoName()
				   , dto.getJikwiName(), dto.getBasicPay(), dto.getSudang() );
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		
		return result;
	
	}// end add()
		
	// 5) 전체 직원 수 출력
	public int memberCount() throws SQLException 
	{
		// 5-1) 반환할 결과 변수 선언
		int result = 0;
		
		// 5-3) 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 5-4) 쿼리문 준비 
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_EMP";
		
		// 5-5) 쿼리문 실행 → ResultSet 반환
		ResultSet rs = stmt.executeQuery(sql);
		
		// 5-6) ReseultSet 처리 → 반복문 구성(단일값일 경우 조건문도 가능) → 결과값 수신
		while (rs.next())
			result = rs.getInt("COUNT");
		
		// 5-7) 리소스 반납
		rs.close();
		stmt.close();
		
		
		// 5-2) 최종 결과값 반환
		return result;
	}// end memberCount()
	
	// 검색 결과 직원수 조회
	// 매개변수 타입이 String 인 조건이 3개여서 메소드 오버로딩이 불가한 상태. 그러면 어떻게 할까?
	// → 매개변수로 key, value 로 지정해서 2개를 받으면? 
	
	//	SELECT COUNT(*) AS COUNT
	//	FROM EMPVIEW WHERE
	//	EMP_ID=1001;         →	key : EMP_ID     / value : 1001
	//	EMP_NAME=정임혜;	 → key : EMP_NAME   / value : 정임혜
	//	BUSEO_NAME='개발부'; → key : BUSEO_NAME / value : '개발부'
	//	JIKWI_NAME='대리';   → key : JIKWI_NAME / value : '대리'
	
	
	public int memberCount(String key, String value) throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		String sql = String.format
				   ("SELECT COUNT(*) AS COUNT FROM EMPVIEW WHERE %s='%s'", key, value);
		ResultSet rs = stmt.executeQuery(sql);
		
		//
		while (rs.next())
			result = rs.getInt("COUNT");
		
		
		rs.close();
		stmt.close();
		
		return result;
				
	}// end memberCount()
	
	
	// 직원 데이터 전체 조회 (사번/이름/부서/직위/급여 내림차순)
	// 매개변수 : 사용자로부터 입력받을 값
	// return : 멤버DTO 자료구조 타입의 정보를 return 하게 될 것이다. 
	public ArrayList<MemberDTO> lists(String key) throws SQLException
	{
		// 반환할 결과값 선언 및 초기화
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비 
		String sql = String.format("SELECT EMP_ID, EMP_NAME, SSN"
				   + ", TO_CHAR(IBSADATE, 'YYYY-MM-DD') AS IBSADATE"
				   + ", CITY_LOC, TEL, BUSEO_NAME, JIKWI_NAME, BASICPAY, SUDANG, PAY"
				   + " FROM EMPVIEW "
				   + "ORDER BY %s", key);
		// 쿼리문 실행
		ResultSet rs = stmt.executeQuery(sql);
		
		// ResultSet 처리 → 반복문 구성
		while (rs.next())
		{
			// 멤버 인스턴스 생성 : 여기에 값을 채울 것이다.
			MemberDTO dto = new MemberDTO();
			
			// ResultSet 으로부터 가지고 온 EMP_ID를 MemberDTO 의 EmpId 로 설정해주어야 한다.
			// ArrayList 에 적재할 MemberDTO 구성이 된 것.
			dto.setEmpId(rs.getInt("EMP_ID"));
			dto.setEmpName(rs.getString("EMP_NAME"));
			dto.setSsn(rs.getString("SSN"));
			dto.setIbsaDate(rs.getString("IBSADATE"));
			dto.setCityLoc(rs.getString("CITY_LOC"));
			dto.setTel(rs.getString("TEL"));
			dto.setBuseoName(rs.getString("BUSEO_NAME"));
			dto.setJikwiName(rs.getString("JIKWI_NAME"));
			dto.setBasicPay(rs.getInt("BASICPAY"));
			dto.setSudang(rs.getInt("SUDANG"));
			dto.setPay(rs.getInt("PAY"));
		
			result.add(dto);
		}
		
		// 리소스 반납
		rs.close();
		stmt.close();
		
		// 최종 결과값 반환
		return result;
		
	}//end list()
	
	
	// 직원 검색 (사번/이름/부서/직위)
	public ArrayList<MemberDTO> searchLists(String key, String value) throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		System.out.println(value);
		Statement stmt = conn.createStatement();
		String sql = String.format("SELECT EMP_ID, EMP_NAME, SSN"
				   + ", TO_CHAR(IBSADATE, 'YYYY-MM-DD') AS IBSADATE"
				   + ", CITY_LOC, TEL, BUSEO_NAME, JIKWI_NAME, BASICPAY"
				   + ", SUDANG, PAY "
				   + "FROM EMPVIEW "
				   + "WHERE %s ='%s'", key, value);
		
		// 쿼리문 실행
		ResultSet rs = stmt.executeQuery(sql);
		
		// ResultSet 처리 → 반복문 구성
		while (rs.next())
		{
			// 멤버 인스턴스 생성 : 여기에 값을 채울 것이다.
			MemberDTO dto = new MemberDTO();
			
			// ResultSet 으로부터 가지고 온 EMP_ID를 MemberDTO 의 EmpId 로 설정해주어야 한다.
			// ArrayList 에 적재할 MemberDTO 구성이 된 것.
			dto.setEmpId(rs.getInt("EMP_ID"));
			dto.setEmpName(rs.getString("EMP_NAME"));
			dto.setSsn(rs.getString("SSN"));
			dto.setIbsaDate(rs.getString("IBSADATE"));
			dto.setCityLoc(rs.getString("CITY_LOC"));
			dto.setTel(rs.getString("TEL"));
			dto.setBuseoName(rs.getString("BUSEO_NAME"));
			dto.setJikwiName(rs.getString("JIKWI_NAME"));
			dto.setBasicPay(rs.getInt("BASICPAY"));
			dto.setSudang(rs.getInt("SUDANG"));
			dto.setPay(rs.getInt("PAY"));
		
			result.add(dto);
		}
		
		// 리소스 반납
		rs.close();
		stmt.close();
		
		// 최종 결과값 반환
		return result;	
		
	}// end searchLists(key, value)
	
	// 지역 리스트 조회 
	public ArrayList<String> searchCity() throws SQLException
	{
		// 반환할 결과값 변수 선언 및 초기화
		ArrayList<String> result = new ArrayList<String>();
		
		// Statement 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = "SELECT CITY_LOC FROM TBL_CITY";

		// 쿼리문 실행
		ResultSet rs = stmt.executeQuery(sql);
		
		// ResultSet 처리
		while (rs.next())
			result.add(rs.getString("CITY_LOC"));
		
		// 리소스 반납
		rs.close();
		stmt.close();
		
		// 최종 결과값 반환
		return result;
	}
	
	// 부서 리스트 조회
	public ArrayList<String> searchBuseo() throws SQLException
	{
		// 반환할 결과값 변수 선언 및 초기화
		ArrayList<String> result = new ArrayList<String>();
		
		// Statement 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = "SELECT BUSEO_NAME FROM TBL_BUSEO";

		// 쿼리문 실행
		ResultSet rs = stmt.executeQuery(sql);
		
		// ResultSet 처리
		while (rs.next())
			result.add(rs.getString("BUSEO_NAME"));
		
		// 리소스 반납
		rs.close();
		stmt.close();
		
		// 최종 결과값 반환
		return result;
	}
		
	// 직위 검색
	public ArrayList<String> searchJikwi() throws SQLException
	{
		// 반환할 결과값 변수 선언 및 초기화
		ArrayList<String> result = new ArrayList<String>();
		
		// Statement 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = "SELECT JIKWI_NAME FROM TBL_JIKWI";

		// 쿼리문 실행
		ResultSet rs = stmt.executeQuery(sql);
		
		// ResultSet 처리
		while (rs.next())
			result.add(rs.getString("JIKWI_NAME"));
		
		// 리소스 반납
		rs.close();
		stmt.close();
		
		// 최종 결과값 반환
		return result;
	}
	
	// 직위에  따른 최소 기본급 검색
	public int searchBasicPay(String jikwi) throws SQLException
	{
		int result = 0;

		Statement stmt = conn.createStatement();		
		String sql = String.format("SELECT MIN_BASICPAY FROM TBL_JIKWI WHERE JIKWI_NAME = '%s'", jikwi);
		ResultSet rs = stmt.executeQuery(sql);
		
		// rs.next로 ResultSet 에 값이 있는지 없는지 보고 오겠다. 
		while (rs.next())
		{
			result = rs.getInt("MIN_BASICPAY");
		}
		rs.close();
		stmt.close();
		
		return result;

	}
	
	
	// 직원 수정
	public int modify(MemberDTO dto) throws SQLException
	{
		int result =0;
		
		Statement stmt = conn.createStatement();
		String sql = String.format("UPDATE TBL_EMP"
				   + " SET EMP_NAME='%s', SSN='%s', IBSADATE=TO_DATE('%s', 'YYYY-MM-DD')"
				   + ", CITY_ID=(SELECT CITY_ID FROM TBL_CITY WHERE CITY_LOC='%s')"
				   + ", TEL='%s'"
				   + ", BUSEO_ID=(SELECT BUSEO_ID FROM TBL_BUSEO WHERE BUSEO_NAME='%s')"
				   + ", JIKWI_ID=(SELECT JIKWI_ID FROM TBL_JIKWI WHERE JIKWI_NAME='%S')"
				   + ", BASICPAY=%d, SUDANG=%d "
				   + "WHERE EMP_ID=%d" 
				   , dto.getEmpName(), dto.getSsn(), dto.getIbsaDate()
				   , dto.getCityLoc(), dto.getTel(), dto.getBuseoName()
				   , dto.getJikwiName(), dto.getBasicPay(), dto.getSudang()
				   , dto.getEmpId());
		
		result = stmt.executeUpdate(sql);
		stmt.close();
		
		return result;		
	}
	
	// 직원 삭제 
	public int remove(int empId) throws SQLException
	{
		int result =0;
		Statement stmt = conn.createStatement();
		String sql = String.format("DELETE FROM TBL_EMP WHERE EMP_ID =%d", empId);
		
		result = stmt.executeUpdate(sql);
		stmt.close();

		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
