/*=========================
 	ScoreDAO.java
 =========================*/

package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAOBackup
{
	// DB 연결 객체
	private Connection conn;
	
	// 데이터베이스 연결 담당 메소드 (별도로 정의 → 추가된 부분)
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		return conn;
		
	}
	
	// 데이터 입력 담당 메소드 (insert)
	public int add(ScoreDTO dto) throws SQLException
	{
		int result=0;
		
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
				   + " VALUES(SCORESEQ.NEXTVAL, %s, %d, %d, %d)"
				   , dto.getName(), dto.getKor(), dto.getEng(), dto.getMat())
				   ;
		
		// 쿼리문 전달 
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		
		return result;
	}
	
	// 전체 리스트 출력 담당 메소드
	public ArrayList<ScoreDTO> list() throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = "SELECT SID, NAME, KOR, ENG, MAT"
				   + " (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT/3) AS AVG"
				   + ", RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK"
				   + " FROM TBL_SCORE ORDER BY SID ASC"
				   ;
		
		// 쿼리문 전달
		ResultSet rs = stmt.executeQuery(sql);
		
		//ResultSet 처리
		while (rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getInt("AVG"));
			dto.setRank(rs.getInt("RANK"));
			
			result.add(dto);
		}
		rs.close();
		stmt.close();
		
		return result;		
	}
	
	// 이름 검색 담당 메소드
	// (1) 이름을 검색 키워드(매개변수)로 넘겨줌 
	// (2) 여러명의 이름일거라 ArrayList<ScoreDTO>
	public ArrayList<ScoreDTO> lists() throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		// 작업객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = String.format("SELECT * " + " FROM(SELECT SID, NAME, KOR, ENG, MAT"
				   + ", (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT/3) AS AVG"
				   + ", RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK FROM TBL_SCORE)"
				   + " WHERE NAME ='%s'", name);
		
		// 쿼리문 전달 
		ResultSet rs = stmt.executeQuery(sql);
		
		// ResultSet 처리
		while (rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getDouble("AVG"));
			dto.setRank(rs.getInt("RANK"));
			
			result.add(dto);			
		}
		
		rs.close();
		stmt.close();
				
		return result;		
	}
	
	// 번호 검색 담당 메소드
	// (1) String sid 로 매개변수 못 넘겨줌 → 이름 검색 담당 메소드에서 이미 오버라이딩 되었기 때문
	// (2) 리턴자료형을 ScoreDTO로 해도 되지만, 맞춰줘야 하기 때문에 ArrayList<ScoreDTO> 로 선언해주어야 한다.
	public ArrayList<ScoreDTO> lists(int sid) throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		// 작업객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = String.format("SELECT * FROM(SELECT SID, NAME, KOR, ENG, MAT"
				   + ", (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT/3) AS AVG"
				   + ", RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK FROM TBL_SCORE)"
				   + " WHERE NAME ='%s'", sid);
		
		// 쿼리문 전달 
		ResultSet rs = stmt.executeQuery(sql);
		
		// ResultSet 처리
		while (rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getDouble("AVG"));
			dto.setRank(rs.getInt("RANK"));
			
			result.add(dto);			
		}
		
		rs.close();
		stmt.close();
		
		return result;	
	}
	
	// 인원 수 확인 담당 메소드
	public int count() throws SQLException
	{
		int result = 0;
		
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		
		// 쿼리문 전달
		ResultSet rs = stmt.executeQuery(sql);
		
		//ResultSet 처리
		while (rs.next())
		{
			rs.getInt("COUNT");			
		}
		
		rs.close();
		stmt.close();
		
		return  result;
		
	}
	
	// 데이터 수정 담당 메소드
	// 매개변수로 sid 는 수정전 에 필요한 것. 
	// 무엇을 얼마나 바꿀 것인지, 매개변수로 받아야 한다. 즉, 한명의 점수 = ScoreDTO 를 매개변수로 받아야 한다.
	// add 와 마찬가지로 수정이 되었으면 변경된 행의 갯수를 반환한다.
	// → update 후 int로 결과를 반환할 것이기에 int
	public int modify(ScoreDTO dto) throws SQLException
	{
		int result = 0;
		
		// 작업 객체 생성 
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql =String.format("UPDATE TBL_SCORE" + "SET NAME='%s', KOR=%d, ENG=%d, MAT=%d WHERE SID=%s"
		                         , dto.getName(), dto.getKor(), dto.getEng(), dto.getMat(), dto.getSid()) 
				                 ;
		
		// 쿼리문 전달 executeUpdate
		result = stmt.executeUpdate(sql);
		
		// 적용된 행의 갯수(레코드) 반환 		
		return result;
	}
	
	// 데이터 삭제 담당 메소드
	public int remove(int sid) throws SQLException
	{
		int result = 0;
		
		// 작업 객체 생성 
		Statement stmt = conn.createStatement();

		// 쿼리문 준비
		String sql = String.format("DELETE FROM TBL_SCORE WHERE SID=%d", sid)
				   ;
		
		// 쿼리문 전달 executeUpdate
		result = stmt.executeUpdate(sql);

		stmt.close();
				   
		// 적용된 행의 갯수(레코드) 반환 	
		return result;
		
	}
	
	// 데이터베이스 연결 종료 담당 메소드
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
