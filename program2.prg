CLOSE TABLES ALL
CLOSE DATABASES ALL

PUBLIC m.cmy, m.cno

m.cmy = 'data\gtemp.dbf      '
m.cno = 'dwork\outbase.dbf   '

USE DWork\inbase.dbf IN 0 ALIAS intemp
COPY FILE ALLTRIM(m.cmy) TO ALLTRIM(m.cno)
USE dwork\outbase.dbf IN 0 ALIAS outtemp

SELECT intemp
*SET FILTER TO intemp.tip = 'MT'
INSERT INTO outtemp (kod_res, material, edizm, kolvo, r_mm) SELECT krs, widr, ei, klv, r_mm FROM intemp WHERE tip = 'MT'

SELECT outtemp
BROWSE


CLOSE TABLES ALL
DELETE FILE dwork\outbase.dbf