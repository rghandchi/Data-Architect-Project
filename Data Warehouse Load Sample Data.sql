INSERT INTO [DimCustomer] (CustomerID, FirstName, LastName, ActiveRow, JobLoadDate, JobLoadUser)
VALUES
(1, 'John', 'Doe', 1, '2023-11-01 08:00:00', 'ETL'),
(2, 'Jane', 'Smith', 1, '2023-11-01 08:15:00', 'ETL'),
(3, 'Bob', 'Johnson', 1, '2023-11-01 08:30:00', 'ETL'),
(4, 'Alice', 'Brown', 1, '2023-11-01 08:45:00', 'ETL'),
(5, 'David', 'Wilson', 1, '2023-11-01 09:00:00', 'ETL'),
(6, 'Eva', 'Miller', 1, '2023-11-01 09:15:00', 'ETL'),
(7, 'Michael', 'Lee', 1, '2023-11-01 09:30:00', 'ETL'),
(8, 'Sarah', 'Anderson', 1, '2023-11-01 09:45:00', 'ETL'),
(9, 'William', 'Martinez', 1, '2023-11-01 10:00:00', 'ETL'),
(10, 'Olivia', 'Garcia', 1, '2023-11-01 10:15:00', 'ETL'),
(11, 'James', 'Roberts', 1, '2023-11-01 10:30:00', 'ETL'),
(12, 'Sophia', 'Turner', 1, '2023-11-01 10:45:00', 'ETL'),
(13, 'Mason', 'White', 1, '2023-11-01 11:00:00', 'ETL'),
(14, 'Charlotte', 'Hall', 1, '2023-11-01 11:15:00', 'ETL'),
(15, 'Liam', 'Green', 1, '2023-11-01 11:30:00', 'ETL'),
(16, 'Ava', 'Collins', 1, '2023-11-01 11:45:00', 'ETL'),
(17, 'Benjamin', 'Evans', 1, '2023-11-01 12:00:00', 'ETL'),
(18, 'Emma', 'Murphy', 1, '2023-11-01 12:15:00', 'ETL'),
(19, 'Lucas', 'Harris', 1, '2023-11-01 12:30:00', 'ETL'),
(20, 'Lily', 'Parker', 1, '2023-11-01 12:45:00', 'ETL');

--This script creates the DimTeam table and inserts 20 rows of sample data. You can insert more rows by following the same pattern. Adjust the values as per your requirements.

INSERT INTO [DimTeam] (TeamID, TeamName, DivisionName, JobLoadDate, JobLoadUser)
VALUES
(1, 'Online Applications', 'CIO', '2023-11-01 08:00:00', 'ETL'),
(2, 'Business Technology', 'CIO', '2023-11-01 08:15:00', 'ETL'),
(3, 'Actuarial', 'Compliance',  '2023-11-01 09:15:00', 'ETL'),
(4, 'Underwriting', 'Compliance',  '2023-11-01 09:30:00', 'ETL'),
(5, 'Claims Investigation', 'Compliance',  '2023-11-01 09:45:00', 'ETL'),
(6, 'Customer Service', 'Operations', '2023-11-01 08:30:00', 'ETL'),
(7, 'Marketing', 'Operations', '2023-11-01 08:45:00', 'ETL'),
(8, 'Risk Management', 'Operations', '2023-11-01 09:00:00', 'ETL');


INSERT INTO [DimAgent] (AgentKey, AgentID, FirstName, LastName, TeamID, EffectiveStartDate, EffectiveEndDate, ActiveRow, JobLoadDate, JobLoadUser)
VALUES
(1, 1001, 'John', 'Doe', 4, '2023-01-01', '2023-03-31', 0, '2023-11-01 08:00:00', 'ETL'),
(2, 1002, 'Jane', 'Smith', 2, '2023-01-01', '2023-06-30', 1, '2023-11-01 08:15:00', 'ETL'),
(3, 1003, 'Bob', 'Johnson', 3, '2023-01-01', '9999-12-31', 1, '2023-11-01 08:30:00', 'ETL'),
(4, 1004, 'Alice', 'Brown', 1, '2023-01-01', '9999-12-31', 1, '2023-11-01 08:45:00', 'ETL'),
(5, 1005, 'David', 'Wilson', 6, '2023-01-01', '9999-12-31', 1, '2023-11-01 09:00:00', 'ETL'),
(6, 1006, 'Eva', 'Miller', 7, '2023-01-01', '9999-12-31', 1, '2023-11-01 09:15:00', 'ETL'),
(7, 1007, 'Michael', 'Lee', 5, '2023-01-01', '9999-12-31', 1, '2023-11-01 09:30:00', 'ETL'),
(8, 1008, 'Sarah', 'Anderson', 8, '2023-01-01', '9999-12-31', 1, '2023-11-01 09:45:00', 'ETL'),
(9, 1001, 'John', 'Doe', 3, '2023-04-01', '9999-12-31', 1, '2023-11-01 10:00:00', 'ETL'),
(10, 1010, 'Olivia', 'Garcia', 1, '2023-01-01', '9999-12-31', 1, '2023-11-01 10:15:00', 'ETL'),
(11, 1002, 'Jane', 'Smith', 6, '2023-07-01', '9999-12-31', 1, '2023-11-01 10:15:00', 'ETL');


INSERT INTO [DimCallType] (CallTypeID, Description, isActiveRow, jobLoadDate, jobLoadUser)
VALUES
(1, 'Internal Calls', 1, GETDATE(), 'User1'),
(2, 'Incoming Calls via Direct line', 1, GETDATE(), 'User2'),
(3, 'Incoming Calls Via Call Center', 1, GETDATE(), 'User1'),
(4, 'Outbound Calls', 1, GETDATE(), 'User3');

DECLARE @StartDate date = '2023-01-01';
DECLARE @EndDate date = GETDATE();
DECLARE @CurrentDate date = @StartDate;

WHILE @CurrentDate <= @EndDate
BEGIN
    DECLARE @MonthName nvarchar(60) = FORMAT(@CurrentDate, 'MMMM');
    DECLARE @MonthAbbreviation nvarchar(60) = FORMAT(@CurrentDate, 'MMM');

    INSERT INTO [DimDate] (DateID, Date, PublicHolidayType, MonthName, MonthAbbreviation, WorkdayIndicator, JobLoadDate, JobLoadUser)
    VALUES (
        CAST(FORMAT(@CurrentDate, 'yyyyMMdd') AS int),
        @CurrentDate,
        NULL,
        @MonthName,
        @MonthAbbreviation,
        CASE WHEN DATEPART(WEEKDAY, @CurrentDate) NOT IN (1, 7) THEN 1 ELSE 0 END,
        GETDATE(),
        'User1'
    );

    SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate);
END;


INSERT INTO [DimTime] (TimeID, Time, TimeOfDaySegment, JobLoadDate, JobLoadUser)
VALUES
(1, '00:00:00', 'Midnight', GETDATE(), 'ETL'),
(2, '01:00:00', 'Early Morning', GETDATE(), 'ETL'),
(3, '02:00:00', 'Early Morning', GETDATE(), 'ETL'),
(4, '03:00:00', 'Early Morning', GETDATE(), 'ETL'),
(5, '04:00:00', 'Early Morning', GETDATE(), 'ETL'),
(6, '05:00:00', 'Morning', GETDATE(), 'ETL'),
(7, '06:00:00', 'Morning', GETDATE(), 'ETL'),
(8, '07:00:00', 'Morning', GETDATE(), 'ETL'),
(9, '08:00:00', 'Morning', GETDATE(), 'ETL'),
(10, '09:00:00', 'Late Morning', GETDATE(), 'ETL'),
(11, '10:00:00', 'Late Morning', GETDATE(), 'ETL'),
(12, '11:00:00', 'Late Morning', GETDATE(), 'ETL'),
(13, '12:00:00', 'Noon', GETDATE(), 'ETL'),
(14, '13:00:00', 'Afternoon', GETDATE(), 'ETL'),
(15, '14:00:00', 'Afternoon', GETDATE(), 'ETL'),
(16, '15:00:00', 'Afternoon', GETDATE(), 'ETL'),
(17, '16:00:00', 'Late Afternoon', GETDATE(), 'ETL'),
(18, '17:00:00', 'Late Afternoon', GETDATE(), 'ETL'),
(19, '18:00:00', 'Late Afternoon', GETDATE(), 'ETL'),
(20, '19:00:00', 'Evening', GETDATE(), 'ETL'),
(21, '20:00:00', 'Evening', GETDATE(), 'ETL'),
(22, '21:00:00', 'Evening', GETDATE(), 'ETL'),
(23, '22:00:00', 'Night', GETDATE(), 'ETL'),
(24, '23:00:00', 'Night', GETDATE(), 'ETL');


-- Insert 5000 rows of sample data into FactCall
DECLARE @Counter int = 1;
DECLARE @CustomerID int;
DECLARE @DateID int;
DECLARE @TalkTime int;
DECLARE @WaitTime int;
DECLARE @Team int;
DECLARE @AgentID int;

-- Loop to insert 3000 rows
WHILE @Counter <= 5000
BEGIN
    -- Generate random values within the specified ranges
    SET @CustomerID = (CAST(RAND() * 20 AS int) + 1);
    SET @DateID = (CAST(RAND() * 308 AS int) + 20230101); -- Assuming 308 days from '2023-01-01' to '2023-11-08'
    SET @TalkTime = (CAST(RAND() * 791 AS int) + 10);     -- Range between 10 and 800
    SET @WaitTime = (CAST(RAND() * 791 AS int) + 10);     -- Range between 10 and 800
    SET @Team = (CAST(RAND() * 8 AS int) + 1);            -- Range between 1 and 8
    SET @AgentID = (CAST(RAND() * 8 AS int) + 1001);      -- Range between 1001 and 1008

    -- Insert the row with the generated values
    INSERT INTO [FactCall] (CallID, CustomerID, AgentID, CallTypeID, DateID, TimeID, TalkTime, WaitTime, JobLoadDate, JobLoadUser)
    VALUES (@Counter, @CustomerID, @AgentID, @Counter % 4 + 1, @DateID, @Counter % 24 + 1, @TalkTime, @WaitTime, GETDATE(), 'User1');
    
    -- Increment the counter
    SET @Counter = @Counter + 1;
END;