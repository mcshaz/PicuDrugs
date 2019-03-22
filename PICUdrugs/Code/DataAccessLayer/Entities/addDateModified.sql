use PicuDrugData
go

DECLARE @Dynsql nvarchar(max) 
SET @Dynsql = ''

SELECT @Dynsql = @Dynsql + '
alter table ' + QUOTENAME(SCHEMA_NAME(schema_id))+ '.' + QUOTENAME(name)  + 
' add [DateModified] datetime not null default getdate()' 
FROM sys.tables
WHERE type='U' and object_id NOT IN (select object_id from sys.columns where name='DateModified') 
	and name in ('BolusDrugs','DoseCats','DilutionMethods','DefibModels','DrugReferenceSources','SiUnits','SiPrefixes','Wards','InfusionDrugs','DefibJoules','BolusDoses','BolusSortOrdering','InfusionSortOrdering','DrugAmpuleConcentrations','FixedTimeDilutions','VariableTimeDilutions','VariableTimeConcentrations','FixedTimeConcentrations','InfusionDiluents','DrugRoutes','FixedDoses','FixedDrugs')


EXEC (@Dynsql)