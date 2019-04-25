/*======================================
 	MemberDTO.java
 	-  
 ======================================*/

package com.test;

public class MemberDTO
{
	// 주요 속성 구성 
	// → DTO 는 속성만 구성하는 클래스 
	// → 출력될 속성이자, 오라클에서 생성한 VIEW 의 속성으로 구성한다.
	// → 추가 속성 구성 가능 
	
	// 구성할 속성(view 칼럼) : 사번  이름  주민번호  입사일	지역	 전화번호  부서  직위  기본급  수당  급여
	private int empId, basicPay, sudang, pay;
	private String empName, ssn, cityLoc, tel, buseoName, jikwiName;
	
	private String ibsaDate;		// ※ 입사일은 날짜 형식이지만 문자열 구성

	// getter / setter 구성 
	public int getEmpId()
	{
		return empId;
	}

	public void setEmpId(int empId)
	{
		this.empId = empId;
	}

	public int getBasicPay()
	{
		return basicPay;
	}

	public void setBasicPay(int basicPay)
	{
		this.basicPay = basicPay;
	}

	public int getSudang()
	{
		return sudang;
	}

	public void setSudang(int sudang)
	{
		this.sudang = sudang;
	}

	public int getPay()
	{
		return pay;
	}

	public void setPay(int pay)
	{
		this.pay = pay;
	}

	public String getEmpName()
	{
		return empName;
	}

	public void setEmpName(String empName)
	{
		this.empName = empName;
	}

	public String getSsn()
	{
		return ssn;
	}

	public void setSsn(String ssn)
	{
		this.ssn = ssn;
	}

	public String getCityLoc()
	{
		return cityLoc;
	}

	public void setCityLoc(String cityLoc)
	{
		this.cityLoc = cityLoc;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}

	public String getBuseoName()
	{
		return buseoName;
	}

	public void setBuseoName(String buseoName)
	{
		this.buseoName = buseoName;
	}

	public String getJikwiName()
	{
		return jikwiName;
	}

	public void setJikwiName(String jikwiName)
	{
		this.jikwiName = jikwiName;
	}

	public String getIbsaDate()
	{
		return ibsaDate;
	}

	public void setIbsaDate(String ibsaDate)
	{
		this.ibsaDate = ibsaDate;
	}
	
	
	
}
