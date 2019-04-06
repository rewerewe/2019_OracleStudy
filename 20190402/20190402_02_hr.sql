SELECT USER
FROM DUAL;
--==>> HR

--○ 3개 이상의 테이블 조인(JOIN)

--형식 1. (SQL 1992 CODE)
SELECT 테이블명1.컬럼명, 테이블명2.컬럼명, 테이블명3.컬럼명
FROM 테이블명1, 테이블명2, 테이블명3
WHERE 테이블명1.컬럼명 1 = 테이블명2.컬럼명1
  AND 테이블명2.컬럼명 2 = 테이블명3.컬럼명2;
  
  
--형식 2. (SQL 1999 CODE)
SELECT 테이블명1.컬럼명, 테이블명2.컬럼명, 테이블명3.컬럼명
FROM 테이블명1 JOIN 테이블명2
ON 테이블명1.컬럼명1 = 테이블명2.컬럼명1
        JOIN 테이블명3
        ON 테이블명2.컬럼명2 = 테이블명3.컬럼명2;
        
        
        
--○ HR 계정 소유 테이블 또는 뷰 목록 조회

SELECT *
FROM TAB;

/*
TNAME              TABTYPE 
--------------------------
COUNTRIES	        TABLE	
DEPARTMENTS	        TABLE	
EMPLOYEES	        TABLE	
EMP_DETAILS_VIEW	    VIEW	
JOBS	                TABLE	
JOB_HISTORY	        TABLE	
LOCATIONS	        TABLE	
REGIONS	            TABLE	
*/

--○ HR.JOBS, HR.EMPLOYEES, HR.DEPARTMENTS 테이블을 대상으로 
--   직원들의 정보를 FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME
--   항목을 조회한다. 

-- 내가 풀이한 내용

-->>>>> 방법(1) (SQL 1992 CODE)
SELECT *
FROM HR.JOBS;
--1 JOB_ID   JOB_TITLE 
--   부모

SELECT *
FROM HR.EMPLOYEES;
--2 JOB_ID  DEPARTMENT_ID FIRST_NAME LAST_NAME EMAIL 
--  자식        자식

SELECT*
FROM HR.DEPARTMENTS;
--3 DEPARTMENT_ID DEPARTMENT_NAME
--  부모 

SELECT J.JOB_TITLE, E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM HR.JOBS J, HR.EMPLOYEES E, HR.DEPARTMENTS D
WHERE J.JOB_ID = E.JOB_ID
  AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+);
--==>> 106개 조회됨 
/*
Administration Assistant	 Jennifer	Whalen	Administration
Marketing Representative	    Pat	    Fay	Marketing
Marketing Manager	Michael	Hartstein	Marketing
Purchasing Manager	Den	Raphaely	Purchasing
Purchasing Clerk	Karen	Colmenares	Purchasing
Purchasing Clerk	Guy	Himuro	Purchasing
Purchasing Clerk	Sigal	Tobias	Purchasing
Purchasing Clerk	Alexander	Khoo	Purchasing
Purchasing Clerk	Shelli	Baida	Purchasing
Human Resources Representative	Susan	Mavris	Human Resources
Stock Manager	Matthew	Weiss	Shipping
Stock Manager	Adam	Fripp	Shipping
Stock Manager	Payam	Kaufling	Shipping
Stock Manager	Shanta	Vollman	Shipping
Stock Manager	Kevin	Mourgos	Shipping
Stock Clerk	John	Seo	Shipping
Stock Clerk	Stephen	Stiles	Shipping
Stock Clerk	Renske	Ladwig	Shipping
Stock Clerk	Hazel	Philtanker	Shipping
Stock Clerk	Ki	Gee	Shipping
Stock Clerk	Michael	Rogers	Shipping
Stock Clerk	Jason	Mallin	Shipping
Stock Clerk	Peter	Vargas	Shipping
Stock Clerk	James	Marlow	Shipping
Stock Clerk	Mozhe	Atkinson	Shipping
Stock Clerk	Laura	Bissot	Shipping
Stock Clerk	Steven	Markle	Shipping
Stock Clerk	James	Landry	Shipping
Stock Clerk	Irene	Mikkilineni	Shipping
Stock Clerk	Julia	Nayer	Shipping
Stock Clerk	Joshua	Patel	Shipping
Stock Clerk	Trenna	Rajs	Shipping
Stock Clerk	Curtis	Davies	Shipping
Stock Clerk	Randall	Matos	Shipping
Stock Clerk	TJ	Olson	Shipping
Shipping Clerk	Girard	Geoni	Shipping
Shipping Clerk	Martha	Sullivan	Shipping
Shipping Clerk	Jean	Fleaur	Shipping
Shipping Clerk	Winston	Taylor	Shipping
Shipping Clerk	Douglas	Grant	Shipping
Shipping Clerk	Donald	OConnell	Shipping
Shipping Clerk	Kevin	Feeney	Shipping
Shipping Clerk	Alana	Walsh	Shipping
Shipping Clerk	Vance	Jones	Shipping
Shipping Clerk	Samuel	McCain	Shipping
Shipping Clerk	Britney	Everett	Shipping
Shipping Clerk	Sarah	Bell	Shipping
Shipping Clerk	Randall	Perkins	Shipping
Shipping Clerk	Timothy	Gates	Shipping
Shipping Clerk	Jennifer	Dilly	Shipping
Shipping Clerk	Kelly	Chung	Shipping
Shipping Clerk	Anthony	Cabrio	Shipping
Shipping Clerk	Julia	Dellinger	Shipping
Shipping Clerk	Alexis	Bull	Shipping
Shipping Clerk	Nandita	Sarchand	Shipping
Programmer	David	Austin	IT
Programmer	Valli	Pataballa	IT
Programmer	Diana	Lorentz	IT
Programmer	Bruce	Ernst	IT
Programmer	Alexander	Hunold	IT
Public Relations Representative	Hermann	Baer	Public Relations
Sales Representative	Clara	Vishney	Sales
Sales Representative	Peter	Tucker	Sales
Sales Representative	David	Bernstein	Sales
Sales Representative	Peter	Hall	Sales
Sales Representative	Christopher	Olsen	Sales
Sales Representative	Nanette	Cambrault	Sales
Sales Representative	Jack	Livingston	Sales
Sales Representative	Jonathon	Taylor	Sales
Sales Representative	Alyssa	Hutton	Sales
Sales Representative	Ellen	Abel	Sales
Sales Representative	Sundita	Kumar	Sales
Sales Representative	Elizabeth	Bates	Sales
Sales Representative	William	Smith	Sales
Sales Representative	Tayler	Fox	Sales
Sales Representative	Harrison	Bloom	Sales
Sales Representative	Lisa	Ozer	Sales
Sales Representative	Amit	Banda	Sales
Sales Representative	Sundar	Ande	Sales
Sales Representative	David	Lee	Sales
Sales Representative	Mattea	Marvins	Sales
Sales Representative	Danielle	Greene	Sales
Sales Representative	Charles	Johnson	Sales
Sales Representative	Sarath	Sewall	Sales
Sales Representative	Louise	Doran	Sales
Sales Representative	Lindsey	Smith	Sales
Sales Representative	Allan	McEwen	Sales
Sales Representative	Patrick	Sully	Sales
Sales Representative	Janette	King	Sales
Sales Representative	Oliver	Tuvault	Sales
Sales Manager	Eleni	Zlotkey	Sales
Sales Manager	John	Russell	Sales
Sales Manager	Karen	Partners	Sales
Sales Manager	Alberto	Errazuriz	Sales
Sales Manager	Gerald	Cambrault	Sales
Administration Vice President	Neena	Kochhar	Executive
Administration Vice President	Lex	De Haan	Executive
President	Steven	King	Executive
Finance Manager	Nancy	Greenberg	Finance
Accountant	Jose Manuel	Urman	Finance
Accountant	Ismael	Sciarra	Finance
Accountant	Luis	Popp	Finance
Accountant	Daniel	Faviet	Finance
Accountant	John	Chen	Finance
*/


-->>>>>  방법(2) (SQL 1999 CODE)
SELECT J.JOB_TITLE, E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM HR.JOBS J JOIN HR.EMPLOYEES E
ON J.JOB_ID = E.JOB_ID
    JOIN HR.DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
--==>> 106개 조회됨 
/*
Administration Assistant	Jennifer	Whalen	Administration
Marketing Representative	Pat	Fay	Marketing
Marketing Manager	Michael	Hartstein	Marketing
Purchasing Manager	Den	Raphaely	Purchasing
Purchasing Clerk	Karen	Colmenares	Purchasing
Purchasing Clerk	Guy	Himuro	Purchasing
Purchasing Clerk	Sigal	Tobias	Purchasing
Purchasing Clerk	Alexander	Khoo	Purchasing
Purchasing Clerk	Shelli	Baida	Purchasing
Human Resources Representative	Susan	Mavris	Human Resources
Stock Manager	Matthew	Weiss	Shipping
Stock Manager	Adam	Fripp	Shipping
Stock Manager	Payam	Kaufling	Shipping
Stock Manager	Shanta	Vollman	Shipping
Stock Manager	Kevin	Mourgos	Shipping
Stock Clerk	John	Seo	Shipping
Stock Clerk	Stephen	Stiles	Shipping
Stock Clerk	Renske	Ladwig	Shipping
Stock Clerk	Hazel	Philtanker	Shipping
Stock Clerk	Ki	Gee	Shipping
Stock Clerk	Michael	Rogers	Shipping
Stock Clerk	Jason	Mallin	Shipping
Stock Clerk	Peter	Vargas	Shipping
Stock Clerk	James	Marlow	Shipping
Stock Clerk	Mozhe	Atkinson	Shipping
Stock Clerk	Laura	Bissot	Shipping
Stock Clerk	Steven	Markle	Shipping
Stock Clerk	James	Landry	Shipping
Stock Clerk	Irene	Mikkilineni	Shipping
Stock Clerk	Julia	Nayer	Shipping
Stock Clerk	Joshua	Patel	Shipping
Stock Clerk	Trenna	Rajs	Shipping
Stock Clerk	Curtis	Davies	Shipping
Stock Clerk	Randall	Matos	Shipping
Stock Clerk	TJ	Olson	Shipping
Shipping Clerk	Girard	Geoni	Shipping
Shipping Clerk	Martha	Sullivan	Shipping
Shipping Clerk	Jean	Fleaur	Shipping
Shipping Clerk	Winston	Taylor	Shipping
Shipping Clerk	Douglas	Grant	Shipping
Shipping Clerk	Donald	OConnell	Shipping
Shipping Clerk	Kevin	Feeney	Shipping
Shipping Clerk	Alana	Walsh	Shipping
Shipping Clerk	Vance	Jones	Shipping
Shipping Clerk	Samuel	McCain	Shipping
Shipping Clerk	Britney	Everett	Shipping
Shipping Clerk	Sarah	Bell	Shipping
Shipping Clerk	Randall	Perkins	Shipping
Shipping Clerk	Timothy	Gates	Shipping
Shipping Clerk	Jennifer	Dilly	Shipping
Shipping Clerk	Kelly	Chung	Shipping
Shipping Clerk	Anthony	Cabrio	Shipping
Shipping Clerk	Julia	Dellinger	Shipping
Shipping Clerk	Alexis	Bull	Shipping
Shipping Clerk	Nandita	Sarchand	Shipping
Programmer	David	Austin	IT
Programmer	Valli	Pataballa	IT
Programmer	Diana	Lorentz	IT
Programmer	Bruce	Ernst	IT
Programmer	Alexander	Hunold	IT
Public Relations Representative	Hermann	Baer	Public Relations
Sales Representative	Clara	Vishney	Sales
Sales Representative	Peter	Tucker	Sales
Sales Representative	David	Bernstein	Sales
Sales Representative	Peter	Hall	Sales
Sales Representative	Christopher	Olsen	Sales
Sales Representative	Nanette	Cambrault	Sales
Sales Representative	Jack	Livingston	Sales
Sales Representative	Jonathon	Taylor	Sales
Sales Representative	Alyssa	Hutton	Sales
Sales Representative	Ellen	Abel	Sales
Sales Representative	Sundita	Kumar	Sales
Sales Representative	Elizabeth	Bates	Sales
Sales Representative	William	Smith	Sales
Sales Representative	Tayler	Fox	Sales
Sales Representative	Harrison	Bloom	Sales
Sales Representative	Lisa	Ozer	Sales
Sales Representative	Amit	Banda	Sales
Sales Representative	Sundar	Ande	Sales
Sales Representative	David	Lee	Sales
Sales Representative	Mattea	Marvins	Sales
Sales Representative	Danielle	Greene	Sales
Sales Representative	Charles	Johnson	Sales
Sales Representative	Sarath	Sewall	Sales
Sales Representative	Louise	Doran	Sales
Sales Representative	Lindsey	Smith	Sales
Sales Representative	Allan	McEwen	Sales
Sales Representative	Patrick	Sully	Sales
Sales Representative	Janette	King	Sales
Sales Representative	Oliver	Tuvault	Sales
Sales Manager	Eleni	Zlotkey	Sales
Sales Manager	John	Russell	Sales
Sales Manager	Karen	Partners	Sales
Sales Manager	Alberto	Errazuriz	Sales
Sales Manager	Gerald	Cambrault	Sales
Administration Vice President	Neena	Kochhar	Executive
Administration Vice President	Lex	De Haan	Executive
President	Steven	King	Executive
Finance Manager	Nancy	Greenberg	Finance
Accountant	Jose Manuel	Urman	Finance
Accountant	Ismael	Sciarra	Finance
Accountant	Luis	Popp	Finance
Accountant	Daniel	Faviet	Finance
Accountant	John	Chen	Finance
Accounting Manager	Shelley	Higgins	Accounting
Public Accountant	William	Gietz	Accounting
*/

SELECT COUNT(*)
FROM EMPLOYEES;
--==> 107

------------------------------------------------------------------------- 실습문제 16:00

--○ EMPLOYEES, DEPARTMENTS, JOBS, LOCATIONS, COUNTRIES, REGIONS 테이블을 대상으로 
--   직원들의 정보를 다음과 같이 조회한다.
--   FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME
--   , CITY, COUNTRY_NAME, REGION_NAME

SELECT *
FROM EMPLOYEES;
-- 1 FIRST_NAME   LAST_NAME    JOB_ID    DEPARTMENT_ID
--     부모      부모         자식       자식

SELECT *
FROM DEPARTMENTS;
-- 2 DEPARTMENT_ID   DEPARTMENT_NAME   LOCATION_ID
--    부모             부모               자식

SELECT *
FROM JOBS;
-- 3 JOB_ID   JOB_TITLE
--  부모      부모 

SELECT *
FROM LOCATIONS;
-- 4 LOCATION_ID   COUNTRY_ID     CITY     
--  부모            자식        부모          

SELECT *
FROM COUNTRIES;
-- 5 COUNTRY_ID   COUNTRY_NAME   REGION_ID
--   부모          부모          자식

SELECT *
FROM REGIONS;
-- 6 REGION_ID   REGION_NAME
--  부모         부모 

SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
     , L.CITY, C.COUNTRY_NAME, R.REGION_NAME
FROM DEPARTMENTS D, EMPLOYEES E, JOBS J, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE D.DEPARTMENT_ID(+) = E.DEPARTMENT_ID
  AND E.JOB_ID = J.JOB_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+)
  AND C.REGION_ID = R.REGION_ID(+);
  
-- 여기서 (+) OR LEFT 하는 이유는...?

--==>> 107개 행이 선택되었습니다. 

/*
FIRST_NAME           LAST_NAME                 JOB_TITLE                           DEPARTMENT_NAME                CITY                           COUNTRY_NAME                             REGION_NAME              
-------------------- ------------------------- ----------------------------------- ------------------------------ ------------------------------ ---------------------------------------- -------------------------
Alexander            Hunold                    Programmer                          IT                             Southlake                      United States of America                 Americas                 
Bruce                Ernst                     Programmer                          IT                             Southlake                      United States of America                 Americas                 
David                Austin                    Programmer                          IT                             Southlake                      United States of America                 Americas                 
Valli                Pataballa                 Programmer                          IT                             Southlake                      United States of America                 Americas                 
Diana                Lorentz                   Programmer                          IT                             Southlake                      United States of America                 Americas                 
Matthew              Weiss                     Stock Manager                       Shipping                       South San Francisco            United States of America                 Americas                 
Adam                 Fripp                     Stock Manager                       Shipping                       South San Francisco            United States of America                 Americas                 
Payam                Kaufling                  Stock Manager                       Shipping                       South San Francisco            United States of America                 Americas                 
Shanta               Vollman                   Stock Manager                       Shipping                       South San Francisco            United States of America                 Americas                 
Kevin                Mourgos                   Stock Manager                       Shipping                       South San Francisco            United States of America                 Americas                 
Julia                Nayer                     Stock Clerk                         Shipping                       South San Francisco            United States of America                 Americas                 

Irene                Mikkilineni               Stock Clerk                         Shipping                       South San Francisco            United States of America                 Americas                 
James                Landry                    Stock Clerk                         Shipping                       South San Francisco            United States of America                 Americas                 
Steven               Markle                    Stock Clerk                         Shipping                       South San Francisco            United States of America                 Americas                 
Laura                Bissot                    Stock Clerk                         Shipping                       South San Francisco            United States of America                 Americas                 
Mozhe                Atkinson                  Stock Clerk                         Shipping                       South San Francisco            United States of America                 Americas                 
James                Marlow                    Stock Clerk                         Shipping                       South San Francisco            United States of America                 Americas                 
TJ                   Olson                     Stock Clerk                         Shipping                       South San Francisco            United States of America                 Americas                 
Jason                Mallin                    Stock Clerk                         Shipping                       South San Francisco            United States of America                 Americas                 
Michael              Rogers                    Stock Clerk                         Shipping                       South San Francisco            United States of America                 Americas                 
Ki                   Gee                       Stock Clerk                         Shipping                       South San Francisco            United States of America                 Americas                 
Hazel                Philtanker                Stock Clerk                         Shipping                       South San Francisco            United States of America                 Americas                 

Renske               Ladwig                    Stock Clerk                         Shipping                       South San Francisco            United States of America                 Americas                 
Stephen              Stiles                    Stock Clerk                         Shipping                       South San Francisco            United States of America                 Americas                 
John                 Seo                       Stock Clerk                         Shipping                       South San Francisco            United States of America                 Americas                 
Joshua               Patel                     Stock Clerk                         Shipping                       South San Francisco            United States of America                 Americas                 
Trenna               Rajs                      Stock Clerk                         Shipping                       South San Francisco            United States of America                 Americas                 
Curtis               Davies                    Stock Clerk                         Shipping                       South San Francisco            United States of America                 Americas                 
Randall              Matos                     Stock Clerk                         Shipping                       South San Francisco            United States of America                 Americas                 
Peter                Vargas                    Stock Clerk                         Shipping                       South San Francisco            United States of America                 Americas                 
Winston              Taylor                    Shipping Clerk                      Shipping                       South San Francisco            United States of America                 Americas                 
Jean                 Fleaur                    Shipping Clerk                      Shipping                       South San Francisco            United States of America                 Americas                 
Martha               Sullivan                  Shipping Clerk                      Shipping                       South San Francisco            United States of America                 Americas                 

Girard               Geoni                     Shipping Clerk                      Shipping                       South San Francisco            United States of America                 Americas                 
Nandita              Sarchand                  Shipping Clerk                      Shipping                       South San Francisco            United States of America                 Americas                 
Alexis               Bull                      Shipping Clerk                      Shipping                       South San Francisco            United States of America                 Americas                 
Julia                Dellinger                 Shipping Clerk                      Shipping                       South San Francisco            United States of America                 Americas                 
Anthony              Cabrio                    Shipping Clerk                      Shipping                       South San Francisco            United States of America                 Americas                 
Kelly                Chung                     Shipping Clerk                      Shipping                       South San Francisco            United States of America                 Americas                 
Jennifer             Dilly                     Shipping Clerk                      Shipping                       South San Francisco            United States of America                 Americas                 
Timothy              Gates                     Shipping Clerk                      Shipping                       South San Francisco            United States of America                 Americas                 
Randall              Perkins                   Shipping Clerk                      Shipping                       South San Francisco            United States of America                 Americas                 
Sarah                Bell                      Shipping Clerk                      Shipping                       South San Francisco            United States of America                 Americas                 
Britney              Everett                   Shipping Clerk                      Shipping                       South San Francisco            United States of America                 Americas                 

Samuel               McCain                    Shipping Clerk                      Shipping                       South San Francisco            United States of America                 Americas                 
Vance                Jones                     Shipping Clerk                      Shipping                       South San Francisco            United States of America                 Americas                 
Alana                Walsh                     Shipping Clerk                      Shipping                       South San Francisco            United States of America                 Americas                 
Kevin                Feeney                    Shipping Clerk                      Shipping                       South San Francisco            United States of America                 Americas                 
Donald               OConnell                  Shipping Clerk                      Shipping                       South San Francisco            United States of America                 Americas                 
Douglas              Grant                     Shipping Clerk                      Shipping                       South San Francisco            United States of America                 Americas                 
Shelley              Higgins                   Accounting Manager                  Accounting                     Seattle                        United States of America                 Americas                 
William              Gietz                     Public Accountant                   Accounting                     Seattle                        United States of America                 Americas                 
Nancy                Greenberg                 Finance Manager                     Finance                        Seattle                        United States of America                 Americas                 
Daniel               Faviet                    Accountant                          Finance                        Seattle                        United States of America                 Americas                 
John                 Chen                      Accountant                          Finance                        Seattle                        United States of America                 Americas                 

Ismael               Sciarra                   Accountant                          Finance                        Seattle                        United States of America                 Americas                 
Jose Manuel          Urman                     Accountant                          Finance                        Seattle                        United States of America                 Americas                 
Luis                 Popp                      Accountant                          Finance                        Seattle                        United States of America                 Americas                 
Steven               King                      President                           Executive                      Seattle                        United States of America                 Americas                 
Neena                Kochhar                   Administration Vice President       Executive                      Seattle                        United States of America                 Americas                 
Lex                  De Haan                   Administration Vice President       Executive                      Seattle                        United States of America                 Americas                 
Den                  Raphaely                  Purchasing Manager                  Purchasing                     Seattle                        United States of America                 Americas                 
Alexander            Khoo                      Purchasing Clerk                    Purchasing                     Seattle                        United States of America                 Americas                 
Shelli               Baida                     Purchasing Clerk                    Purchasing                     Seattle                        United States of America                 Americas                 
Sigal                Tobias                    Purchasing Clerk                    Purchasing                     Seattle                        United States of America                 Americas                 
Guy                  Himuro                    Purchasing Clerk                    Purchasing                     Seattle                        United States of America                 Americas                 

Karen                Colmenares                Purchasing Clerk                    Purchasing                     Seattle                        United States of America                 Americas                 
Jennifer             Whalen                    Administration Assistant            Administration                 Seattle                        United States of America                 Americas                 
Michael              Hartstein                 Marketing Manager                   Marketing                      Toronto                        Canada                                   Americas                 
Pat                  Fay                       Marketing Representative            Marketing                      Toronto                        Canada                                   Americas                 
Susan                Mavris                    Human Resources Representative      Human Resources                London                         United Kingdom                           Europe                   
John                 Russell                   Sales Manager                       Sales                          Oxford                         United Kingdom                           Europe                   
Karen                Partners                  Sales Manager                       Sales                          Oxford                         United Kingdom                           Europe                   
Alberto              Errazuriz                 Sales Manager                       Sales                          Oxford                         United Kingdom                           Europe                   
Gerald               Cambrault                 Sales Manager                       Sales                          Oxford                         United Kingdom                           Europe                   
Eleni                Zlotkey                   Sales Manager                       Sales                          Oxford                         United Kingdom                           Europe                   
Peter                Tucker                    Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   

David                Bernstein                 Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Peter                Hall                      Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Christopher          Olsen                     Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Nanette              Cambrault                 Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Oliver               Tuvault                   Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Janette              King                      Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Patrick              Sully                     Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Allan                McEwen                    Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Lindsey              Smith                     Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Louise               Doran                     Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Sarath               Sewall                    Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   

Clara                Vishney                   Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Danielle             Greene                    Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Mattea               Marvins                   Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
David                Lee                       Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Sundar               Ande                      Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Amit                 Banda                     Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Lisa                 Ozer                      Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Harrison             Bloom                     Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Tayler               Fox                       Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
William              Smith                     Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Elizabeth            Bates                     Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   

Sundita              Kumar                     Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Ellen                Abel                      Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Alyssa               Hutton                    Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Jonathon             Taylor                    Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Jack                 Livingston                Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Charles              Johnson                   Sales Representative                Sales                          Oxford                         United Kingdom                           Europe                   
Hermann              Baer                      Public Relations Representative     Public Relations               Munich                         Germany                                  Europe                   
Kimberely            Grant                     Sales Representative                                                                                                                                                

*/

