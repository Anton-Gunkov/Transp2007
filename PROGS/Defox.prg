set procedure to defox_proc

set talk off
set deleted on
set date to german
set century on
set safety off
local m.lnErr, m.lnErr1, m.lnOtv, m.lcTxt, m.lcRegKey, m.ldExpDate

m.lcRegKey=""
m.lnErr=CheckRegistered(@m.lcRegKey)

if m.lnErr=0 or between(m.lnErr, 1000, 9999)
	
	_screen.Caption = 'Transport2007 �������� v1.3 ��� ��-257 �����������'
	return
	
else
	IF between(m.lnErr,20,39)
		m.lnOtv=messagebox("���������� ��������� ���������� � ��������� �� �������."+chr(13)+ ;
			               "�������: ��������� �������� ������ ��� ���"+chr(13)+ ;
			               "���������� � ��������� � ������� ����������."+chr(13)+chr(13)+ ;
			               "'��'  -  ��������/���������� ���������� � ��������� � ������"+chr(13)+ ;
			               "           (���������� ��� ���������� �����������)"+chr(13)+chr(13)+ ;
			               "'���' - ���������� ���������� � ����������."+chr(13)+chr(13)+ ;
			               "                                   ��� �����?", ;
			               36, "��������������")
		if m.lnOtv=7
			_screen.Caption = 'Transport2007 ������������� v1.3 '
			return
		endif
		
		m.lnErr1=SetRegistryInfo(date()+15)
		if m.lnErr1>0
			messagebox("�� ������ �������� ���������� � ��������� � ������."+chr(13)+ ;
			           "������ � "+allt(str(m.lnErr1))+chr(13)+ ;
			           "��������� �� ������� :(", 16, "������:")
			_screen.Caption = 'Transport2007 ������������� v1.3 '
			return
		endif

		m.lnErr1=GetRegistryInfo(@m.lcTxt)
		if m.lnErr1>0
			messagebox("�� ������ �������� ���������� � ��������� � �������."+chr(13)+ ;
				       "��������� �� ������� :(", 16, "������:")
			_screen.Caption = 'Transport2007 ������������� v1.3 '
			return
		endif

	ENDIF
	
	*---------------------------������� ��� ��� ���������
	m.lcRegKey=""
    m.lnErr=CheckRegistered(@m.lcRegKey)
	
	DO CASE 
	   CASE m.lnErr=0 or between(m.lnErr, 1000, 9999)
	        _screen.Caption = 'Transport2007 �������� v1.3 ��� ��-257 �����������'
	   OTHERWISE 
	        _screen.Caption = 'Transport2007 v1.3 DEMO-������'
	ENDCASE 
	
	return
     	  	
endif

release procedure defox_proc

