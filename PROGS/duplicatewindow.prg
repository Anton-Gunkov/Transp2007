#DEFINE SW_MAXIMIZE  3
#DEFINE SW_MINIMIZE  6

DECLARE Long FindWindow in Win32API String, String
DECLARE Long BringWindowToTop in Win32API Long
DECLARE Long ShowWindow in Win32API Long, Long

Local lnHWND,lcTitle
lcTitle = _screen.Caption
_screen.Caption = Sys(3)
lnHWND = FindWindow(null,m.lcTitle)
_Screen.Caption = m.lcTitle

IF m.lnHWND >0
  BringWindowToTop(m.lnHWND)
  ShowWindow(m.lnHWND,SW_MAXIMIZE)
  MESSAGEBOX("�������� ��� ��������."+CHR(13)+"����� �� ����������� ��������� ��� ���� ��������� ������ ���������.", 0+64+0, "������ �����������!")
  QUIT
ENDIF