/*REXX*/
PARSE ARG GITHSH USRID
 
SLIB = 'C03058.ISPSLIB'
PLIB = 'C03058.ISPPLIB'
MLIB = 'C03058.ISPMLIB'
"ISPEXEC CONTROL ERRORS RETURN"
"ISPEXEC LIBDEF ISPPLIB DATASET ID ('"PLIB"','SYS3.ISPPLIB')"
"ISPEXEC LIBDEF ISPMLIB DATASET ID ('"MLIB"','SYS3.ISPMLIB')"
"ISPEXEC LIBDEF ISPSLIB DATASET ID ('"SLIB"','SYS3.ISPSLIB')"
GITHSH = '1260908D'
USRID = 'QY4T'
TSTMP = 'T1260908'
 
 TEMP_PS = USRID'.MFCD.TMP.T'SUBSTR(TIME('L'),10,6)
 ADDRESS TSO "ALLOC F(ACCESS) DA('"TEMP_PS"') NEW",
             "SPACE(1,1) CYL",
             "RETPD(1) LRECL(80) RECFM(F B)",
             "BLKSIZE(0) DSORG(PS) NEW"
 ADDRESS ISPEXEC "LIBDEF ISPFILE DATASET ",
                 " ID('"TEMP_PS"')"
  ADDRESS ISPEXEC "FTINCL KBB0I"
  ADDRESS ISPEXEC "FTCLOSE"
  ADDRESS TSO "SUBMIT  '"TEMP_PS"'" 
                           
  ADDRESS TSO "FREE F(ACCESS)"
  ADDRESS ISPEXEC "LIBDEF ISPFILE"
EXIT