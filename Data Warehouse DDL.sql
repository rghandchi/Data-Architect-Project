CREATE TABLE [FactCall] (
	CallID int NOT NULL,
	CustomerID int NOT NULL,
	AgentID int NOT NULL,
	CallTypeID int NOT NULL,
	DateID int NOT NULL,
	TimeID int NOT NULL,
	TalkTime int,
	WaitTime int,
	JobLoadDate datetime NOT NULL,
	JobLoadUser nvarchar(60) NOT NULL,
  CONSTRAINT [PK_FACTCALL] PRIMARY KEY CLUSTERED
  (
  [CallID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [DimCustomer] (
	CustomerID int NOT NULL,
	FirstName nvarchar(60) NOT NULL,
	LastName nvarchar(60) NOT NULL,
	ActiveRow bit NOT NULL,
	JobLoadDate datetime NOT NULL,
	JobLoadUser nvarchar(60) NOT NULL,
  CONSTRAINT [PK_DIMCUSTOMER] PRIMARY KEY CLUSTERED
  (
  [CustomerID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [DimAgent] (
	AgentKey int NOT NULL,
	AgentID int NOT NULL,
	FirstName nvarchar(60) NOT NULL,
	LastName nvarchar(60) NOT NULL,
	TeamID int NOT NULL,
	EffectiveStartDate date NOT NULL,
	EffectiveEndDate date NOT NULL,
	ActiveRow bit NOT NULL,
	JobLoadDate datetime NOT NULL,
	JobLoadUser nvarchar(60) NOT NULL,
  CONSTRAINT [PK_DIMAGENT] PRIMARY KEY CLUSTERED
  (
  [AgentKey] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [DimCallType] (
	CallTypeID int NOT NULL,
	CallDescription nvarchar(60) NOT NULL,
	EffectiveStartDate date NOT NULL,
	EffectiveEndDate date NOT NULL,
	isActiveRow bit NOT NULL,
	jobLoadDate datetime,
	jobLoadUser nvarchar(60),
  CONSTRAINT [PK_DIMCALLTYPE] PRIMARY KEY CLUSTERED
  (
  [CallTypeID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [DimDate] (
	DateID int NOT NULL,
	Date date NOT NULL,
	PublicHolidayType nvarchar(60),
	MonthName nvarchar(60) NOT NULL,
	MonthAbbreviation nvarchar(60) NOT NULL,
	WorkdayIndicator bit NOT NULL,
	JobLoadDate datetime,
	JobLoadUser nvarchar(60),
  CONSTRAINT [PK_DIMDATE] PRIMARY KEY CLUSTERED
  (
  [DateID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [DimTime] (
	TimeID int NOT NULL,
	TimeValue time NOT NULL,
	TimeOfDaySegment nvarchar(60) NOT NULL,
	JobLoadDate datetime,
	JobLoadUser nvarchar(60),
  CONSTRAINT [PK_DIMTIME] PRIMARY KEY CLUSTERED
  (
  [TimeID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [DimTeam] (
	TeamID int NOT NULL,
	TeamName nvarchar(60) NOT NULL,
	DivisionName nvarchar(60) NOT NULL,
	JobLoadDate datetime,
	JobLoadUser nvarchar(60),
  CONSTRAINT [PK_DIMTEAM] PRIMARY KEY CLUSTERED
  (
  [TeamID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
ALTER TABLE [FactCall] WITH CHECK ADD CONSTRAINT [FactCall_fk0] FOREIGN KEY ([CustomerID]) REFERENCES [DimCustomer]([CustomerID])
ON UPDATE CASCADE
GO
ALTER TABLE [FactCall] CHECK CONSTRAINT [FactCall_fk0]
GO
ALTER TABLE [FactCall] WITH CHECK ADD CONSTRAINT [FactCall_fk1] FOREIGN KEY ([AgentID]) REFERENCES [DimAgent]([AgentID])
ON UPDATE CASCADE
GO
ALTER TABLE [FactCall] CHECK CONSTRAINT [FactCall_fk1]
GO
ALTER TABLE [FactCall] WITH CHECK ADD CONSTRAINT [FactCall_fk2] FOREIGN KEY ([CallTypeID]) REFERENCES [DimCallType]([CallTypeID])
ON UPDATE CASCADE
GO
ALTER TABLE [FactCall] CHECK CONSTRAINT [FactCall_fk2]
GO
ALTER TABLE [FactCall] WITH CHECK ADD CONSTRAINT [FactCall_fk3] FOREIGN KEY ([DateID]) REFERENCES [DimDate]([DateID])
ON UPDATE CASCADE
GO
ALTER TABLE [FactCall] CHECK CONSTRAINT [FactCall_fk3]
GO
ALTER TABLE [FactCall] WITH CHECK ADD CONSTRAINT [FactCall_fk4] FOREIGN KEY ([TimeID]) REFERENCES [DimTime]([TimeID])
ON UPDATE CASCADE
GO
ALTER TABLE [FactCall] CHECK CONSTRAINT [FactCall_fk4]
GO


ALTER TABLE [DimAgent] WITH CHECK ADD CONSTRAINT [DimAgent_fk0] FOREIGN KEY ([TeamID]) REFERENCES [DimTeam]([TeamID])
ON UPDATE CASCADE
GO
ALTER TABLE [DimAgent] CHECK CONSTRAINT [DimAgent_fk0]
GO





