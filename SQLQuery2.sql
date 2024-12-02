
USE f1;

-- 1. Teams Table
CREATE TABLE Teams (
    TeamID INT IDENTITY(1,1) PRIMARY KEY,
    TeamName VARCHAR(100) NOT NULL,
    BaseCountry VARCHAR(100),
    FoundedYear INT,
	Points INT,
    PrincipalName VARCHAR(100)
);

-- Insert into teams table

INSERT INTO Teams (TeamName, BaseCountry, FoundedYear, PrincipalName)
VALUES
    ('Red Bull Racing', 'Austria', 2005, 'Christian Horner'),
    ('Mercedes-AMG Petronas', 'Germany', 2010, 'Toto Wolff'),
    ('Ferrari', 'Italy', 1929, 'Fred Vasseur'),
    ('McLaren', 'United Kingdom', 1963, 'Andrea Stella'),
    ('Aston Martin', 'United Kingdom', 1959, 'Mike Krack'),
    ('Alpine', 'France', 1981, 'Bruno Famin'),
    ('AlphaTauri', 'Italy', 2020, 'Franz Tost'),
    ('Alfa Romeo', 'Switzerland', 1950, 'Alessandro Alunni Bravi'),
    ('Haas', 'United States', 2016, 'Guenther Steiner'),
    ('Williams', 'United Kingdom', 1977, 'James Vowles');

SELECT * FROM Teams;

-- 2. Drivers Table
CREATE TABLE Drivers (
    DriverID INT IDENTITY(1,1) PRIMARY KEY,
    DriverName VARCHAR(100) NOT NULL,
    Age INT,
    Nationality VARCHAR(100),
    TeamID INT,
    Points INT,
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID) ON DELETE CASCADE
);


-- CREATING AN AUDIT TABLE

CREATE TABLE DriversAudit (					-
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    DriverID INT,
    DriverName NVARCHAR(100),
    Age INT,
    Nationality NVARCHAR(100),
    TeamID INT,
    Points INT,
    ActionType NVARCHAR(10), -- 'INSERT', 'UPDATE', 'DELETE'
    ChangeDate DATETIME DEFAULT GETDATE()
);


-- Insert into drivers table

INSERT INTO Drivers (DriverName, Age, Nationality, TeamID, Points)
VALUES
    ('Max Verstappen', 26, 'Netherlands', 1, 440),
    ('Sergio Perez', 34, 'Mexico', 1, 220),
    ('Lewis Hamilton', 39, 'United Kingdom', 2, 355),
    ('George Russell', 25, 'United Kingdom', 2, 230),
    ('Charles Leclerc', 26, 'Monaco', 3, 285),
    ('Carlos Sainz', 29, 'Spain', 3, 270),
    ('Lando Norris', 24, 'United Kingdom', 4, 215),
    ('Oscar Piastri', 23, 'Australia', 4, 195),
    ('Fernando Alonso', 43, 'Spain', 5, 180),
    ('Lance Stroll', 25, 'Canada', 5, 120),
    ('Esteban Ocon', 28, 'France', 6, 85),
    ('Pierre Gasly', 28, 'France', 6, 90),
    ('Yuki Tsunoda', 24, 'Japan', 7, 45),
    ('Daniel Ricciardo', 35, 'Australia', 7, 30),
    ('Valtteri Bottas', 34, 'Finland', 8, 60),
    ('Zhou Guanyu', 25, 'China', 8, 25),
    ('Kevin Magnussen', 32, 'Denmark', 9, 35),
    ('Nico Hulkenberg', 37, 'Germany', 9, 40),
    ('Alex Albon', 28, 'Thailand', 10, 50),
    ('Logan Sargeant', 23, 'United States', 10, 15);

SELECT * FROM Drivers;

-- 3. Circuits Table
CREATE TABLE Circuits (
    CircuitID INT IDENTITY(1,1) PRIMARY KEY,
    CircuitName VARCHAR(100),
    Location VARCHAR(100),
    Length FLOAT
);

-- Insert into Circuits table

INSERT INTO Circuits (CircuitName, Location, Length)
VALUES
    ('Bahrain International Circuit', 'Sakhir, Bahrain', 5.412),
    ('Jeddah Corniche Circuit', 'Jeddah, Saudi Arabia', 6.174),
    ('Albert Park Circuit', 'Melbourne, Australia', 5.303),
    ('Baku City Circuit', 'Baku, Azerbaijan', 6.003),
    ('Miami International Autodrome', 'Miami, USA', 5.412),
    ('Circuit de Monaco', 'Monte Carlo, Monaco', 3.337),
    ('Circuit de Barcelona-Catalunya', 'Barcelona, Spain', 4.675),
    ('Circuit Gilles Villeneuve', 'Montreal, Canada', 4.361),
    ('Red Bull Ring', 'Spielberg, Austria', 4.318),
    ('Silverstone Circuit', 'Silverstone, UK', 5.891),
    ('Hungaroring', 'Mogyor�d, Hungary', 4.381),
    ('Spa-Francorchamps', 'Stavelot, Belgium', 7.004),
    ('Circuit Zandvoort', 'Zandvoort, Netherlands', 4.259),
    ('Monza', 'Monza, Italy', 5.793),
    ('Marina Bay Street Circuit', 'Singapore', 5.063),
    ('Suzuka International Racing Course', 'Suzuka, Japan', 5.807),
    ('Losail International Circuit', 'Doha, Qatar', 5.419),
    ('Circuit of the Americas', 'Austin, USA', 5.513),
    ('Autodromo Hermanos Rodriguez', 'Mexico City, Mexico', 4.304),
    ('Interlagos', 'Sao Paulo, Brazil', 4.309);

SELECT * FROM Circuits;

-- 4. Races Table

CREATE TABLE Races (
    RaceID INT IDENTITY(1,1) PRIMARY KEY,
    RaceName VARCHAR(100) NOT NULL,
    RaceDate DATE,
    CircuitID INT,
    FOREIGN KEY (CircuitID) REFERENCES Circuits(CircuitID) ON DELETE CASCADE
);

-- Insert into races table

INSERT INTO Races (RaceName, RaceDate, CircuitID)
VALUES
    ('Bahrain Grand Prix', '2024-03-03', 1),
    ('Saudi Arabian Grand Prix', '2024-03-17', 2),
    ('Australian Grand Prix', '2024-03-31', 3),
    ('Azerbaijan Grand Prix', '2024-04-28', 4),
    ('Miami Grand Prix', '2024-05-05', 5),
    ('Monaco Grand Prix', '2024-05-26', 6),
    ('Spanish Grand Prix', '2024-06-09', 7),
    ('Canadian Grand Prix', '2024-06-16', 8),
    ('Austrian Grand Prix', '2024-06-30', 9),
    ('British Grand Prix', '2024-07-07', 10),
    ('Hungarian Grand Prix', '2024-07-21', 11),
    ('Belgian Grand Prix', '2024-08-04', 12),
    ('Dutch Grand Prix', '2024-08-25', 13),
    ('Italian Grand Prix', '2024-09-08', 14),
    ('Singapore Grand Prix', '2024-09-22', 15),
    ('Japanese Grand Prix', '2024-09-29', 16),
    ('Qatar Grand Prix', '2024-10-13', 17),
    ('United States Grand Prix', '2024-10-20', 18),
    ('Mexican Grand Prix', '2024-10-27', 19),
    ('Brazilian Grand Prix', '2024-11-10', 20);

SELECT * FROM Races;

-- 5. Constructors Table

CREATE TABLE Constructors (
    ConstructorID INT IDENTITY(1,1) PRIMARY KEY,
    ConstructorName VARCHAR(100),
    Headquarters VARCHAR(100),
    TeamID INT,
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID) ON DELETE CASCADE);

INSERT INTO Constructors (ConstructorName, Headquarters, TeamID)
VALUES
    ('Red Bull Racing', 'Milton Keynes, UK', 1),
    ('Mercedes', 'Brackley, UK', 2),
    ('Ferrari', 'Maranello, Italy', 3),
    ('McLaren', 'Woking, UK', 4),
    ('Aston Martin', 'Silverstone, UK', 5),
    ('Alpine', 'Enstone, UK', 6),
    ('AlphaTauri', 'Faenza, Italy', 7),
    ('Alfa Romeo', 'Hinwil, Switzerland', 8),
    ('Haas', 'Kannapolis, USA', 9),
    ('Williams', 'Grove, UK', 10);


SELECT * FROM Constructors;

-- 6. Race Results Table

CREATE TABLE RaceResults (
    ResultID INT IDENTITY(1,1) PRIMARY KEY,
    RaceID INT,
    DriverID INT,
    ConstructorID INT,
    Position INT,
    Points INT,
    FOREIGN KEY (RaceID) REFERENCES Races(RaceID) ON DELETE CASCADE,
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID) ON DELETE NO ACTION,
    FOREIGN KEY (ConstructorID) REFERENCES Constructors(ConstructorID) ON DELETE NO ACTION
);


INSERT INTO RaceResults (RaceID, DriverID, ConstructorID, Position, Points)
VALUES
    (1, 1, 1, 1, 25),  -- Max Verstappen wins
    (1, 3, 2, 2, 18),  -- Lewis Hamilton 2nd
    (1, 2, 1, 3, 15),  -- Sergio Perez 3rd
    (1, 4, 2, 4, 12),
    (1, 5, 3, 5, 10),
    (1, 6, 3, 6, 8),
    (1, 7, 4, 7, 6),
    (1, 8, 4, 8, 4),
    (1, 9, 5, 9, 2),
    (1, 10, 5, 10, 1),
    (1, 11, 6, 11, 0),
    (1, 12, 6, 12, 0),
    (1, 13, 7, 13, 0),
    (1, 14, 7, 14, 0),
    (1, 15, 8, 15, 0),
    (1, 16, 8, 16, 0),
    (1, 17, 9, 17, 0),
    (1, 18, 9, 18, 0),
    (1, 19, 10, 19, 0),
    (1, 20, 10, 20, 0);

select * from RaceResults

-- 7. Driver Standing
CREATE TABLE DriverStandings (
    StandingsID INT IDENTITY(1,1) PRIMARY KEY,
    DriverID INT, -- Foreign key linking to Drivers
    SeasonYear INT,
    Points INT, -- Cumulative points
    Position INT, -- Rank in the standings
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID) ON DELETE CASCADE
);


CREATE TRIGGER trg_UpdateDriverStandings
ON RaceResults
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE DriverStandings
    SET Points = (SELECT SUM(Points) FROM RaceResults WHERE RaceResults.DriverID = DriverStandings.DriverID),
        Position = RANK() OVER (ORDER BY Points DESC)
    WHERE DriverID IN (SELECT DISTINCT DriverID FROM INSERTED);
END;

INSERT INTO DriverStandings (DriverID, SeasonYear, Points, Position)
VALUES
    (1, 2024, 440, 1),  -- Max Verstappen
    (3, 2024, 355, 2),  -- Lewis Hamilton
    (2, 2024, 220, 3),  -- Sergio Perez
    (4, 2024, 230, 4),  -- George Russell
    (5, 2024, 285, 5),  -- Charles Leclerc
    (6, 2024, 270, 6),  -- Carlos Sainz
    (7, 2024, 215, 7),  -- Lando Norris
    (8, 2024, 195, 8),  -- Oscar Piastri
    (9, 2024, 180, 9),  -- Fernando Alonso
    (10, 2024, 120, 10), -- Lance Stroll
    (12, 2024, 90, 11),  -- Pierre Gasly
    (11, 2024, 85, 12),  -- Esteban Ocon
    (15, 2024, 60, 13),  -- Valtteri Bottas
    (18, 2024, 40, 14),  -- Nico Hulkenberg
    (17, 2024, 35, 15),  -- Kevin Magnussen
    (16, 2024, 25, 16),  -- Zhou Guanyu
    (13, 2024, 45, 17),  -- Yuki Tsunoda
    (14, 2024, 30, 18),  -- Daniel Ricciardo
    (19, 2024, 50, 19),  -- Alex Albon
    (20, 2024, 15, 20);  -- Logan Sargeant


SELECT * FROM Drivers;

-- 8. Season Standings Table
CREATE TABLE SeasonStandings (
    StandingsID INT IDENTITY(1,1) PRIMARY KEY,
    SeasonYear INT,
    DriverID INT,
    Points INT,
    Rank INT,
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID) ON DELETE CASCADE
);


CREATE TRIGGER trg_UpdateSeasonStandings
ON DriverStandings
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE SeasonStandings
    SET Points = DS.Points,
        Rank = DS.Position
    FROM SeasonStandings SS
    INNER JOIN DriverStandings DS ON SS.DriverID = DS.DriverID
    WHERE DS.DriverID IN (SELECT DISTINCT DriverID FROM INSERTED);
END;

INSERT INTO SeasonStandings (SeasonYear, DriverID, Points, Rank)
VALUES
    (2024, 1, 440, 1),  -- Max Verstappen
    (2024, 3, 355, 2),  -- Lewis Hamilton
    (2024, 2, 220, 3),  -- Sergio Perez
    (2024, 4, 230, 4),  -- George Russell
    (2024, 5, 285, 5),  -- Charles Leclerc
    (2024, 6, 270, 6),  -- Carlos Sainz
    (2024, 7, 215, 7),  -- Lando Norris
    (2024, 8, 195, 8),  -- Oscar Piastri
    (2024, 9, 180, 9),  -- Fernando Alonso
    (2024, 10, 120, 10), -- Lance Stroll
    (2024, 12, 90, 11),  -- Pierre Gasly
    (2024, 11, 85, 12),  -- Esteban Ocon
    (2024, 15, 60, 13),  -- Valtteri Bottas
    (2024, 18, 40, 14),  -- Nico Hulkenberg
    (2024, 17, 35, 15),  -- Kevin Magnussen
    (2024, 16, 25, 16),  -- Zhou Guanyu
    (2024, 13, 45, 17),  -- Yuki Tsunoda
    (2024, 14, 30, 18),  -- Daniel Ricciardo
    (2024, 19, 50, 19),  -- Alex Albon
    (2024, 20, 15, 20);  -- Logan Sargeant

SELECT * FROM SeasonStandings;




-- Convert 3 queries and convert to view

-- Query to retrieve driver results filtered by race and position
CREATE VIEW DriverRaceResults AS
SELECT 
    r.RaceName,
    d.DriverName,
    rr.Position,
    rr.Points
FROM 
    RaceResults rr
JOIN 
    Races r ON rr.RaceID = r.RaceID
JOIN 
    Drivers d ON rr.DriverID = d.DriverID
WHERE 
    rr.Position <= 3;  -- Example filter for top 3 positions



-- Creating a Stored Procedure 

CREATE PROCEDURE GetRaceResults
    @RaceID INT
AS
BEGIN
    SELECT 
        rr.Position, 
        d.DriverName, 
        c.ConstructorName, 
        rr.Points
    FROM 
        RaceResults rr
    JOIN 
        Drivers d ON rr.DriverID = d.DriverID
    JOIN 
        Constructors c ON rr.ConstructorID = c.ConstructorID
    WHERE 
        rr.RaceID = @RaceID;
END;

-- Execute the procedure
EXEC GetRaceResults @RaceID = 1;

-- Creating a UDF(User Defined Function) 

CREATE FUNCTION GetDriverTotalPoints (@DriverID INT)
RETURNS INT
AS
BEGIN
    DECLARE @TotalPoints INT;
    SELECT @TotalPoints = SUM(Points)
    FROM RaceResults
    WHERE DriverID = @DriverID;
    RETURN @TotalPoints;
END;

-- Use the function
SELECT dbo.GetDriverTotalPoints(1) AS TotalPoints;


-- Demonstrating how Cursor can be used here

DECLARE @DriverID INT, @DriverName NVARCHAR(100), @TotalPoints INT;

DECLARE DriverCursor CURSOR FOR
SELECT DriverID, DriverName FROM Drivers;

OPEN DriverCursor;
FETCH NEXT FROM DriverCursor INTO @DriverID, @DriverName;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @TotalPoints = dbo.GetDriverTotalPoints(@DriverID);
    PRINT 'Driver: ' + @DriverName + ', Total Points: ' + CAST(@TotalPoints AS NVARCHAR);

    FETCH NEXT FROM DriverCursor INTO @DriverID, @DriverName;
END;

CLOSE DriverCursor;
DEALLOCATE DriverCursor;



