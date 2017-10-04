call EXPERT.exe e -o
call GepInstall.exe /auto
ep_regsvr32 @A_P.reg.txt
call EP_ComponentCmdsRegSvr.exe EP_ComponentCmdsLibBase.EPW4_Cathegory_Components
call EP_OpenCheckDbBuilder.exe 
call ep_regsvr32.exe Esa.exe 
call ep_regsvr32.exe ODA.exe 
call SystemCom2EsaReg.exe 
call XEP_ProjectStorageService.exe -createstorage -nofailwhenexist -silentsuccess 
call XEP_StringCodeGenerator.exe 
