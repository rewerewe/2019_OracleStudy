package com.test;

import java.util.Scanner;

public class Process
{
	private MemberDAO dao;
	
	// MemberDAO 클래스와 process 클래스 연결 
	public void Process()
	{
		dao = new MemberDAO();
	}
	
	// 1. 직원 정보 입력 기능 
	public void memberInsert()
	{
		// 입력받기 
		Scanner sc = new Scanner(System.in);
		
		// DB 연결 
		
		// 전체 직원수 확인
		
		// 수신된 내용 출력 
		
		// 메소드 호출
		
		// MemberDAO setter
		
		// 예외처리 
	}
	// 2. 직원 전체 출력 기능 
	public void memberSelectAll()
	{
		// 입력받기
		
		// DB 연결 
		
		// 전체 직원수 확인
		
		// 수신된 내용 출력
		
		// 메소드 호출 
	}
	// 3. 직원 검색 출력 기능 
	public void memberSearch()
	{
		
	}
	
	// 4. 직원 정보 수정 기능
	public void memberUpdate()
	{
		
	}
	
	// 5. 직원 정보 삭제 기능
	public void memberDelete()
	{
		
	}
	
	

}
