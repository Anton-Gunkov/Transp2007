IF   FILE(m.cSeekDir+'sobekt.dat')=.T.
     COPY FILE m.cSeekDir+'sobekt.dat' TO 'DWork\spisok.dbf'
ELSE 
     MESSAGEBOX('����������� ����:'+CHR(13)+m.cSeekDir+'sobekt.dat'+CHR(13)+'������ � ��������� ����������..', 0+64+0, '������:')
     DO progs\onexit.prg
ENDIF

IF   FILE(m.cSeekDir+'sorgan.dat')=.T.
     COPY FILE m.cSeekDir+'sorgan.dat' TO 'DWork\spisok_o.dbf'
ELSE 
     MESSAGEBOX('����������� ����:'+CHR(13)+m.cSeekDir+'sorgan.dat'+CHR(13)+'������ � ��������� ����������..', 0+64+0, '������:')
     DO progs\onexit.prg
ENDIF

IF   FILE(m.cSeekDir+'sAct.dat')=.T.
     COPY FILE m.cSeekDir+'sAct.dat' TO 'DWork\spisok_act.dbf'
ELSE 
     MESSAGEBOX('����������� ����:'+CHR(13)+m.cSeekDir+'sAct.dat'+CHR(13)+'������ � ��������� ����������..', 0+64+0, '������:')
     DO progs\onexit.prg
ENDIF

USE dwork\spisok_o IN 0 AGAIN
INDEX ON kod TO DWork\kod
SELECT spisok_o
USE 

USE dwork\spisok_act IN 0 AGAIN
INDEX ON kobekt TO DWork\kobekt 
SELECT spisok_act
USE

IF   FILE('guan.tr')=.T.
     COPY FILE 'guan.tr' TO 'DWork\guan.exe'
ELSE 
     MESSAGEBOX('����������� ����: guan.tr'+CHR(13)+'������ � ��������� ����������..', 0+64+0, '������:')
     DO progs\onexit.prg
ENDIF