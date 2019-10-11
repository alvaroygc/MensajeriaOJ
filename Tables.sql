Create Database DocumentsDB;

Use DocumentsDB;

Create Table Audit_Logs(
Id Int Primary Key Identity,
Id_User Int Not Null,
Object_Name Varchar (50),
Action_Name Varchar (50),
Date_Log DateTime Default GetDate(),
Send_Param Varchar (120)
);

Create Table [User](
Id Int Primary Key Identity,
Name Varchar (50) Not Null,
Email Varchar (60) Unique Not Null,
Description Varchar (50),
Pass Varchar (50),
Created_On Datetime Default GetDate(),
Id_State Int
);

Create Table [Status](
Id Int Primary Key Identity,
Name Varchar(50) Not Null,
Description Varchar(50),
Created_On Datetime Default GetDate()
);

Create Table Allowed_Action (
Id Int Primary Key Not Null Identity,
Name Varchar(60) not null,
Description Varchar(60) not null,
Created_On Datetime default getdate()
);

Create Table [Role] (
Id Int Primary Key Not Null Identity,
Name Varchar(60) not null,
Description Varchar(60) not null,
Created_On Datetime default getdate()
);


Create Table Sec_Object (
Id Int Primary Key Not Null Identity,
Name Varchar(60) Not Null,
Description Varchar(60) Not Null,
Created_On Datetime Default GetDate()
);

Create Table Role_Detail (
Id_Role Int Not Null,
Id_Allowed_Action Int Not Null,
Id_Sec_Object Int Not Null,
Created_On DateTime Default GetDate(),
Primary Key (Id_Role, Id_Allowed_Action, Id_Sec_Object)
);

Create Table User_Role(
Id_User Int Not Null,
Id_Role Int Not Null,
Created_On DateTime Default GetDate(),
Primary Key  (Id_User, Id_Role)
);

Create Table Token (
Id int primary key identity,
Text varchar (50) not null,
Expired_dt datetime not null,
Status varchar (25) not null,
Created_dt datetime not null,
Id_User int not null
);

Alter Table Token 
add constraint FK_Token_Id_User
Foreign Key (Id_User) References [User] (Id)

Alter Table User_Role
Add Constraint FK_User_Role_User
Foreign Key (Id_User) References [User] (Id);

Alter Table User_Role
Add Constraint FK_User_Role_Role
Foreign Key (Id_Role) References Role (Id);

Alter Table Role_Detail 
Add Constraint Fk_Role_Detail_Allowed_Action
Foreign Key (Id_Allowed_Action) References Allowed_Action(Id);

Alter Table Role_Detail 
Add Constraint Fk_Role_Detail_Role
Foreign Key (Id_Role) References Role (Id);

Alter Table Role_Detail
Add Constraint Fk_Role_Detail_Sec_Object
Foreign Key (Id_Sec_Object) References Sec_Object (Id);

Alter Table Audit_Logs
Add Constraint FK_Audit_Logs_Id_User
Foreign Key (Id_User) References [User] (Id);

Alter Table [User]
Add Constraint FK_Status_Id_Status
Foreign Key (Id_Status) References [Status] (Id);


