DO progs\Defox.prg

DO progs\DuplicateWindow.prg

ZOOM WINDOW (_screen.Name) MAX

SET DELETED ON
SET CENTURY ON
SET SAFETY OFF

PUBLIC m.cSeekDir, m.cNomerMat, m.cVidMat, m.lChange

m.cSeekDir = ''
m.cNomerMat = ''
m.cVidMat = ''
m.lChange = .F.
*---------------------------------Проверка WSMR----------------------
o = CreateObject("Wscript.Shell")

TRY 
    m.cSeekDir = o.RegRead("HKEY_CURRENT_USER\Software\WSMR2007\Переменные\Директории\Директорий данных")
CATCH 
    EXIT
ENDTRY

IF m.cSeekDir==''
   MESSAGEBOX('Программа WSMR2007 не найдена'+CHR(13)+'Проверьте правильность установки WSMR2007', 0+64+0, 'Ошибка')
   DO progs\onexit.prg
ENDIF
*---------------------------------MENU--------------------------------

DO menus\main_menu.mpr

&&-----------------------------------code----------------------------
OPEN DATABASE data\datatransport EXCLUSIVE

DO progs\copywsmr.prg

PUBLIC m.n310_1, m.n310_2, m.n310_3, m.n310_4, m.n311_1, m.n311_2, m.n311_3, m.n311_4
m.n310_1 = 0
m.n310_2 = 0
m.n310_3 = 0
m.n310_4 = 0
m.n311_1 = 0
m.n311_2 = 0
m.n311_3 = 0
m.n311_4 = 0

USE data\tarif_legko IN 0 AGAIN 
LOCATE FOR kod='310-51'
  DO WHILE FOUND()
  m.n310_1 = tarif_legko.i
  m.n310_2 = tarif_legko.ii
  m.n310_3 = tarif_legko.iii
  m.n310_4 = tarif_legko.iv
CONTINUE
  ENDDO
SELECT tarif_legko
USE

USE data\tarif IN 0 AGAIN 
LOCATE FOR kod='311-121'
  DO WHILE FOUND()
  m.n311_1 = tarif.i
  m.n311_2 = tarif.ii
  m.n311_3 = tarif.iii
  m.n311_4 = tarif.iv
CONTINUE
  ENDDO
SELECT tarif
USE

&&-------------------------------events--------------------------
ON SHUTDOWN DO progs\onexit.prg
READ EVENTS




