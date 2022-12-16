PUBLIC m.nYear, m.nFcounter, m.cSeekDir, m.nKod, m.nMonth, lnResult

PUBLIC m.nAkt, m.cName, m.cPathX

SET SAFETY OFF

m.nKod='106'
m.nMonth='01'
m.cSeekDir = 'D:\Wsmr2007\wsmrdat\DAT\'
m.nYear = 2010
m.nFcounter = 0

DO C:\Transp2007\progs\copywsmr.prg
TRY 
   SELECT spisok
   USE 
   SELECT spisok_o
   USE 
   SELECT spisok_act
   USE 
CATCH
ENDTRY

USE dwork\spisok_o IN 0 AGAIN
INDEX ON kod TO DWork\kod
SELECT spisok_o
USE 

USE dwork\spisok_act IN 0 AGAIN
INDEX ON kobekt TO DWork\kobekt 
SELECT spisok_act
USE 

USE dwork\spisok IN 0 AGAIN
USE dwork\spisok_o INDEX DWork\kod.idx ORDER kod IN 0 AGAIN
USE dwork\spisok_act INDEX DWork\kobekt.idx ORDER kobekt IN 0 AGAIN

SELECT spisok 
SET RELATION TO zak INTO spisok_o

CREATE CURSOR objectX (n_akt C(11), naimen C(150), path_file C(100), path_wsmr c(100))

PUBLIC lnResult, m.lnLres, m.cLenght, m.c_4

loShell = CREATEOBJECT("Wscript.Shell") 

lnResult = 0  
m.lnLres = .F.
m.cLenght = 0
m.c_4 = ''

SELECT spisok_act
GO TOP 

LOCATE FOR ALLTRIM(spisok_act.kobekt) = m.nKod
DO WHILE FOUND( )
    IF SUBSTR(ALLTRIM(spisok_act.Fnaim), LEN(nKod) + 6, 4) = SUBSTR(ALLTRIM(STR(m.nYear)), 3, 2)+m.nMonth
    m.lnLres = .T.  
    EXIT 
    ENDIF
   CONTINUE 
ENDDO 

DO CASE 
   CASE lnLres = .T.
   ZAP IN objectX
   
   SELECT spisok_act
   GO TOP 
   LOCATE FOR ALLTRIM(spisok_act.kobekt) = m.nKod
   DO WHILE FOUND( )
      IF SUBSTR(ALLTRIM(spisok_act.Fnaim), LEN(nKod) + 6, 4) = SUBSTR(ALLTRIM(STR(m.nYear)), 3, 2)+m.nMonth ;
         AND FILE(m.cSeekDir+ALLTRIM(spisok_act.Fnaim)) = .T.   && �������� m.nMonth � ������� �����
      
         m.cLenght = LEN(nKod) + 2
         m.c_4 = SUBSTR(ALLTRIM(spisok_act.Fnaim), cLenght, 8)
         
         COPY FILE ''+m.cSeekDir+ALLTRIM(spisok_act.Fnaim) TO 'DWork\'+m.c_4+'.dbf.zip'

         lnResult = loShell.Run('DWork\guan.exe e '+'DWork\'+m.c_4+'.dbf.zip'+' -oDWork\ -y',0,.T.)
         
         DO CASE 
            CASE lnResult = 0 
                 strtofile(substr(filetostr('DWork\'+m.c_4+'.dbf'),201),'DWork\'+m.c_4+'.dbf')
                 USE 'DWork\'+m.c_4+'.dbf' IN 0 ALIAS tmpo
                 SELECT tmpo
                 GO TOP
                 
                 m.nAkt = iif(alines(aTemp, tmpo.widr, .t., '#') > 4, aTemp[5], '')
                 m.cName = spisok_act.Nfirm
                 m.cPathX = 'DWork\'+m.c_4+'.dbf'
                 m.cPathW = ''+m.cSeekDir+SUBSTR(ALLTRIM(spisok_act.Fnaim), 1, cLenght-1)+'g'+SUBSTR(ALLTRIM(spisok_act.Fnaim), cLenght+1, 7)+'.dbf'
                 
                 INSERT INTO objectX(n_akt, naimen, path_file, path_wsmr) VALUES (m.nAkt, m.cName, m.cPathX, m.cPathW)
                 SELECT tmpo
                 USE
                 
                 SELECT spisok_act
                                                                      
            CASE lnResult = 1  
                 MESSAGEBOX('��������������: ���� ��� ���������������� �����',0+16+0,'������')     
            CASE lnResult = 2  
                 MESSAGEBOX('����������� ������ ����������������',0+16+0,'������')
            CASE lnResult = 7
                 MESSAGEBOX('����������� ������ � '+CHR(13)+'��������� ������ ����������������',0+16+0,'������')
            CASE lnResult = 8
                 MESSAGEBOX('������������ ������ ��� ����������������',0+16+0,'������')
            CASE lnResult = 255
                 MESSAGEBOX('������� ���������������� ������� �������������',0+16+0,'������')          
         ENDCASE
      ELSE 
         EXIT
      ENDIF
      CONTINUE
   ENDDO
        m.cLabel = ALLTRIM(Months.mes9c)+' '+ALLTRIM(STR(m.nYear))+'�.'
   CASE lnLres = .F.
        MESSAGEBOX('������ ��� ��������� ���� �����������!'+CHR(13)+'�������� ���� ����...', 0+64+0, '��������:')
ENDCASE


SELECT objectX
BROWSE

DO progs\onexit.prg


