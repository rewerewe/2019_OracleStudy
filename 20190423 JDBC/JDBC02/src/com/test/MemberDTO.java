/*===============================
 	MemberDTO.java
===============================*/

package com.test;

// 한명의 정보를 담을 자료형 
public class MemberDTO
{
	// 주요 속성 구성
	private String sid, name, tel;

	// getter / setter 구성 
	public String getSid()
	{
		return sid;
	}

	public void setSid(String sid)
	{
		this.sid = sid;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}
	
	
}
