IF FILE(m.cSeekDir+m.nKod+'\000'+ALLTRIM(STR(m.nFcounter))+SUBSTR(ALLTRIM(STR(m.nYear)), 3, 2)+m.nMonth+'.smr') = .T.

   ZAP IN objectX

   FOR m.nFcounter = 0 TO 50 STEP 1

      DO CASE 
         CASE m.nFcounter <= 9
             IF FILE(m.cSeekDir+m.nKod+'\000'+ALLTRIM(STR(m.nFcounter))+SUBSTR(ALLTRIM(STR(m.nYear)), 3, 2)+m.nMonth+'.smr') = .T.   
                COPY FILE ''+m.cSeekDir+m.nKod+'\000'+ALLTRIM(STR(m.nFcounter))+SUBSTR(ALLTRIM(STR(m.nYear)), 3, 2)+m.nMonth+'.smr' TO 'DWork\000'+ALLTRIM(STR(m.nFcounter))+SUBSTR(ALLTRIM(STR(m.nYear)), 3, 2)+m.nMonth+'.dbf.zip'
                
                lnResult = loShell.Run('DWork\guan.exe e '+'DWork\000'+ALLTRIM(STR(m.nFcounter))+SUBSTR(ALLTRIM(STR(m.nYear)), 3, 2)+m.nMonth+'.dbf.zip'+' -oDWork\ -y',0,.T.)
                
                DO CASE 
                   CASE lnResult = 0 
                        strtofile(substr(filetostr('DWork\000'+ALLTRIM(STR(m.nFcounter))+SUBSTR(ALLTRIM(STR(m.nYear)), 3, 2)+m.nMonth+'.dbf'),201),'DWork\000'+ALLTRIM(STR(m.nFcounter))+SUBSTR(ALLTRIM(STR(m.nYear)), 3, 2)+m.nMonth+'.dbf')
                        USE 'DWork\000'+ALLTRIM(STR(m.nFcounter))+SUBSTR(ALLTRIM(STR(m.nYear)), 3, 2)+m.nMonth+'.dbf' IN 0 ALIAS tmpo
                        SELECT tmpo
                        GO TOP
                        m.nAkt = iif(alines(aTemp, tmpo.widr, .t., '#') > 4, aTemp[5], '')
                        m.cName = tmpo.frmt
                        m.cPathX = 'DWork\000'+ALLTRIM(STR(m.nFcounter))+SUBSTR(ALLTRIM(STR(m.nYear)), 3, 2)+m.nMonth+'.dbf'
                        m.cPathW = ''+m.cSeekDir+m.nKod+'\g00'+ALLTRIM(STR(m.nFcounter))+SUBSTR(ALLTRIM(STR(m.nYear)), 3, 2)+m.nMonth+'.dbf'
                        INSERT INTO objectX(n_akt, naimen, path_file, path_wsmr) VALUES (m.nAkt, m.cName, m.cPathX, m.cPathW)
                        SELECT tmpo
                        USE
                        
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
         CASE m.nFcounter >= 10
             IF FILE(m.cSeekDir+m.nKod+'\00'+ALLTRIM(STR(m.nFcounter))+SUBSTR(ALLTRIM(STR(m.nYear)), 3, 2)+m.nMonth+'.smr') = .T.
                COPY FILE m.cSeekDir+m.nKod+'\00'+ALLTRIM(STR(m.nFcounter))+SUBSTR(ALLTRIM(STR(m.nYear)), 3, 2)+m.nMonth+'.smr' TO 'DWork\00'+ALLTRIM(STR(m.nFcounter))+SUBSTR(ALLTRIM(STR(m.nYear)), 3, 2)+m.nMonth+'.dbf.zip'
                
                lnResult = loShell.Run('DWork\guan.exe e '+'DWork\00'+ALLTRIM(STR(m.nFcounter))+SUBSTR(ALLTRIM(STR(m.nYear)), 3, 2)+m.nMonth+'.dbf.zip'+' -oDWork\ -y',0,.T.)
                
                DO CASE 
                   CASE lnResult = 0 
                        strtofile(substr(filetostr('DWork\00'+ALLTRIM(STR(m.nFcounter))+SUBSTR(ALLTRIM(STR(m.nYear)), 3, 2)+m.nMonth+'.dbf'),201),'DWork\00'+ALLTRIM(STR(m.nFcounter))+SUBSTR(ALLTRIM(STR(m.nYear)), 3, 2)+m.nMonth+'.dbf')
                        USE 'DWork\00'+ALLTRIM(STR(m.nFcounter))+SUBSTR(ALLTRIM(STR(m.nYear)), 3, 2)+m.nMonth+'.dbf' IN 0 ALIAS tmpo
                        SELECT tmpo
                        GO TOP
                        m.nAkt = iif(alines(aTemp, tmpo.widr, .t., '#') > 4, aTemp[5], '')
                        m.cName = tmpo.frmt
                        m.cPathX = 'DWork\00'+ALLTRIM(STR(m.nFcounter))+SUBSTR(ALLTRIM(STR(m.nYear)), 3, 2)+m.nMonth+'.dbf'
                        m.cPathW = ''+m.cSeekDir+m.nKod+'\g0'+ALLTRIM(STR(m.nFcounter))+SUBSTR(ALLTRIM(STR(m.nYear)), 3, 2)+m.nMonth+'.dbf'
                        INSERT INTO objectX(n_akt, naimen, path_file, path_wsmr) VALUES (m.nAkt, m.cName, m.cPathX, m.cPathW)
                        SELECT tmpo
                        USE
                        
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
      OTHERWISE 
             EXIT
      ENDCASE
    
   m.cLabel = ALLTRIM(Months.mes9c)+' '+ALLTRIM(STR(m.nYear))+'�.'
   
   ENDFOR
   
ELSE 
   MESSAGEBOX('������ ��� ��������� ���� �����������!'+CHR(13)+'�������� ���� ����...', 0+64+0, '��������:')
ENDIF

