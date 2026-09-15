-- Question 1
-- Explore the Dataset
SELECT * 
FROM ESportsPrefromance; 

SELECT COUNT(*) As NumberOfPlayers
FROM ESportsPrefromance; 

SELECT DISTINCT Game_Genre  
FROM ESportsPrefromance; 

-- Question 2
-- The Famous Game Category
SELECT Game_Genre AS game_category,
       CONCAT(CAST( ROUND(
                   COUNT(Player_ID) * 100.0 / 
                   SUM(COUNT(Player_ID)) OVER (), 
                   2 ) AS DECIMAL(5,2)
			   ),'%' ) AS PercentageOfPlayers
FROM ESportsPrefromance 
GROUP BY Game_Genre  
ORDER BY COUNT(Player_ID) DESC;

-- Question 3
-- Which Game Category Requires More Actions Per Minute?
SELECT Game_Genre AS GameCategory,  
       AVG(APM) AS Average_APM ,
       CONCAT( CAST(
               ROUND( COUNT(Match_Outcome) * 100.0 / 
                   SUM(COUNT(Match_Outcome)) OVER (), 
                   2 ) AS DECIMAL(5,2) ),'%'
				   ) AS Win_Percentage
FROM ESportsPrefromance 
WHERE Match_Outcome = 'Win' 
GROUP BY Game_Genre  
ORDER BY AVG(APM) DESC;

-- Question 4
-- Which Game Category Requires Faster Reaction Time?
SELECT Game_Genre AS GameCategory,  
       AVG(Reaction_Time_ms) AS SpeedOfReactions
FROM ESportsPrefromance  
GROUP BY Game_Genre  
ORDER BY AVG(Reaction_Time_ms); 

-- Question 5
-- The Relationship Between Sleeping Hours and Winning
WITH SleepGroups AS (
    SELECT *,
        CASE
            WHEN Sleep_Hours < 5 THEN 'Less than 5 Hours'
            WHEN Sleep_Hours < 6 THEN '5 - 6 Hours'
            WHEN Sleep_Hours < 7 THEN '6 - 7 Hours'
            WHEN Sleep_Hours < 8 THEN '7 - 8 Hours'
            ELSE '8+ Hours'
        END AS Sleeping_Hours
    FROM ESportsPrefromance)
SELECT Sleeping_Hours,
    CONCAT(CAST(ROUND(COUNT(*) * 100.0 / 250000, 2)
        AS DECIMAL(5,2)), '%') AS Players_Percentage,
    CONCAT(CAST(ROUND(
        SUM(CASE WHEN Match_Outcome = 'Win'
        THEN 1 ELSE 0 END) * 100.0 / 250000, 2)
        AS DECIMAL(5,2)), '%') AS Wins_Percentage
FROM SleepGroups
GROUP BY Sleeping_Hours
ORDER BY 
    SUM(CASE WHEN Match_Outcome = 'Win' THEN 1 ELSE 0 END) DESC; 

-- Question 6
-- The Relationship Between Energy Drinks and Winning
SELECT 
    Energy_Drinks,
    CONCAT(
        CAST(ROUND(COUNT(*) * 100.0 / 250000, 2)
        AS DECIMAL(5,2)), '%' ) AS Players_Percentage,
    CONCAT( CAST(ROUND(
            SUM(CASE WHEN Match_Outcome = 'Win'
            THEN 1 ELSE 0 END) * 100.0 / 250000, 2)
        AS DECIMAL(5,2)), '%' ) AS Wins_Percentage
FROM ESportsPrefromance
GROUP BY Energy_Drinks
ORDER BY 
   SUM(CASE WHEN Match_Outcome = 'Win' THEN 1 ELSE 0 END) DESC;

--Question 7
--Which players consume the most energy drinks?
SELECT CASE
        WHEN Age < 20 THEN 'Under 20'
        WHEN Age < 25 THEN '20 - 24'
        WHEN Age < 30 THEN '25 - 29'
        ELSE '30+'
    END AS Age_Group,
    Energy_Drinks,
    CONCAT(CAST(ROUND(COUNT(*) * 100.0 / 250000, 2)
        AS DECIMAL(5,2)), '%') AS Players_Percentage
FROM ESportsPrefromance
WHERE Energy_Drinks IN (3, 4)
GROUP BY CASE WHEN Age < 20 THEN 'Under 20'
              WHEN Age < 25 THEN '20 - 24'
        WHEN Age < 30 THEN '25 - 29'
        ELSE '30+' END,
    Energy_Drinks
ORDER BY COUNT(*) DESC;


-- Question 8
-- The Relationship Between Energy Drinks and Heart Rate
SELECT  
    Energy_Drinks, 
    CONCAT(
        CAST(ROUND(COUNT(*) * 100.0 / 250000, 2)
        AS DECIMAL(5,2)), '%'
    ) AS Players_Percentage,
    AVG(Heart_Rate_BPM) AS Average_Heart_Rate 
FROM ESportsPrefromance  
GROUP BY Energy_Drinks 
ORDER BY Energy_Drinks DESC;


-- Question 9
-- The Relationship Between Screen Brightness , BlueLight Filter and Winning
SELECT CASE WHEN Screen_Brightness < 25 THEN 'Low Brightness'
        WHEN Screen_Brightness < 50 THEN 'Medium-Low Brightness'
        WHEN Screen_Brightness < 75 THEN 'Medium-High Brightness'
        ELSE 'High Brightness'  END AS Brightness_Group,
    CONCAT( CAST(ROUND(COUNT(*) * 100.0 / 250000, 2)
        AS DECIMAL(5,2)), '%' ) AS Players_Percentage,
    CONCAT( CAST(ROUND(
            SUM(CASE WHEN Match_Outcome = 'Win'
            THEN 1 ELSE 0 END) * 100.0 / 250000, 2)
        AS DECIMAL(5,2)), '%' ) AS Wins_Percentage,
    CONCAT(  CAST(ROUND(
            SUM(CASE WHEN Blue_Light_Filter = 1
            THEN 1 ELSE 0 END) * 100.0 / 250000, 2)
        AS DECIMAL(5,2)), '%') AS Blue_Light_Users_Percentage
FROM ESportsPrefromance
GROUP BY CASE WHEN Screen_Brightness < 25 THEN 'Low Brightness'
        WHEN Screen_Brightness < 50 THEN 'Medium-Low Brightness'
        WHEN Screen_Brightness < 75 THEN 'Medium-High Brightness'
        ELSE 'High Brightness'  END
ORDER BY 
    SUM(CASE WHEN Match_Outcome = 'Win' THEN 1 ELSE 0 END) DESC;

-- Question 10
-- The Relationship Between Play Time and Player Actions
SELECT CASE WHEN PlayTime_Hours < 1 THEN 'Less than 1 Hour' 
         WHEN PlayTime_Hours < 2 THEN '1 - 2 Hours' 
         WHEN PlayTime_Hours < 3 THEN '2 - 3 Hours' 
         WHEN PlayTime_Hours < 4 THEN '3 - 4 Hours' 
    ELSE '4+ Hours'   END AS PlayTime_Group, 
	CONCAT( CAST(ROUND(COUNT(*) * 100.0 / 250000, 2)
           AS DECIMAL(5,2)), '%' ) AS Players_Percentage ,
    CONCAT( CAST(ROUND(
            SUM(CASE WHEN Match_Outcome = 'Win' THEN 1 ELSE 0 END)
            * 100.0 / 250000, 2 ) AS DECIMAL(5,2)), '%'
              ) AS Wins_Percentage,
    AVG(APM) AS Average_APM, 
    Round(AVG(Reaction_Time_ms) , 2) AS AverageOfReactionTime 
FROM ESportsPrefromance 
GROUP BY  CASE 
        WHEN PlayTime_Hours < 1 THEN 'Less than 1 Hour' 
        WHEN PlayTime_Hours < 2 THEN '1 - 2 Hours' 
        WHEN PlayTime_Hours < 3 THEN '2 - 3 Hours' 
        WHEN PlayTime_Hours < 4 THEN '3 - 4 Hours' 
        ELSE '4+ Hours' END 
ORDER BY Average_APM DESC;
