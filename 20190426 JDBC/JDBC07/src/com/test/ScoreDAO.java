package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
	private static Connection conn;

	// DB 연결 메소드 
	public Connection connection()
	{
		conn = DBConn.getConnection();
		return conn;
	}

	// 성적 입력 메소드 (insert)
	public int add(ScoreDTO dto)
	{
		int result = 0;

		try
		{
			String sql = "INSERT INTO TBL_SCORE (SID, NAME, KOR, ENG, MAT) VALUES (?, ?, ?, ?, ?)";

			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, Integer.parseInt("SID"));
			pstmt.setString(2, "NAME");
			pstmt.setInt(3, Integer.parseInt("KOR"));
			pstmt.setInt(4, Integer.parseInt("ENG"));
			pstmt.setInt(4, Integer.parseInt("MAt"));

			result = pstmt.executeUpdate();
			
			pstmt.close();

		} catch (SQLException e)
		{
			e.printStackTrace();
		}

		return result;

	}

	// 성적 전체 출력 메소드 (select)
	public ArrayList<ScoreDTO> lists()
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();

		try
		{
			String sql = "SELECT SID, NAME, KOR, ENG, MAT" + ", (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT/3) AS AVG"
					+ ", RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK" + " FROM TBL_SCORE ORDER BY SID ASC";

			PreparedStatement pstmt = conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				ScoreDTO dto = new ScoreDTO();
				dto.setSid(rs.getInt("SID"));
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
			pstmt.close();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		return result;

	}

	// 이름으로 검색 메소드 (select)
	public ArrayList<ScoreDTO> lists(String name)
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();

		try
		{
			String sql = "SELECT SID, NAME, KOR, ENG, MAT" + ", (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT/3) AS AVG"
					+ ", RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK"
					+ " FROM TBL_SCORE WHERE NAME = ? ORDER BY SID";

			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, name);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next())
			{
				ScoreDTO dto = new ScoreDTO();
				dto.setSid(rs.getInt("SID"));
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
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());

		}

		return result;

	}

	// 학생번호로 검색 메소드 (select)
	public ArrayList<ScoreDTO> lists(int sid)
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		try
		{
			String sql = "SELECT SID, NAME, KOR, ENG, MAT"
					   + ", (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT/3) AS AVG"
					   + ", RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK"
					   + " FROM TBL_SCORE WHERE SID = ? ORDER BY SID" ;
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt("SID"));
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				ScoreDTO dto = new ScoreDTO();
				dto.setSid(rs.getInt("SID"));
				dto.setName(rs.getString("NAME"));
				dto.setKor(rs.getInt("KOR"));
				dto.setEng(rs.getInt("ENG"));
				dto.setMat(rs.getInt("MAT"));
				dto.setTot(rs.getInt("TOT"));
				dto.setAvg(rs.getDouble("AVG"));
				dto.setRank(rs.getInt("RANK"));
				
				result.add(dto);
			}	
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return result;
		
	}
	
	// 성적 수정 메소드 (update)
	public int modify(ScoreDTO dto)
	{
		int result = 0;
		try
		{
			String sql = "UPDATE TBL_SCORE SET KOR= ?, ENG = ? , MAT = ? WHERE NAME = ?" ;

			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt("KOR"));
			pstmt.setInt(2, Integer.parseInt("ENG"));
			pstmt.setInt(3, Integer.parseInt("MAT"));
			pstmt.setString(4, "NAME");
			
			result = pstmt.executeUpdate();

			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		return result;
	}

	// 성적 삭제 메소드 (delete)
	public int delete(int sid)
	{
		int result = 0;
		try
		{
			String sql = "DELETE FROM TBL_SCORE WHERE NAME =  ? ";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "NAME");
			
			result = pstmt.executeUpdate();

			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		

		return result;
	}

	public void close() throws SQLException
	{
		DBConn.close();
	}
}
