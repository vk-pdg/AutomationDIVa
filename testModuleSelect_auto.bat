@echo off
REM ========================================================================================================
REM Path to project
set DIVA_PROJ_ROOT_DIR=D:\Jenkins\workspace\CICT_AutomationDiVaPipeline_Home\CI_DiVa\

REM Tool version
set ALL=%DIVA_PROJ_ROOT_DIR%PipelineBatchfiles\testModuleSelect_ALL\
set Format=%DIVA_PROJ_ROOT_DIR%PipelineBatchfiles\testModuleSelect_Format\

REM ========================================================================================================

set /a Num= %RANDOM% %% 10 + 1 

echo  %Num%

IF %Num% LEQ 5 (

copy %ALL%2-1.Automation_Diva_jenkins_step2-2.bat %DIVA_PROJ_ROOT_DIR%PipelineBatchfiles\

) ELSE (

copy %Format%2-1.Automation_Diva_jenkins_step2-2.bat %DIVA_PROJ_ROOT_DIR%PipelineBatchfiles\

)
