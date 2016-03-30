osql  -S TRES-DEV -d TresaliaTest -i D:\Tresalia\Anupam\Database\Schema\Create_Stg_Schema.sql -o D:\Tresalia\Anupam\Database\SQL_Script_Log.txt -U \tresalia\SapAD1 -P Tresalia.2016$
osql  -S TRES-DEV -d TresaliaTest -i D:\Tresalia\Anupam\Database\Schema\Create_DW_Schema.sql -o D:\Tresalia\Anupam\Database\SQL_Script_Log.txt -U \tresalia\SapAD1 -P Tresalia.2016$

osql  -S TRES-DEV -d TresaliaTest -i D:\Tresalia\Anupam\Database\Tables\Create_Stg_Tables.sql -o D:\Tresalia\Anupam\Database\SQL_Script_Log.txt -U \tresalia\SapAD1 -P Tresalia.2016$
osql  -S TRES-DEV -d TresaliaTest -i D:\Tresalia\Anupam\Database\Tables\Create_Stg_TresaliaJobLog.sql -o D:\Tresalia\Anupam\Database\SQL_Script_Log.txt -U \tresalia\SapAD1 -P Tresalia.2016$
osql  -S TRES-DEV -d TresaliaTest -i D:\Tresalia\Anupam\Database\Tables\Create_Stg_TresaliaJobLog.sql -o D:\Tresalia\Anupam\Database\SQL_Script_Log.txt -U \tresalia\SapAD1 -P Tresalia.2016$

osql  -S TRES-DEV -d TresaliaTest -i D:\Tresalia\Anupam\Database\Scripts\Insert_Script_TresaliaParam_Table.sql -o D:\Tresalia\Anupam\Database\SQL_Script_Log.txt -U \tresalia\SapAD1 -P Tresalia.2016$

osql  -S TRES-DEV -d TresaliaTest -i D:\Tresalia\Anupam\Database\Functions\Create_Stg_fnGetStartDate.sql -o D:\Tresalia\Anupam\Database\SQL_Script_Log.txt -U \tresalia\SapAD1 -P Tresalia.2016$

osql  -S TRES-DEV -d TresaliaTest -i D:\Tresalia\Anupam\Database\StoredProcedures\Create_Stg_spLogPackageExecutionHistory.sql -o D:\Tresalia\Anupam\Database\SQL_Script_Log.txt -U \tresalia\SapAD1 -P Tresalia.2016$
osql  -S TRES-DEV -d TresaliaTest -i D:\Tresalia\Anupam\Database\StoredProcedures\Create_Stg_spClearStageTable.sql -o D:\Tresalia\Anupam\Database\SQL_Script_Log.txt -U \tresalia\SapAD1 -P Tresalia.2016$
osql  -S TRES-DEV -d TresaliaTest -i D:\Tresalia\Anupam\Database\StoredProcedures\Create_Stg_spGetStartDate.sql -o D:\Tresalia\Anupam\Database\SQL_Script_Log.txt -U \tresalia\SapAD1 -P Tresalia.2016$
osql  -S TRES-DEV -d TresaliaTest -i D:\Tresalia\Anupam\Database\StoredProcedures\Create_Stg_spUpdateStartDate.sql -o D:\Tresalia\Anupam\Database\SQL_Script_Log.txt -U \tresalia\SapAD1 -P Tresalia.2016$
osql  -S TRES-DEV -d TresaliaTest -i D:\Tresalia\Anupam\Database\StoredProcedures\Create_Stg_spCreateFileHistory.sql -o D:\Tresalia\Anupam\Database\SQL_Script_Log.txt -U \tresalia\SapAD1 -P Tresalia.2016$
osql  -S TRES-DEV -d TresaliaTest -i D:\Tresalia\Anupam\Database\StoredProcedures\Create_Stg_spUpdateStartDate.sql -o D:\Tresalia\Anupam\Database\SQL_Script_Log.txt -U \tresalia\SapAD1 -P Tresalia.2016$