CLEAR

m.cSeekDir = ALLTRIM('106\00000905.SMR                  ')
m.cLenght_st = LEN('asd')+2
m.cLenght = LEN(cSeekDir)-4
m.c_4 = SUBSTR(cSeekDir, cLenght_st, cLenght)

? m.cSeekDir+' TO '+'DWork\'+m.c_4+'.dbf.zip'

