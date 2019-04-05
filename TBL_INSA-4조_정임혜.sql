--�� ���̺� ���� (SCOTT.TBL_INSA)
CREATE TABLE TBL_INSA
( NUM      NUMBER(5)    NOT NULL
, NAME     VARCHAR2(20) NOT NULL
, SSN      VARCHAR2(14) NOT NULL
, IBSADATE DATE         NOT NULL
, CITY     VARCHAR2(10)
, TEL      VARCHAR2(15)
, BUSEO    VARCHAR2(15) NOT NULL
, JIKWI    VARCHAR2(15) NOT NULL
, BASICPAY NUMBER(10)   NOT NULL
, SUDANG   NUMBER(10)   NOT NULL
, CONSTRAINT TBL_INSA_NUM_PK PRIMARY KEY(NUM)
);
--==>> Table TBL_INSA��(��) �����Ǿ����ϴ�.


--�� ���� �⺻�� ����
ALTER SESSION SET NLS_DATE_FORMAT ='YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� ������ �Է�
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1001, 'ȫ�浿', '771212-1022432', '1998-10-11', '����', '011-2356-4528', '��ȹ��', '����', 2610000, 200000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1002, '�̼���', '801007-1544236', '2000-11-29', '���', '010-4758-6532', '�ѹ���', '���', 1320000, 200000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1003, '�̼���', '770922-2312547', '1999-02-25', '��õ', '010-4231-1236', '���ߺ�', '����', 2550000, 160000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1004, '������', '790304-1788896', '2000-10-01', '����', '019-5236-4221', '������', '�븮', 1954200, 170000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1005, '�Ѽ���', '811112-1566789', '2004-08-13', '����', '018-5211-3542', '�ѹ���', '���', 1420000, 160000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1006, '�̱���', '780505-2978541', '2002-02-11', '��õ', '010-3214-5357', '���ߺ�', '����', 2265000, 150000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1007, '����ö', '780506-1625148', '1998-03-16', '����', '011-2345-2525', '���ߺ�', '�븮', 1250000, 150000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1008, '�迵��', '821011-2362514', '2002-04-30', '����', '016-2222-4444', 'ȫ����', '���', 950000 , 145000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1009, '������', '810810-1552147', '2003-10-10', '���', '019-1111-2222', '�λ��', '���', 840000 , 220400);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1010, '������', '751010-1122233', '1997-08-08', '�λ�', '011-3214-5555', '������', '����', 2540000, 130000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1011, '������', '801010-2987897', '2000-07-07', '����', '010-8888-4422', '������', '���', 1020000, 140000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1012, '���ѱ�', '760909-1333333', '1999-10-16', '����', '018-2222-4242', 'ȫ����', '���', 880000 , 114000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1013, '���̼�', '790102-2777777', '1998-06-07', '���', '019-6666-4444', 'ȫ����', '�븮', 1601000, 103000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1014, 'Ȳ����', '810707-2574812', '2002-02-15', '��õ', '010-3214-5467', '���ߺ�', '���', 1100000, 130000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1015, '������', '800606-2954687', '1999-07-26', '���', '016-2548-3365', '�ѹ���', '���', 1050000, 104000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1016, '�̻���', '781010-1666678', '2001-11-29', '���', '010-4526-1234', '���ߺ�', '����', 2350000, 150000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1017, '�����', '820507-1452365', '2000-08-28', '��õ', '010-3254-2542', '���ߺ�', '���', 950000 , 210000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1018, '�̼���', '801028-1849534', '2004-08-08', '����', '018-1333-3333', '���ߺ�', '���', 880000 , 123000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1019, '�ڹ���', '780710-1985632', '1999-12-10', '����', '017-4747-4848', '�λ��', '����', 2300000, 165000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1020, '������', '800304-2741258', '2003-10-10', '����', '011-9595-8585', '�����', '���', 880000 , 140000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1021, 'ȫ�泲', '801010-1111111', '2001-09-07', '���', '011-9999-7575', '���ߺ�', '���', 875000 , 120000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1022, '�̿���', '800501-2312456', '2003-02-25', '����', '017-5214-5282', '��ȹ��', '�븮', 1960000, 180000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1023, '���μ�', '731211-1214576', '1995-02-23', '����', NULL           , '������', '����', 2500000, 170000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1024, '�踻��', '830225-2633334', '1999-08-28', '����', '011-5248-7789', '��ȹ��', '�븮', 1900000, 170000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1025, '�����', '801103-1654442', '2000-10-01', '����', '010-4563-2587', '������', '���', 1100000, 160000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1026, '�����', '810907-2015457', '2002-08-28', '���', '010-2112-5225', '������', '���', 1050000, 150000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1027, '�迵��', '801216-1898752', '2000-10-18', '����', '019-8523-1478', '�ѹ���', '����', 2340000, 170000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1028, '�̳���', '810101-1010101', '2001-09-07', '����', '016-1818-4848', '�λ��', '���', 892000 , 110000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1029, '�踻��', '800301-2020202', '2000-09-08', '����', '016-3535-3636', '�ѹ���', '���', 920000 , 124000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1030, '������', '790210-2101010', '1999-10-17', '�λ�', '019-6564-6752', '�ѹ���', '����', 2304000, 124000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1031, '����ȯ', '771115-1687988', '2001-01-21', '����', '019-5552-7511', '��ȹ��', '����', 2450000, 160000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1032, '�ɽ���', '810206-2222222', '2000-05-05', '����', '016-8888-7474', '�����', '���', 880000 , 108000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1033, '��̳�', '780505-2999999', '1998-06-07', '����', '011-2444-4444', '������', '���', 1020000, 104000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1034, '������', '820505-1325468', '2005-09-26', '���', '011-3697-7412', '��ȹ��', '���', 1100000, 160000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1035, '������', '831010-2153252', '2002-05-16', '��õ', NULL           , '���ߺ�', '���', 1050000, 140000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1036, '���翵', '701126-2852147', '2003-08-10', '����', '011-9999-9999', '�����', '���', 960400 , 190000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1037, '�ּ���', '770129-1456987', '1998-10-15', '��õ', '011-7777-7777', 'ȫ����', '����', 2350000, 187000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1038, '���μ�', '791009-2321456', '1999-11-15', '�λ�', '010-6542-7412', '������', '�븮', 2000000, 150000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1039, '�����', '800504-2000032', '2003-12-28', '���', '010-2587-7895', '������', '�븮', 2010000, 160000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1040, '�ڼ���', '790509-1635214', '2000-09-10', '���', '016-4444-7777', '�λ��', '�븮', 2100000, 130000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1041, '�����', '721217-1951357', '2001-12-10', '�泲', '016-4444-5555', '�����', '����', 2300000, 150000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1042, 'ä����', '810709-2000054', '2003-10-17', '���', '011-5125-5511', '���ߺ�', '���', 1020000, 200000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1043, '��̿�', '830504-2471523', '2003-09-24', '����', '016-8548-6547', '������', '���', 1100000, 210000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1044, '����ȯ', '820305-1475286', '2004-01-21', '����', '011-5555-7548', '������', '���', 1060000, 220000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1045, 'ȫ����', '690906-1985214', '2003-03-16', '����', '011-7777-7777', '������', '���', 960000 , 152000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1046, '����', '760105-1458752', '1999-05-04', '�泲', '017-3333-3333', '�ѹ���', '����', 2650000, 150000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1047, '�긶��', '780505-1234567', '2001-07-15', '����', '018-0505-0505', '������', '�븮', 2100000, 112000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1048, '�̱��', '790604-1415141', '2001-06-07', '����', NULL           , '���ߺ�', '�븮', 2050000, 106000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1049, '�̹̼�', '830908-2456548', '2000-04-07', '��õ', '010-6654-8854', '���ߺ�', '���', 1300000, 130000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1050, '�̹���', '810403-2828287', '2003-06-07', '���', '011-8585-5252', 'ȫ����', '�븮', 1950000, 103000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1051, '�ǿ���', '790303-2155554', '2000-06-04', '����', '011-5555-7548', '������', '����', 2260000, 104000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1052, '�ǿ���', '820406-2000456', '2000-10-10', '���', '010-3644-5577', '��ȹ��', '���', 1020000, 105000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1053, '��̽�', '800715-1313131', '1999-12-12', '����', '011-7585-7474', '�����', '���', 960000 , 108000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1054, '����ȣ', '810705-1212141', '1999-10-16', '����', '016-1919-4242', 'ȫ����', '���', 980000 , 114000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1055, '���ѳ�', '820506-2425153', '2004-06-07', '����', '016-2424-4242', '������', '���', 1000000, 104000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1056, '������', '800605-1456987', '2004-08-13', '��õ', '010-7549-8654', '������', '�븮', 1950000, 200000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1057, '�̹̰�', '780406-2003214', '1998-02-11', '���', '016-6542-7546', '�����', '����', 2520000, 160000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1058, '�����', '800709-1321456', '2003-08-08', '��õ', '010-2415-5444', '��ȹ��', '�븮', 1950000, 180000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1059, '�Ӽ���', '810809-2121244', '2001-10-10', '����', '011-4151-4154', '���ߺ�', '���', 890000 , 102000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1060, '��ž�', '810809-2111111', '2001-10-10', '����', '011-4151-4444', '���ߺ�', '���', 900000 , 102000);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 60 


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


SELECT *
FROM TBL_INSA;
 
------------------------------------------------------------------------------------------------------------
--4��_������ (�����ϴ� �� �ƴմϴ�... ��������, ���ͳ� ���°͵� �ƴϰ�, ���� �� �����ϰ� �ִ� ���� �ľ��ϱ� �����̴� ȥ�� Ǯ���ϼ���) 

--01. TBL_INSA ���̺� ��ü�ڷ� ��ȸ
;
SELECT *
FROM TBL_INSA;


02. SCOTT ����� ���� ���̺� ��� Ȯ��(2���� ���� Ȱ��)


--03. TBL_INSA ���̺� ���� Ȯ��
;
DESC TBL_INSA;


--04. TBL_INSA ���̺��� �̸�(NAME), �⺻��(BASICPAY) ��ȸ
;
SELECT NAME AS "�̸�", BASICPAY AS "�⺻��"
FROM TBL_INSA;


--05. TBL_INSA ���̺��� �̸�(NAME), �⺻��(BASICPAY), ����(SUDANG), �⺻��+���� ��ȸ
;
SELECT NAME AS "�̸�", BASICPAY AS "�⺻��", SUDANG AS "����", (BASICPAY+SUDANG) AS "�⺻��+����"
FROM TBL_INSA;


--06. TBL_INSA ���̺��� �̸�(NAME), ��ŵ�(CITY), �μ���(BUSEO) ��ȸ. ��Ī(ALIAS) ���.
    --(1) AS ��� 
    ;
    SELECT NAME AS "�̸�", CITY AS "��ŵ�", BUSEO AS "�μ���"
    FROM TBL_INSA;
    
    
    --(2) AS ����(����)
    ;
    SELECT NAME "�̸�", CITY "��ŵ�", BUSEO "�μ���"
    FROM TBL_INSA;
    
    
    --(3) " " ū����ǥ ��������
    ;
    SELECT NAME �̸�, CITY ��ŵ�, BUSEO �μ���
    FROM TBL_INSA;


--07. ���� ����� �̸�(NAME), ��ŵ�(CITY), �μ���(BUSEO), ����(JIKWI) ��ȸ
;
SELECT NAME AS "�̸�", CITY AS "��ŵ�", BUSEO AS "�μ���", JIKWI AS "����"
FROM TBL_INSA
WHERE CITY = '����';


--08. ��ŵ��� ���� ����̸鼭       --> WHERE ����
--    �⺻���� 150���� �̻��� ���   --> WHERE ����
--    ��ȸ (NAME, CITY, BASICPAY, SSN)
;
SELECT NAME AS "�̸�", CITY AS "��ŵ�", BUSEO AS "�μ���", JIKWI AS "����" 
FROM TBL_INSA
WHERE CITY = '����'
  AND BASICPAY >= 1500000;


-- 09. ��ŵ��� '��õ' �̸鼭, �⺻���� 100�����̻� ~ 200���� �̸��� ��츸 ������� ��ȸ.
;
SELECT *
FROM TBL_INSA
WHERE CITY = '��õ'
  AND BASICPAY >= 1000000
  AND BASICPAY < 2000000;


-- 10. ��ŵ��� ���� ����̰ų� �μ��� ���ߺ��� �ڷ� ��ȸ (NAME, CITY, BUSEO)
;
SELECT NAME, CITY, BUSEO
FROM TBL_INSA
WHERE CITY = '����' 
   OR BUSEO = '���ߺ�';


--11. ��ŵ��� ����, ����� ����� ��ȸ (NAME, CITY, BUSEO). IN ������ ���.
;
SELECT NAME, CITY, BUSEO
FROM TBL_INSA
WHERE CITY IN ('����', '���');


--12. �μ��� '���ߺ�' �̰ų� '������'�� ����� ������� ��ȸ. IN ������ ���.
;
SELECT *
FROM TBL_INSA
WHERE BUSEO IN ('���ߺ�', '������');


--13. �޿�(BASICPAY + SUDANG)�� 250���� �̻��� ��� ��ȸ. --> WHERE ����
--    ��, �ʵ���� �ѱ۷� ���. --> ��Ī(ALIAS)
--    (NAME, BASICPAY, SUDANG, BASICPAY+SUDANG)
;
SELECT NAME "�̸�", BASICPAY "�⺻��", SUDANG "����", (BASICPAY+SUDANG) "�޿�" 
FROM TBL_INSA
WHERE (BASICPAY+SUDANG) >= 2500000
ORDER BY 4;
 
 
--14. �ֹι�ȣ�� �������� ����(���� �ڸ����� 1, 3)�� ��ȸ. 
--    ( �̸�(NAME), �ֹι�ȣ(SSN) )
--    ��, SUBSTR() �Լ� �̿�.
;
SELECT NAME "�̸�", SSN "�ֹι�ȣ"
FROM TBL_INSA
WHERE SUBSTR(SSN, 8, 1) = '1'
  OR SUBSTR(SSN, 8, 1) = '3';


--15. �ֹι�ȣ�� �������� 80��� �¾ ����� ��ȸ. 
--    ( �̸�(NAME), �ֹι�ȣ(SSN) )
;
SELECT NAME "�̸�", SSN "�ֹι�ȣ"
FROM TBL_INSA
WHERE (SUBSTR(SSN, 1, 2) >= 80 AND SUBSTR(SSN, 1, 2) < 90);


--16. ���� ��� �߿��� 70��� �¾ ����� ��ȸ. SUBSTR() �Լ� �̿�.
;
SELECT *
FROM TBL_INSA
WHERE CITY = '����'
  AND (SUBSTR(SSN, 1, 2) >= 70 AND SUBSTR(SSN, 1, 2) < 80);


--17. ���� ��� �߿��� 70��� �¾ ���ڸ� ��ȸ. SUBSTR() �Լ� �̿�.
;
SELECT *
FROM TBL_INSA
WHERE CITY = '����'
  AND (SUBSTR(SSN, 1, 2) >= 70 AND SUBSTR(SSN, 1, 2) < 80)
  AND SUBSTR(SSN, 8, 1) IN ('1', '3'); 


--18. ���� ����̸鼭 �达�� ��ȸ
--    ��, ������ �� ���ڶ�� ����. 
--    ( �̸�, ��ŵ� )
--    SUBSTR() �Լ� �̿�.
;
SELECT NAME "�̸�", CITY "��ŵ�"
FROM TBL_INSA
WHERE CITY = '����'
  AND SUBSTR(NAME, 1, 1) = '��';
  
  
--19. 2000�⵵�� �Ի��� ��� ��ȸ. (�̸�, ��ŵ�, �Ի���).
;
SELECT NAME "�̸�", CITY "��ŵ�", IBSADATE "�Ի���"
FROM TBL_INSA
WHERE TO_CHAR(IBSADATE, 'YYYY') = '2000';


--20. 2000�� 10���� �Ի��� ��� ��ȸ. (�̸�, ��ŵ�, �Ի���).
;
SELECT NAME "�̸�", CITY "��ŵ�", IBSADATE "�Ի���"
FROM TBL_INSA
WHERE TO_CHAR(IBSADATE, 'YYYY-MM') = '2000-10';


--21. �ֹι�ȣ�� �������� ������ ���� ��ȸ.
--    ��, ��� ������ 1900��뿡 �¾�ٴ� ����. (�̸�, �ֹι�ȣ, ����)
;
SELECT NAME "�̸�"
     , SSN "�ֹι�ȣ"
     , CASE WHEN SUBSTR(SSN, 8, 1) IN ('1', '2')
            THEN EXTRACT(YEAR FROM SYSDATE) - TO_NUMBER(SUBSTR(SSN, 1, 2) + 1899)
            ELSE 0
        END "����"
FROM TBL_INSA;


--22. �ֹι�ȣ �������� ���� ���̴밡 20���� ����� ��ȸ.
;
SELECT *
FROM TBL_INSA
WHERE SUBSTR(SSN, 1, 2) >= 90;


--23. �ֹι�ȣ �������� 5�� ���� ��ȸ. 
--    ��, SUBSTR() �Լ� �̿�.
;
SELECT *
FROM TBL_INSA
WHERE SUBSTR(SSN, 3, 2) = 05;


24. �ֹι�ȣ �������� 5�� ���� ��ȸ. 
    ��, TO_CHAR() �Լ� �̿�.
SELECT *
FROM TBL_INSA
WHERE TO_CHAR(SSN)= '05';


--25. ��ŵ� ������������ �����ϰ�, ��ŵ��� ������ �⺻�� �������� ���� ��ȸ
;
SELECT *
FROM TBL_INSA
ORDER BY CITY DESC, BASICPAY DESC;


--26. ���� ��� �߿��� �⺻��+����(��޿�) ������������ ����.
--    ( �̸�, ��ŵ�, �⺻��+���� )
;
SELECT NAME "�̸�", CITY "��ŵ�", (BASICPAY+SUDANG) "�޿�"
FROM TBL_INSA
WHERE CITY = '����'
ORDER BY 3 DESC;


--27. ���� �� �μ� ������������ �����ϰ�, �μ��� ������ �⺻�� �������� ����. 
--    ( �̸�, �ֹι�ȣ, �μ�, �⺻�� )
;
SELECT NAME "�̸�", SSN "�ֹι�ȣ", BUSEO "�μ�", BASICPAY "�⺻��"
FROM TBL_INSA
WHERE SUBSTR(SSN, 8, 1) IN ('2','4')
ORDER BY 3, 4 DESC;


--28. ���� �� ���̸� �������� �������� �����Ͽ� ��ȸ.
--    (27 ���� ������ �÷����� ��ȸ) 
;
SELECT NAME "�̸�", SSN "�ֹι�ȣ", BUSEO "�μ�", BASICPAY "�⺻��"
      , CASE WHEN SUBSTR(SSN, 8, 1) IN ('1','3') 
             THEN EXTRACT(YEAR FROM SYSDATE) - TO_NUMBER(SUBSTR(SSN, 1, 2) + 1899)
             ELSE 0 
         END"����"
FROM TBL_INSA
WHERE SUBSTR(SSN, 8, 1) IN ('1','3') 
ORDER BY 5;


--29. ���� ���� ����� �߿��� �Ի����� ���� ����� ���� �� �� �ֵ��� ��ȸ.
;
SELECT *
FROM TBL_INSA
WHERE CITY = '����'
ORDER BY 4;


--30. ������ �达�� �ƴ� ��� ��ȸ. 
--    ��, ������ �� ���ڶ�� ����.
--    ( �̸�, ��ŵ�, �⺻�� ).
;
SELECT NAME "�̸�", CITY "��ŵ�", BASICPAY"�⺻��"
FROM TBL_INSA
WHERE SUBSTR(NAME, 1, 1) != '��'
ORDER BY 1;


31. ��ŵ��� ����, �λ�, �뱸 �̸鼭
    ��ȭ��ȣ�� 5 �Ǵ� 7�� ���Ե� �����͸� ��ȸ�ϵ�
    �μ����� ������ �δ� ��µ��� �ʵ�����. (���ߺ� �� ����)
--    ( �̸�, ��ŵ�, �μ���, ��ȭ��ȣ )



--32. ��ȭ��ȣ�� ������ '-'�� �����Ͽ� ��ȸ�ϰ�, 
--    ������ '��ȭ��ȣ����'���� ��ȸ.
;
SELECT CASE  WHEN TEL IS NOT NULL
                THEN REPLACE(TEL, '-', '')
             WHEN TEL IS NULL
                THEN '��ȭ��ȣ����'
             ELSE 'Ȯ�κҰ�'
        END "��ȭ��ȣ"
FROM TBL_INSA;


�߰�����. (�⺻ ���� Ǯ�̰� ��� ���� �� �ۼ��Ѵ�.)
          HR������ EMPLOYEES ���̺��� Ŀ�̼� �޴� ����� ����
          �ȹ޴� ����� ���� ��ȸ�Ѵ�.
          ������� ---------------
              ����        �ο���
          Ŀ�̼ǹ޴»��    XXX
          Ŀ�̼Ǿ��»��    XXX
          �����          XXX


--33. TBL_INSA ���̺��� BASICPAY + SUDANG �� 
--    100���� �̸�, 100���� �̻�~200���� �̸�, 
--    200���� �̻��� �������� �� ��ȸ.
;
SELECT T.�޿� "�޿�" 
      , COUNT(*) "������"
    FROM          
    (        
        SELECT (BASICPAY+SUDANG)"�޿�"         
        FROM TBL_INSA
    ) T
GROUP BY ROLLUP(T.�޿�);


--34. TBL_INSA ���̺��� �ֹι�ȣ�� ������ ��������� �⵵�� ������ ��ȸ.
;
SELECT T.���� "�¾����", COUNT(T.����) "�ο���"
    FROM
    (
        SELECT TO_NUMBER(SUBSTR(SSN, 1, 2) + 1899) "����"
        FROM TBL_INSA
    ) T
GROUP BY ROLLUP(T.����);


--35. �ֹι�ȣ�� �������� ���� ��������, ���� ������ �⵵ �������� ��ȸ.
--    (�̸�, �ֹι�ȣ)
;
SELECT T.NAME "�̸�", T.SSN "�ֹι�ȣ"
FROM
    (
        SELECT SUBSTR(SSN, 1, 2)"����", SUBSTR(SSN, 3, 2) "��", NAME, SSN 
        FROM TBL_INSA
    ) T 
ORDER BY T.��, T.���� DESC;


--36. �Ի����� ��������  ���� ��������, ���� ������ �⵵ �������� ��ȸ.
--    ��, ��� ���� ��ȸ.
--    (����. �Ի����� �ڷ����� DATE�̴�.)
;
SELECT T.NUM, T.NAME, T.SSN, T.IBSADATE, T.CITY, T.TEL, T.BUSEO, T.JIKWI, T.BASICPAY, T.SUDANG 
    FROM 
    (
        SELECT NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG 
              , TO_CHAR(IBSADATE, 'YYYY') "�Ի�⵵", TO_CHAR(IBSADATE, 'MM') "�Ի��"
        FROM TBL_INSA
    ) T
ORDER BY T.�Ի��, T.�Ի�⵵ DESC;


--37. ��ü�ο���, �����ο���, �����ο����� ���� ��ȸ.
;
SELECT DECODE(T.����, NULL, '��ü�ο���', T.����) "����"
     , COUNT(T.����) "�ο���"
    FROM
    (
        SELECT CASE WHEN SUBSTR(SSN, 8, 1) IN ('1', '3')
                        THEN '����'
                     WHEN SUBSTR(SSN, 8, 1) IN ('2', '4')
                        THEN '����'
                     ELSE '�˼�����' 
                END "����"
        FROM TBL_INSA
    ) T
GROUP BY ROLLUP(T.����);


--38. ���ߺ�, ������, �ѹ��� �ο��� ��ȸ.  COUNT(), DECODE() �Լ� �̿�.
;
SELECT BUSEO "�μ�", DECODE(BUSEO,'���ߺ�', COUNT(0), '������', COUNT(0), '�ѹ���', COUNT(0), 0) "�μ��� �ο���"
FROM TBL_INSA
WHERE BUSEO = '���ߺ�'
   OR BUSEO = '������'
   OR BUSEO = '�ѹ���'
GROUP BY BUSEO;


--39. ���� ����� ���� �ο��� ��ȸ.
;
SELECT COUNT(*) "���ﳲ���ο���"
FROM TBL_INSA
WHERE CITY = '����'
  AND SUBSTR(SSN, 8, 1) IN ('1', '3');


--40. �μ��� �������̰�, ���� �ο���, ���� �ο��� ��ȸ.  COUNT(), DECODE() �Լ� �̿�.
;
SELECT T.�μ� "�μ�"
      ,COUNT(DECODE(T.����,'����',1,NULL))"�����ο���"
      ,COUNT(DECODE(T.����,'����',1,NULL))"�����ο���"
      ,COUNT(*)"�μ���ü"
    FROM 
    (   
        SELECT CASE WHEN SUBSTR(SSN, 8, 1) IN ('1', '3') 
                        THEN '����'
                     WHEN SUBSTR(SSN, 8, 1) IN ('2', '4')
                        THEN '����'
                     ELSE '����Ȯ�κҰ�'
                END "����"
             , BUSEO "�μ�"
        FROM TBL_INSA
    ) T                                                                                                                                                                         
WHERE T.�μ� ='������'
GROUP BY T.�μ�;


--41. ���ߺ�, ������, �ѹ��� �ο��� ��ȸ. ��, ������ '����'�� ����.
;
SELECT BUSEO "�μ�" , COUNT(BUSEO)"�ο���"
FROM TBL_INSA
WHERE CITY = '����'
  AND (BUSEO = '���ߺ�'
   OR  BUSEO = '������'
   OR  BUSEO = '�ѹ���')
GROUP BY BUSEO;


--42. ���� ����� ���ڿ� ������ �⺻���� ��ȸ.
;
SELECT T.����, T.���� "����" 
     , SUM(T.�⺻��) "�⺻����"
    FROM 
    (
        SELECT CASE WHEN SUBSTR(SSN, 8, 1) IN ('1','3')
                        THEN '����'
                     WHEN SUBSTR(SSN, 8, 1) IN ('2','4')
                        THEN '����'
                     ELSE '0'
                END "����"
             , BASICPAY "�⺻��"
             , CITY "����"
        FROM TBL_INSA
        WHERE CITY = '����'
    ) T
GROUP BY T.����, T.����;


--43. ���ڿ� ������ �⺻�� ��հ� ��ȸ. AVG(), DECODE() �Լ� �̿�.
;
SELECT T.���� "����"
     , DECODE(T.����,'����', AVG(T.�⺻��), '����', AVG(T.�⺻��), NULL) "�⺻����հ�"
    FROM
    (
        SELECT CASE WHEN SUBSTR(SSN, 8, 1) IN ('1','3')
                        THEN '����'
                     WHEN SUBSTR(SSN, 8, 1) IN ('2','4')
                        THEN '����'
                     ELSE '0'
                END "����"
             , BASICPAY "�⺻��"
        FROM TBL_INSA
    ) T
GROUP BY T.����;


--44. ���ߺ��� ����, ���� �⺻�� ��հ� ��ȸ.
;
SELECT T.���� "����"
     , DECODE(T.����,'����', AVG(T.�⺻��), '����', AVG(T.�⺻��), NULL) "�⺻����հ�"
    FROM
    (
        SELECT CASE WHEN SUBSTR(SSN, 8, 1) IN ('1','3')
                        THEN '����'
                     WHEN SUBSTR(SSN, 8, 1) IN ('2','4')
                        THEN '����'
                     ELSE '0'
                END "����"
             , BASICPAY "�⺻��"
        FROM TBL_INSA
        WHERE BUSEO = '���ߺ�'
    ) T
GROUP BY T.����;


--45. �μ��� ���ڿ� ���� �ο��� ���ϱ�
;
SELECT T.�μ� "�μ�"
     , COUNT(DECODE(T.����, '����', 1, NULL)) "�����ο���"
     , COUNT(DECODE(T.����, '����', 1, NULL)) "�����ο���"
     , COUNT(*) "�μ�����ü"
FROM
(
    SELECT CASE WHEN SUBSTR(SSN, 8, 1) IN ('1','3')
                    THEN '����'
                 WHEN SUBSTR(SSN, 8, 1) IN ('2','4')
                    THEN '����'
                 ELSE '0'
            END "����"
         , BUSEO "�μ�"
    FROM TBL_INSA
) T
GROUP BY (T.�μ�);


--46. ������ ���ڿ� ���� �ο��� ���ϱ�
;
SELECT NVL(T.����, '��ü') "�������"
     , COUNT(DECODE(T.����, '����', 1, NULL)) "�����ο���"
     , COUNT(DECODE(T.����, '����', 1, NULL)) "�����ο���"
     , COUNT(*) "��������ü"
    FROM
    (
        SELECT CASE WHEN SUBSTR(SSN, 8, 1) IN ('1','3')
                        THEN '����'
                     WHEN SUBSTR(SSN, 8, 1) IN ('2','4')
                        THEN '����'
                     ELSE '0'
                END "����"
             , CITY "����"
        FROM TBL_INSA
    ) T
GROUP BY ROLLUP(T.����);


--47. �Ի�⵵�� ���ڿ� ���� �ο��� ���ϱ�
;
SELECT T.�Ի�⵵ "�Ի�⵵"
      , COUNT(DECODE(T.����, '����', 1, NULL)) "�����ο���"
      , COUNT(DECODE(T.����, '����', 1, NULL)) "�����ο���"
      , COUNT(*) "�Ի�⵵�� ��ü"      
    FROM
    (
        SELECT CASE WHEN SUBSTR(SSN, 8, 1) IN ('1','3')
                        THEN '����'
                     WHEN SUBSTR(SSN, 8, 1) IN ('2','4')
                        THEN '����'
                     ELSE '0'
                END "����"
             , EXTRACT(YEAR FROM IBSADATE) "�Ի�⵵"
        FROM TBL_INSA
    ) T
GROUP BY T.�Ի�⵵;


--48. ������, �ѹ��� �ο����� ������ �Ի�⵵�� ���ڿ� ���� �ο��� ���ϱ�
;
SELECT T.�Ի�⵵ "�Ի�⵵"
      , COUNT(DECODE(T.����, '����', 1, NULL)) "�����ο���"
      , COUNT(DECODE(T.����, '����', 1, NULL)) "�����ο���"
      , COUNT(*) "����/�ѹ��� �Ի�⵵��ü"  
    FROM
    (
        SELECT CASE WHEN SUBSTR(SSN, 8, 1) IN ('1','3')
                        THEN '����'
                     WHEN SUBSTR(SSN, 8, 1) IN ('2','4')
                        THEN '����'
                     ELSE '0'
                END "����"
             , EXTRACT(YEAR FROM IBSADATE) "�Ի�⵵"
             , BUSEO "�μ�"
        FROM TBL_INSA
    ) T
WHERE T.�μ� ='������'
   OR T.�μ� ='�ѹ���'
GROUP BY T.�Ի�⵵
ORDER BY T.�Ի�⵵;


--49. ���� ����� �μ��� ���ڿ� �����ο���, ���ڿ� ���� �޿��� ��ȸ.
;
SELECT T.�μ� "�μ�"
      , COUNT(DECODE(T.����, '����', 1, NULL)) "�����ο���"
      , COUNT(DECODE(T.����, '����', 1, NULL)) "�����ο���"
      , NVL(TO_CHAR(SUM(DECODE(T.����,'����', T.�޿�, NULL))), '�޿�����') "���ڱ޿���"
      , NVL(TO_CHAR(SUM(DECODE(T.����,'����', T.�޿�, NULL))), '�޿�����') "���ڱ޿���"
FROM
    (
        SELECT CASE WHEN SUBSTR(SSN, 8, 1) IN ('1','3')
                        THEN '����'
                     WHEN SUBSTR(SSN, 8, 1) IN ('2','4')
                        THEN '����'
                     ELSE '0'
                END "����"
             , BUSEO "�μ�"
             , CITY "����"
             , (BASICPAY+SUDANG) "�޿�"
        FROM TBL_INSA
        WHERE CITY ='����'
    ) T
GROUP BY T.�μ�;


--50. �μ��� �ο��� ���. �ο����� 10 �̻��� ��츸.
;
SELECT BUSEO "�μ�", COUNT(*)"�ο���"
FROM TBL_INSA
GROUP BY BUSEO
HAVING COUNT(*) > 10;


--51. �μ��� ��,�� �ο��� ���. �����ο����� 5�� �̻��� �μ��� ��ȸ.
;
SELECT T.�μ� "�μ�"
      , COUNT(DECODE(T.����, '����', 1, NULL)) "�����ο���"
      , COUNT(DECODE(T.����, '����', 1, NULL)) "�����ο���"
    FROM
    (
        SELECT DECODE(SUBSTR(SSN, 8, 1), 1, '����', 3, '����', 
                                          2, '����', 4, '����', 'Ȯ�κҰ�') "����"
              , BUSEO "�μ�"          
        FROM TBL_INSA
    ) T
GROUP BY T.�μ�
HAVING COUNT(DECODE(T.����, '����', 1, NULL)) > 5;


--52. �̸�, ����, ���� ��ȸ
--    ����: �ֹι�ȣ Ȱ�� 1,3 �� ����, 2,4 �� ���� (DECODE() ���)
--    ����: �ֹι�ȣ Ȱ��
;
SELECT NAME "�̸�"
      , DECODE(SUBSTR(SSN, 8, 1), 1, '����', 3, '����', 2, '����', 4, '����', 'Ȯ�κҰ�') "����"
      , TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (TO_NUMBER(SUBSTR(SSN, 1, 2)) + 1899) "����"
FROM TBL_INSA;


--53. ���� ��� �߿��� �⺻���� 200���� �̻��� ��� ��ȸ. ( �̸�, �⺻�� )
;
SELECT NAME "�̸�", BASICPAY "�⺻��"
FROM TBL_INSA
WHERE CITY='����'
  AND BASICPAY >= 2000000;


--54. �Ի���� �ο��� ���ϱ�. (��, �ο���)   COUNT, GROUP BY, TO_CHAR ���
--    ������� ----------
--     ��  �ο���
--    1��    10��
--    2��    25��
;
SELECT CONCAT(TO_CHAR(IBSADATE, 'MM'),'��') "�Ի��"
      , CONCAT(TO_CHAR(COUNT(*)), '��') "�ο���"
FROM TBL_INSA
GROUP BY TO_CHAR(IBSADATE, 'MM')
ORDER BY 1;


--55. �̸�, �������, �⺻��, ������ ��ȸ.
--    ��������� �ֹι�ȣ ���� (2000-10-10 �������� ���)
--    �⺻���� \1,000,000 �������� ���
;
SELECT T.�̸� AS �̸�
      , (T.����||'-'||T.��||'-'||T.��) AS �������
      , T.�⺻�� AS �⺻��
      , T.���� AS ����
FROM
(
    SELECT NAME "�̸�" 
          , TO_NUMBER(TO_CHAR(SUBSTR(SSN, 1, 2))) + 1899 "����"
          , SUBSTR(SSN, 3, 2) "��"
          , SUBSTR(SSN, 5, 2) "��"
          , BASICPAY "�⺻��"
          , SUDANG "����"
    FROM TBL_INSA
) T ; 


--56. �̸�, ��ŵ�, �⺻���� ��ȸ�ϵ� ��ŵ� �������� ���(1�� ���� ����).
--    ��ŵ��� ������ �⺻�� �������� ���(2�� ���� ����).
;
SELECT NAME AS �̸�, CITY AS ��ŵ���, BASICPAY AS �⺻��
FROM TBL_INSA
ORDER BY 2 DESC, 3;


--57. ��ȭ��ȣ�� NULL�� �ƴѰ͸� ��ȸ. (�̸�, ��ȭ��ȣ)
;
SELECT NAME AS �̸�, TEL AS ��ȭ��ȣ 
FROM TBL_INSA
WHERE TEL IS NOT NULL;


--58. �ٹ������ 10�� �̻��� ��� ��ȸ. (�̸�, �Ի���)
;
SELECT T.�̸� AS �̸�
      , T.�ٹ���� AS �ٹ����
    FROM
    (
        SELECT NAME AS �̸� 
              , TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - TO_NUMBER(TO_CHAR(IBSADATE, 'YYYY')) AS  �ٹ����
        FROM TBL_INSA
    ) T
WHERE T.�ٹ���� > 10;


59. �ֹι�ȣ�� �������� 75~82��� ��ȸ. (�̸�, �ֹι�ȣ, ��ŵ�).
    SUBSTR() �Լ�, BEWTEEN AND ����, TO_NUMBER() �Լ� �̿�.

SELECT SUBSTR(SSN, 1, 2)
FROM TBL_INSA;



--60. �ٹ������ 5~10���� ��� ��ȸ. (�̸�, �Ի���)
;
SELECT T.�̸� AS �̸�
      , T.�ٹ���� AS �ٹ����
    FROM
    (
        SELECT NAME AS �̸� 
              , TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - TO_NUMBER(TO_CHAR(IBSADATE, 'YYYY')) AS  �ٹ����
        FROM TBL_INSA
    ) T
WHERE T.�ٹ���� >= 5
  AND T.�ٹ���� <= 10;


--61. �达, �̾�, �ھ��� ��ȸ (�̸�, �μ�). SUBSTR() �Լ� �̿�.
;
SELECT NAME AS �̸�, BUSEO AS �μ�
FROM TBL_INSA
WHERE SUBSTR(NAME, 1, 1) IN ('��', '��', '��')
;


--62. �Ի����� "��-��-�� ����" �������� ���ڸ� ��ȸ (�̸�, �ֹι�ȣ, �Ի���)
;
SELECT NAME AS �̸�, SSN AS �ֹι�ȣ, TO_CHAR(IBSADATE, 'YYYY-MM-DD DAY') AS �Ի���
FROM TBL_INSA
WHERE SUBSTR(SSN, 8, 1) IN ('1','3')
;


--63. �μ��� ������ �޿��� ���ϱ�. (�μ�, ����, �޿���)
;
SELECT BUSEO AS �μ�
      , JIKWI AS ����
      , SUM(BASICPAY+SUDANG) AS �޿���
FROM TBL_INSA
GROUP BY BUSEO, JIKWI
ORDER BY 1, DECODE(JIKWI, '����', 1, '����', 2, '�븮', 3, '���', 4, 5)
;

SELECT SUM(BASICPAY)
FROM TBL_INSA
WHERE 1=1
AND BUSEO = '������'
AND JIKWI = '�븮'
;

--64. �μ��� ������ �ο���, �޿���, �޿���� ���ϱ�. (�μ�, ����, �޿���)
;
SELECT BUSEO AS �μ�
      , JIKWI AS ���� 
      , COUNT(*) AS �ο���
      , SUM(BASICPAY+SUDANG) AS �޿���
      , ROUND(AVG(BASICPAY+SUDANG),2) AS �޿����
FROM TBL_INSA
GROUP BY BUSEO, JIKWI
ORDER BY 1, DECODE(JIKWI, '����', 1, '����', 2, '�븮', 3, '���', 4, 5)
;


--65. �μ��� ������ �ο����� ���ϵ� �ο����� 5�� �̻��� ��츸 ��ȸ.
;
SELECT BUSEO AS �μ�
      , JIKWI AS ���� 
      , COUNT(*) AS �ο���
FROM TBL_INSA
GROUP BY BUSEO, JIKWI
HAVING COUNT(*) >= 5
ORDER BY 1, DECODE(JIKWI, '����', 1, '����', 2, '�븮', 3, '���', 4, 5)
;


--66. 2000�⿡ �Ի��� ����� ��ȸ. (�̸�, �ֹι�ȣ, �Ի���)
SELECT T.NAME AS �̸�
      , T.SSN AS �ֹι�ȣ
      , T.IBSADATE AS �Ի���
FROM
(
    SELECT NAME 
          , SSN
          , IBSADATE
          , EXTRACT(YEAR FROM IBSADATE) AS �Ի翬��
    FROM TBL_INSA
) T
WHERE T.�Ի翬�� = '2000'
  AND SUBSTR(SSN, 8, 1) IN ('2','4');


--67. ������ �� ����(��, ��, �� ��)��� �����Ͽ� ������ �ο��� ��ȸ (����, �ο���)
;
SELECT SUBSTR(NAME, 1, 1) "����"
      , COUNT (*) "�ο���"
FROM TBL_INSA
GROUP BY SUBSTR(NAME, 1, 1) 
ORDER BY 1;


--68. ��ŵ�(CITY)�� ���� �ο��� ��ȸ.
;
SELECT CITY AS ��ŵ� 
      , COUNT(DECODE(T.����, '����', 1, NULL)) AS �����ο���
      , COUNT(DECODE(T.����, '����', 1, NULL)) AS �����ο���
FROM
(
    SELECT DECODE(SUBSTR(SSN, 8, 1), 1, '����', 3, '����',
                                      2, '����', 4, '����', 'Ȯ�κҰ�')  AS ����
          , CITY
    FROM TBL_INSA
) T
GROUP BY CITY;


--69. �μ��� �����ο����� 5�� �̻��� �μ��� �����ο��� ��ȸ.
;
SELECT T.BUSEO AS �μ�
      , COUNT(DECODE(T.����, '����', 1, NULL)) AS �����ο��� 
FROM
(
    SELECT DECODE(SUBSTR(SSN, 8, 1), 1, '����', 3, '����',
                                      2, '����', 4, '����', 'Ȯ�κҰ�')  AS ����
          , BUSEO
    FROM TBL_INSA
) T
GROUP BY T.BUSEO
HAVING COUNT(DECODE(T.����, '����', 1, NULL)) >= 5
;

--70. �Ի�⵵�� �ο��� ��ȸ.
;
SELECT TO_CHAR(IBSADATE, 'YYYY') AS �Ի�⵵    
      , COUNT(*) AS �ο��� 
FROM TBL_INSA
GROUP BY TO_CHAR(IBSADATE, 'YYYY')
ORDER BY 1;


--71. ��ü�ο���, 2000��, 1999��, 1998�⵵�� �Ի��� �ο��� ������ �������� ��ȸ.
--    ������� ---------------    
--    ��ü 2000 1999 1998
--      60    x    x    x
;

SELECT TO_CHAR(IBSADATE, 'YYYY') AS �Ի�⵵ 
--     , TO_CHAR(IBSAFATE, 'YYYY') = '2000' AS 2000
--      , COUNT(2000)
--      , TO_CHAR(IBSAFATE, 'YYYY') = '1999' AS 1999
FROM TBL_INSA
;

72. �Ʒ� �������� ������ �ο��� ��ȸ.
    ������� -----------------
    ��ü ����  ��õ  ���
      60    x     x     x
;


73. �⺻��(BASICPAY)�� ��� ������ ��� ��ȸ. (�̸�, �⺻��). AVG() �Լ�. ��������.
;
SELECT T.�̸� AS �̸�
      , T.�⺻�� AS �⺻��
FROM
(
    SELECT  NAME AS "�̸�" 
          , BASICPAY AS "�⺻��"
         , AVG(BASICPAY) AS "�⺻�����"
    FROM TBL_INSA
) T
GROUP BY T.�⺻��
HAVING T.�⺻����� > T.�⺻��
;


--74. �⺻�� ���� 10%�� ��ȸ. (�̸�, �⺻��)
;
SELECT *
FROM
(
    SELECT NAME AS �̸�
         , BASICPAY AS �⺻��
         , RANK() OVER(ORDER BY BASICPAY DESC) AS ����
    FROM TBL_INSA
)
WHERE ���� <= (SELECT COUNT(*) * 0.1
               FROM TBL_INSA)
ORDER BY 2 DESC
;

--SELECT COUNT(*) * 0.1
--FROM TBL_INSA;


--75. �⺻�� ������ 5���������� ��ȸ. (��� ����)
;
SELECT *
FROM
(
    SELECT BASICPAY AS �⺻��
          , RANK() OVER(ORDER BY BASICPAY DESC) AS �⺻�޼���
    FROM TBL_INSA
    ORDER BY 1 DESC
)
WHERE �⺻�޼��� <= 5;


--76. �Ի����� ���� ������ 5���������� ��ȸ. (��� ����)
;
SELECT *
FROM
(
    SELECT IBSADATE
         , RANK() OVER(ORDER BY IBSADATE) AS �Ի��ϼ��� 
    FROM TBL_INSA
    ORDER BY 1
)
WHERE �Ի��ϼ��� <= 5;

77. ��� �޿����� ���� �޿��� �޴� ���� ���� ��ȸ. (��� ����)
;



78. '�̼���' ������ �޿����� �� ���� �޿��� �޴� ���� ��ȸ. (��� ����)
    ��, �̼��� ������ �޿��� ���ϴ��� �ۼ��� �������� ��� ������ �����ϵ��� ��ȸ.
;



79. �ѹ����� ��� �޿����� ���� �޿��� �޴� �������� �̸�, �μ��� ��ȸ.
;



80. �ѹ��� �������� ��� ���纸�� �� ���� ������ �޴� ���� ���� ��ȸ.
;



81. ���� ��ü ��� �޿����� ���� �޿��� �޴� ������ �� ��ȸ.
;



82. 'ȫ�浿' ������ ���� �μ��� ���� ���� ��ȸ.
    ��, ȫ�浿 ������ �μ��� �ٲ���� �ۼ��� �������� ��� ������ �����ϵ��� ��ȸ.
;


83. '��ž�' ������ ���� �μ�, ������ ���� ���� ���� ��ȸ.
    ��, ��ž� ������ �μ� �� ������ �ٲ���� �ۼ��� �������� ��� ������ �����ϵ��� ��ȸ.
;



84. �μ��� �⺻���� ���� ���� ��� ��ȸ. (�̸�, �μ�, �⺻��)
    ��, ������� �⺻���� ����Ǵ��� �ۼ��� �������� ��� ������ �����ϵ��� ��ȸ.
;



--85. ��, ���� �⺻�� ���� ��ȸ.
;
SELECT *
FROM
(
    SELECT DECODE(SUBSTR(SSN, 8, 1), 1, '����', 3, '����',
                                    2, '����', 4, '����', 'Ȯ�κҰ�') "����"
         , BASICPAY "�⺻��"
         , RANK() OVER(ORDER BY BASICPAY DESC) "����"
    FROM TBL_INSA
) T 
ORDER BY 3;


86. ����(CITY)���� �޿�(�⺻��+����) 1���� ������ ��ȸ.
;



--87. �μ��� �ο����� ���� ���� �μ� �� �ο��� ��ȸ.
;
SELECT BUSEO AS �μ�
     , COUNT(*)
FROM TBL_INSA
GROUP BY BUSEO
ORDER BY 2 DESC
;

--88. ����(CITY)�� �ο����� ���� ���� ���� �� �ο��� ��ȸ.
;
SELECT CITY, COUNT(*)
FROM TBL_INSA
GROUP BY CITY
ORDER BY 2 DESC
;


89. ����(CITY)�� ��� �޿�(BASICPAY + SUDANG)��
    ���� ���� ���� �� ��ձ޿� ��ȸ.
;



90. ���� �ο����� ���� ���� �μ� �� �ο��� ��ȸ.
;



--91. ������ �ο��� ���� ��ȸ.
;
SELECT CITY AS ����
      , RANK() OVER(ORDER BY COUNT(*) DESC) AS �������ο�����
      , COUNT(*) AS �ο��� 

FROM TBL_INSA
GROUP BY CITY
;

92. ������ �ο��� ���� ��ȸ�ϵ� 5���������� ���.
;
SELECT CITY AS ����
     , COUNT(*) AS �ο���
     , RANK() OVER(ORDER BY COUNT(*) DESC) AS �������ο�����
FROM TBL_INSA
WHERE 5 > (SELECT RANK() OVER(ORDER BY COUNT(*) DESC))
GROUP BY CITY
;

--93. �̸�, �μ�, ��ŵ�, �⺻��, ����, �⺻��+����, ����, �Ǽ��ɾ� ��ȸ
--    ��, ����: �ѱ޿��� 250���� �̻��̸� 2%, 200���� �̻��̸� 1%, ������ 0.
--    �Ǽ��ɾ�: �ѱ޿�-����
;
SELECT  T."�̸�", T."�μ�", T."��ŵ�", T."�⺻��", T."����", T."�޿�", T."����"
      , (T.�޿� - T.����) "�Ǽ��ɾ�"
FROM 
(
    SELECT NAME AS "�̸�"
          , BUSEO AS "�μ�"
          , CITY AS "��ŵ�"
          , BASICPAY AS "�⺻��"
          , SUDANG AS "����"
          , BASICPAY+SUDANG AS "�޿�"
          , CASE WHEN (BASICPAY+SUDANG) > 2500000 
                    THEN  (BASICPAY+SUDANG) * 0.02
                  WHEN (BASICPAY+SUDANG) > 2000000 
                    THEN  (BASICPAY+SUDANG) * 0.01
                 ELSE 0
            END "����"
    FROM TBL_INSA
) T
;


94. �μ��� ��� �޿��� ��ȸ�ϵ�, A, B, C ������� ������ ���.
    200���� �ʰ� - A���
    150~200����  - B���
    150���� �̸� - C���
;
SELECT T.�μ� AS "�μ�"
      , AVG(T.�޿�) AS "��ձ޿�"
      , T.�޿���� AS "�޿����"
FROM
(
    SELECT BUSEO AS "�μ�"
          , (BASICPAY+SUDANG) AS "�޿�" 
          , CASE WHEN AVG(BASICPAY+SUDANG) >= 2000000 
                      THEN 'A'
                  WHEN AVG(BASICPAY+SUDANG) >= 1500000 AND AVG(BASICPAY+SUDANG) < 2000000 
                      THEN 'B'
                  WHEN AVG(BASICPAY+SUDANG) < 1500000   
                      THEN 'C'
                  ELSE 
             END AS "�޿����"
    FROM TBL_INSA
) T
GROUP BY T.�μ�;



SELECT BUSEO
, AVG(BASICPAY+SUDANG)
FROM TBL_INSA
HAVING AVG(BASICPAY+SUDANG);

95. �⺻��+������ ���� ���� ����� �̸�, �⺻��+���� ��ȸ.
    MAX() �Լ�, ���� ���� �̿�.
;

