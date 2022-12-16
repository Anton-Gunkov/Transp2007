&&------------------------Функция для грида----------------------
FUNCTION Tarif()
RETURN ICASE(substr(alltrim(tmprab.obosnov), 1, 3)='310' AND tmprab.km<=50, ;
ICASE(tmprab.class_gruz='1', tarif_legko.i, ;
      tmprab.class_gruz='2', tarif_legko.ii, ;
      tmprab.class_gruz='3', tarif_legko.iii, ;
      tmprab.class_gruz='4', tarif_legko.iv), ;
      substr(alltrim(tmprab.obosnov), 1, 3)='310' AND tmprab.km>50, ;
ICASE(tmprab.class_gruz='1', (tmprab.km-50)*m.n310_1+tarif_legko.i, ;
      tmprab.class_gruz='2', (tmprab.km-50)*m.n310_2+tarif_legko.ii, ;
      tmprab.class_gruz='3', (tmprab.km-50)*m.n310_3+tarif_legko.iii, ;
      tmprab.class_gruz='4', (tmprab.km-50)*m.n310_4+tarif_legko.iv), ;
      substr(alltrim(tmprab.obosnov), 1, 3)='311' AND tmprab.km<=200, ;
ICASE(tmprab.class_gruz='1', tarif.i, ;
      tmprab.class_gruz='2', tarif.ii, ;
      tmprab.class_gruz='3', tarif.iii, ;
      tmprab.class_gruz='4', tarif.iv, ;
      SUBSTR(tmprab.class_gruz, 1, 2)='*1', (tmprab.nadbavka/100+1)*tarif.i, ;
      SUBSTR(tmprab.class_gruz, 1, 2)='*2', (tmprab.nadbavka/100+1)*tarif.ii, ;
      SUBSTR(tmprab.class_gruz, 1, 2)='*3', (tmprab.nadbavka/100+1)*tarif.iii, ;
      SUBSTR(tmprab.class_gruz, 1, 2)='*4', (tmprab.nadbavka/100+1)*tarif.iv), ;
      substr(alltrim(tmprab.obosnov), 1, 3)='311' AND tmprab.km>200, ;
ICASE(tmprab.class_gruz='1', (tmprab.km-200)*m.n311_1+tarif.i, ;
      tmprab.class_gruz='2', (tmprab.km-200)*m.n311_2+tarif.ii, ;
      tmprab.class_gruz='3', (tmprab.km-200)*m.n311_3+tarif.iii, ;
      tmprab.class_gruz='4', (tmprab.km-200)*m.n311_4+tarif.iv, ;
      SUBSTR(tmprab.class_gruz, 1, 2)='*1', (tmprab.nadbavka/100+1)*((tmprab.km-200)*m.n311_1+tarif.i), ;
      SUBSTR(tmprab.class_gruz, 1, 2)='*2', (tmprab.nadbavka/100+1)*((tmprab.km-200)*m.n311_2+tarif.ii), ;
      SUBSTR(tmprab.class_gruz, 1, 2)='*3', (tmprab.nadbavka/100+1)*((tmprab.km-200)*m.n311_3+tarif.iii), ;
      SUBSTR(tmprab.class_gruz, 1, 2)='*4', (tmprab.nadbavka/100+1)*((tmprab.km-200)*m.n311_4+tarif.iv)), ;
      0)
ENDFUNC
