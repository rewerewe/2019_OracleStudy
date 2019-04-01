
--  1�� �ּ��� ó��(������ �ּ��� ó��)

/*
    ������ 
    (������)
    �ּ���
    ó�� 
*/

-- �� ���� ����Ŭ ������ ������ �ڽ��� ���� ��ȸ 

show user;
--==>>  ��� :    USER��(��) "SYS"�Դϴ�.
-- sqlplus ������ �� ����ϴ� ��ɾ� (������ ��� ����)

-- Query���� ��ҹ��ڸ� �������� ������, Oracle ������ �빮�� ����� ����
-- ������ Ctrl+Enter

SELECT USER
FROM DUAL;
--==>>  ��� :    SYS

SELECT 1+2
FROM DUAL;
--==>>  ��� :    3

SELECT 1 + 2
FROM DUAL;
--==>>  ��� :    3

SELECT '�ֿ밭��F������'
FROM DUAL;
--==>>  ��� :    �ֿ밭��F������

--�� �����ݷ��� �����ڷ� ���. �������� �������.
--   ���ڿ� ǥ���� ��������ǥ ���. 
--   ������ ���·� FROME DUAL�� ���. SELECT ���� �Է��� ��� 

SELECT '������ ������ ����Ŭ ����';
/*
ORA-00923: FROM keyword not found where expected
00923. 00000 -  "FROM keyword not found where expected"
*Cause:    
*Action:
40��, 23������ ���� �߻�
*/

SELECT '������ ������ ����Ŭ ����'
FROM DUAL;
--==>>  ��� :    ������ ������ ����Ŭ ����

SELECT 3.14 + 1.36
FROM DUAL;
--==>>  ��� :     4.5

SELECT 1.234 + 2.345
FROM DUAL;
--==>>  ��� :    3.579

SELECT 10*5
FROM DUAL;
--==>>  ��� :    50

SELECT 1000/23
FROM DUAL;
--==>   ��� :    43.47826086956521739130434782608695652174

SELECT 100-23
FROM DUAL;
--==>>  ��� :    77

SELECT "�׽�Ʈ"
FROM DUAL;
--==>>  ��� :    
/*
ORA-00904: "�׽�Ʈ": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
73��, 8������ ���� �߻�
*/

SELECT '������' + '������'
FROM DUAL;
--==>>  ��� :    
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/

-- ���� �������ϴ� ǥ(���̺�)�� ���� �����ؾ� �Ѵ�. 
-- �����δ� ������ �ۼ��� ��, FROM�� ���� ����. 
-- �������� �����ϰ��� �ڡ��, �Ʒ������� ������ ����.  

SELECT *
FROM DBA_USERS;

--��DBA���� �����ϴ� Oracle Data Dictionary View �� 
-- ������ ������ �������� �������� ��쿡�� ��ȸ�� �����ϴ�
-- ������ ������ ��ųʸ� ������ ���� ���ص� �������.

-- �ۡ�HR�� ����� ������ ��� ���·� ����
ALTER USER HR ACCOUNT LOCK;
--==>>  ��� :   User HR��(��) ����Ǿ����ϴ�.

-- �� ����� ���� ���� ��ȸ(Ȯ��)
SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS;
--==>>  ��� :   
/*
:
HR	LOCKED
:
*/

-- �� �ٽ� ��HR�� ����� ������ ������� ����
ALTER USER HR ACCOUNT UNLOCK;

--�� �ٽ� HR ����� ���� ��ȸ(Ȯ��)
SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS;
--==>>  ��� :   
/*
:
HR	OPEN
:
*/

-- CREATE : ������, ������ ���� ���� �� ���
-- INSERT : ��������, ������ ���� ���� �� ���

--�� TABLESPACE ����
--�� TABLESPACE ��?
-- ���׸�Ʈ(���̺�, �ε���,...) �� ��Ƶδ� (�����صδ�)
-- ����Ŭ�� ������ ���� ������ �ǹ��Ѵ�. 
-- �� �������� ��������� �̾����� �Ѵٴ� ����? TABLESPACE �� ���� ��������� �������ְڴ�. 
-- C����̺� / D����̺� 
CREATE TABLESPACE TBS_EDUA                           -- ���� : CREATE ���� ��ü�� / ���� ���� ������ �ɼ� ����  
DATAFILE 'C:\TESTORADATA\TBS_EDUA01.DBF'             -- ���������� ����Ǵ� ������ ����                                   
SIZE 4M                                             -- ������ ������ ������ �뷮
EXTENT MANAGEMENT LOCAL                             -- ����Ŭ ������ ���׸�Ʈ�� �˾Ƽ� ����
SEGMENT SPACE MANAGEMENT AUTO;                      -- ���׸�Ʈ ���� ������ �ڵ����� ����Ŭ ������...

-- ���̺����̽� ���� ������ �����ϱ� ���� 
-- �������� ��ο� ���͸�(TABLESPACE) ������ ��. �� C����̺꿡 TABLESPACE ������ ������־���Ѵ�.

--==>>  ��� :    TABLESPACE TBS_EDUA��(��) �����Ǿ����ϴ�.

--�� ������ ���̺����̽�(TBS_EDUA) ��ȸ
SELECT *
FROM DBA_TABLESPACES;
--==>>  ��� : ���̺��ųʸ� ��� �Ѵ�. 
/*
    :
TBS_EDUA	8192	65536		1	2147483645	2147483645		65536	ONLINE	PERMANENT	LOGGING	NO	LOCAL	SYSTEM	NO	AUTO	DISABLED	NOT APPLY	NO	HOST	NO	                
    :
*/


--�� �������� ���� �̸� ��ȸ
SELECT *
FROM DBA_DATA_FILES;
--==>>  ��� :
/*
    :
C:\TESTORADATA\TBS_EDUA01.DBF	5	TBS_EDUA	4194304	512	AVAILABLE	5	NO	0	0	0	3145728	384	ONLINE
    :
*/


--�� ����Ŭ ����� ���� ����
CREATE USER jih IDENTIFIED BY java006$
DEFAULT TABLESPACE TBS_EDUA;
--> jih ��� ����� ������ ����ڴ�. (�����ϰڴ�.)
--  �� ������ ���� �����ϴ� ����Ŭ ��ü�� (���׸�Ʈ����)
--  �⺻������ TBS_EDUA ��� ���̺����̽��� ������ �� �ֵ��� �����ϰڴ�. 
--==>>  ��� :    User JIH��(��) �����Ǿ����ϴ�.

--�� ������ ����Ŭ ����� ����(jih)�� ���� 
--   ������ �õ��� �������� ���� �Ұ�.
--   �� ��create session�� ������ ���� �����̴�.

--�� ������ ����Ŭ ����� ����(jih)�� 
--   ���� ������ ������ �� �ֵ��� create session ���� �ο� �� sys�� ���ش�.
--   �����̸��� ��ҹ��� ���о���/ �����н������ �ҹ��ڸ� ������. 
GRANT CREATE SESSION TO JIH;
--==>>  ��� :    Grant��(��) �����߽��ϴ�.

--�� ������ ����Ŭ ����� ����(jih)�� 
--   DEFAULT TABLESPACE ��ȸ
SELECT USERNAME, DEFAULT_TABLESPACE
FROM DBA_USERS;
--==>>  ��� :   
/*
SYS	                SYSTEM
SYSTEM	            SYSTEM
ANONYMOUS	        SYSAUX
-- ���⸸ Ȯ������. 
HR	                USERS
JIH	                TBS_EDUA
--
APEX_PUBLIC_USER	    SYSTEM
FLOWS_FILES	        SYSAUX
APEX_040000	        SYSAUX
OUTLN	            SYSTEM
DIP	                SYSTEM
ORACLE_OCM	        SYSTEM
XS$NULL	            SYSTEM
MDSYS	            SYSAUX
CTXSYS	            SYSAUX
DBSNMP	            SYSAUX
XDB	                SYSAUX
APPQOSSYS	        SYSAUX
*/

--�� ������ ����Ŭ ����� ����(jih)��
--   �ý��� ���� ���� ��ȸ
SELECT *
FROM DBA_SYS_PRIVS;
--==>>  ��� :   
/*
    :
JIH	CREATE SESSION	NO
    :
*/

--�� ������ ����Ŭ ����(JIH)�� 
--   ���̺� ������ ������ �� �ֵ��� CREATE TABLE ���� �ο�

GRANT CREATE TABLE TO JIH;
--==>>  ��� :    Grant��(��) �����߽��ϴ�.

--�� ������ ����Ŭ ����� ����(JIH)�� 
--   ���̺����̽�(TBS_EDUA)���� ����� �� �ִ� ����(�Ҵ緮)
--   �� ũ�⸦ ���������� ����.
--   (�������� �����̹Ƿ� ALTER)
--   QUOTA ������ �뷮 ON � ���̺��� 
ALTER USER JIH
QUOTA UNLIMITED ON TBS_EDUA;
--==>>  ��� :    User JIH��(��) ����Ǿ����ϴ�.











