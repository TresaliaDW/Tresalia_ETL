If Object_Id (N'Stg.fnGetStartDate', N'FN') Is Not Null
    Drop Function Stg.fnGetStartDate;
Go
Create Function Stg.fnGetStartDate(@ParamKey varchar(100))
Returns DateTime
As
Begin
    Declare	@StartDate DateTime, 
			@MaxJobSequenceNo Int; 

	Select @StartDate = ParamValue from stg.TresaliaParams where ParamType = 'Config' and ParamKey = @ParamKey
	Return (@StartDate);
End;
Go


