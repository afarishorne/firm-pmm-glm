CREATE TABLE [FieldType] (
  [Id] longInteger,
  [Label] Text,
  [Order] Integer,
  [Is_Active] Boolean
);


CREATE TABLE [Field] (
  [Id] Type,
  [Label] Type,
  [FieldTypeID] Type,
  [SectionID] Type,
  [Mandatory] Type,
  [Order] Type,
  [Deleted] Type
);


CREATE TABLE [Option] (
  [Id] Type,
  [FeildId] Type,
  [Name] Type,
  [Order] Type,
  [Deleted] Type
);



CREATE TABLE [FieldDependency] (
  [Id] Type,
  [DependsOn] <type>,
  [DependencyOperatorId ] Type,
  [TextCondition] Type,
  [NumberCondition] Type,
  [BooleanCondition] Type,
  [DataCondition] Type,
  [DateTimeCondition] Type,
  [TimeCondition] Type,
  [SingleOptionIdCondition] Type
);



CREATE TABLE [Section] (
  [Id] Type,
  [FormId] Type,
  [Title] Type,
  [Order] Type,
  [Deleted] Type
);


CREATE TABLE [PracticeGroup] (
  [Id] Type,
  [Label] Type,
  [Order] Type,
  [Is_Active] Type
);



CREATE TABLE [FieldData] (
  [Id] Type,
  [RecordId] <type>,
  [FeildId] Type,
  [TextValue] Type,
  [NumberValue] Type,
  [BooleanValue] Type,
  [DateVale] Type,
  [DateTimeValue] Type,
  [TimeValue] Type,
  [SingleOptionIdCondition] Type,
  [MultipleOptionIdValue] Type
);



CREATE TABLE [DependencyOperator] (
  [Id] Type,
  [Label] Type,
  [Order] Type,
  [Is_Active] Type
);



CREATE TABLE [FormLogos] (
  [Id] Type,
  [Logo] Type
);



CREATE TABLE [Form] (
  [Id] Type,
  [Code] Type,
  [Version] Type,
  [FormName] Type,
  [FormDescription] Type,
  [PracticeGroup] Type,
  [FormlogoId] Type
);



CREATE TABLE [FieldDataFile] (
  [Id] Type,
  [Binary] Type,
  [FileName] Type
);



SELECT * FROM [DM].[vw_pmmTeamMemberListing] AS tm WHERE tm.[Email Address] LIKE ('%Lawson.myrick@horne.com%') OR tm.HRMSID LIKE ('%010444%')
SELECT * FROM [DM].[vw_pmmTeamMemberListing] AS tm WHERE tm.[Email Address] LIKE ('%Lawson.myrick@horne.com%')
SELECT * FROM [DM].[StaffDetail] AS S WHERE s.EmailAddress LIKE ('%Lawson.myrick@horne.com%')
SELECT * FROM [DM].[vw_pmmTeamMemberListing] AS tm WHERE tm.HRMSID LIKE ('%010444%') OR tm.HRMSID LIKE ('%104447%') 



