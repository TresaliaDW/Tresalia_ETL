@echo off
SET DatabaseServer=.
ECHO "DatabaseServer : %DatabaseServer%"
SET DatabaseName=TresaliaTest
SET BreakOnError=true

IF NOT '%1' == '' SET BreakOnError=%1
IF NOT '%2' == '' SET ServerName=%2
IF NOT '%3' == '' SET DatabaseName=%3
SET DbStagePath="%~dp0"
cd %DbStagePath%

cls

@echo off
SET DatabaseServer=%1
ECHO "DatabaseServer : %DatabaseServer%"
SET DatabaseName=TresaliaTest
SET ServerName=%DatabaseServer%
SET BreakOnError=true

IF NOT '%1' == '' SET BreakOnError=%1
IF NOT '%2' == '' SET ServerName=%2
IF NOT '%3' == '' SET DatabaseName=%3
IF NOT '%4' == '' SET Iteration=%4
SET DbStagePath="%~dp0"
cd %DbStagePath%

@echo ########################################################################################################
@echo ########## Tresalia Build:Creating Schema in %DatabaseServer%.%DatabaseName% DB.##########
@echo ########################################################################################################
sqlcmd -S %ServerName% -d %DatabaseName% -E -m-1 -b -i "Schema\Create_Stg_Schema.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo off

sqlcmd -S %ServerName% -d %DatabaseName% -E -m-1 -b -i "Schema\Create_DW_Schema.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo off

@echo ########################################################################################################
@echo ########## Tresalia Build:Creating Staging Tables in %DatabaseServer%.%DatabaseName% DB.##########
@echo ########################################################################################################
sqlcmd -S %ServerName% -d %DatabaseName% -E -m-1 -b -i "Tables\Create_Stg_Tables.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo off

@echo ########################################################################################################
@echo ########## Tresalia Build:Creating Job log Table in %DatabaseServer%.%DatabaseName% DB.##########
@echo ########################################################################################################
sqlcmd -S %ServerName% -d %DatabaseName% -E -m-1 -b -i "Tables\Create_Stg_TresaliaJobLog.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo off

@echo ########################################################################################################
@echo ########## Tresalia Build:Creating Paramater Table in %DatabaseServer%.%DatabaseName% DB.##########
@echo ########################################################################################################
sqlcmd -S %ServerName% -d %DatabaseName% -E -m-1 -b -i "Tables\Create_Stg_TresaliaParams.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo off

@echo ########################################################################################################
@echo ########## Tresalia Build:Creating Functions in %DatabaseServer%.%DatabaseName% DB.##########
@echo ########################################################################################################
sqlcmd -S %ServerName% -d %DatabaseName% -E -m-1 -b -i "Functions\Create_Stg_fnGetStartDate.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo off

@echo ########################################################################################################
@echo ########## Tresalia Build:Creating Storepd Procedures in %DatabaseServer%.%DatabaseName% DB.##########
@echo ########################################################################################################
sqlcmd -S %ServerName% -d %DatabaseName% -E -m-1 -b -i "StoredProcedures\Create_Stg_spLogPackageExecutionHistory.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo off

sqlcmd -S %ServerName% -d %DatabaseName% -E -m-1 -b -i "StoredProcedures\Create_Stg_spClearStageTable.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo off

sqlcmd -S %ServerName% -d %DatabaseName% -E -m-1 -b -i "StoredProcedures\Create_Stg_spGetStartDate.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo off

sqlcmd -S %ServerName% -d %DatabaseName% -E -m-1 -b -i "StoredProcedures\Create_Stg_spUpdateStartDate.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo off

sqlcmd -S %ServerName% -d %DatabaseName% -E -m-1 -b -i "StoredProcedures\Create_Stg_spCreateFileHistory.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo off

sqlcmd -S %ServerName% -d %DatabaseName% -E -m-1 -b -i "StoredProcedures\Create_Stg_spUpdateFileHistory.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo off

sqlcmd -S %ServerName% -d %DatabaseName% -E -m-1 -b -i "StoredProcedures\Create_Stg_spGetStagingData.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo off

sqlcmd -S %ServerName% -d %DatabaseName% -E -m-1 -b -i "StoredProcedures\Create_DW_spInsertPickListType.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo off

sqlcmd -S %ServerName% -d %DatabaseName% -E -m-1 -b -i "StoredProcedures\Create_DW_spInsertPickList.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo off

sqlcmd -S %ServerName% -d %DatabaseName% -E -m-1 -b -i "StoredProcedures\Create_Stg_spInsertTresaliaParams.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo off

sqlcmd -S %ServerName% -d %DatabaseName% -E -m-1 -b -i "StoredProcedures\Create_Stg_spValidateAssetType.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo off

@echo ########################################################################################################
@echo ########## Tresalia Build:Inserting static data in %DatabaseServer%.%DatabaseName% DB.##########
@echo ########################################################################################################
sqlcmd -S %ServerName% -d %DatabaseName% -E -m-1 -b -i "Scripts\Insert_Script_TresaliaParam_Table.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo off

sqlcmd -S %ServerName% -d %DatabaseName% -E -m-1 -b -i "Scripts\InsertPickListData.sql"
if %ERRORLEVEL% NEQ 0 goto errors
@echo off





