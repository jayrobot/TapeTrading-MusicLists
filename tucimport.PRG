local lcBand,;
      lcCountry,;
      lcTitle,;
      lcType,;
      lcDate,;
      lcIDNr,;
      lcTime

SCAN
* for INLIST(UPPER(band),'ARMAGEDDA','BLOODHAMMER')
  IF OCCURS('(',import)>1
    lcBand=allt(SUBSTR(import,1,AT('(',import,2)-1))
    lcCountry=SUBSTR(import,AT('(',import,2)+1,AT(')',import,2)+1-AT('(',import,2)-2)
  ELSE
    lcBand=allt(SUBSTR(import,1,AT('(',import)-1))
    lcCountry=SUBSTR(import,AT('(',import)+1,AT(')',import)+1-AT('(',import)-2)
  ENDIF
  lcTitle=SUBSTR(import,AT(') -',import)+4,AT('[',import)+1-AT(') -',import)-5)
  IF AT(']',import)-AT('[',import)<8
    if val(allt(SUBSTR(import,AT('[',import)+2,AT(']',import)-5-AT('[',import)-2)))<1900
      if AT(']',import)-AT('[',import)=2
        lcType=''
        lcDate=''
      ELSE
        lcType=allt(SUBSTR(import,AT('[',import)+2,AT(']',import)-AT('[',import)-2))
        lcDate=''
      ENDIF
    ELSE
      lcType=''
      lcDate=allt(SUBSTR(import,AT('[',import)+2,AT(']',import)-AT('[',import)-2))
    ENDIF
  ELSE
    lcType=allt(SUBSTR(import,AT('[',import)+2,AT(']',import)-5-AT('[',import)-2))
    lcDate=SUBSTR(import,AT(']',import)-5,4)
  ENDIF
  lcIDNr=SUBSTR(import,AT('[IDNR',import)+6,5)
  lcTime=SUBSTR(import,AT('time:',import)+6,9)
  
  REPLACE Band with lcBand,;
          Country with lcCountry,;
          Title with lcTitle,;
          Type with lcType,;
          Date with lcDate,;
          IDNr with lcIDNr,;
          Time with lcTime
ENDSCAN
  