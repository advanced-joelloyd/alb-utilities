
DECLARE @FieldDisplayName varchar(500)
SET @FieldDisplayName = 'Earner Name'

select
		'{
	"' + dd.DataDictionaryFieldDisplay + '",
	new FieldData("' + 
		/* dataSetName */ds.DataSetsName + '", ' + 
		/* dictionaryId */CAST(0 /*dd.DataDictionaryId*/ as varchar(50)) +  ', "' + 
		/* fieldDisplay *//*dd.DataDictionaryFieldDisplay +*/ '", "' + 
		/* fieldName */ dd.DataDictionaryFieldName +  '", ' + 
		/* dataSetId */ CAST(0 /*ds.DataSetsId*/ as varchar(50)) + ', "' + 
		/* fieldType */ dd.DataDictionaryFieldType + '", ' + 
		/* addInfoId */ CAST(dd.DataDictionaryAdditionalInfo as varchar(50)) + ', "' + 
		/* defaultFormatting */ /*CAST(dd.DataDictionaryDefaultFormatting as varchar(50)) +*/ '", ' + 
		/* dictionaryMenu */ CAST(0 /*dd.DataDictionaryMenu*/ as varchar(50)) + ', "' + 
		/* fieldSubType */ dd.DataDictionaryFieldSubType + '", ' + 
		/* fieldOrder */ CAST(0 /*dd.DataDictionaryFieldOrder */ as varchar(50)) + ', ' + 
		/* usingRoles */ CAST(dd.DataDictionaryUsingRoles as varchar(50)) + ', ' + 
		/* isStorable */ CAST(0 /*dd.DataDictionaryIsStorable*/ as varchar(50)) + ', "' + 
		/* dictionaryFunction */ dd.DataDictionaryFunction + '", "' + 
		/* dataDictionaryArgs */ dd.DataDictionaryArgs +  '")
}
		'

-- select *
	from
		dbo.DataDictionary as dd
	left join
		dbo.DataSets as ds
	on
		ds.DataSetsId = dd.DataDictionaryDataSetId
	where
		dd.DataDictionaryFieldDisplay like @FieldDisplayName