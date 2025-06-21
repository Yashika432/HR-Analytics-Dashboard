create database hr_analyticss;
use hr_analyticss;

SELECT * FROM `copy of hr_1`;
select * from `copy of hr_2`;

RENAME TABLE  `copy of hr_1` TO HR_1;
RENAME TABLE  `copy of hr_2` TO HR_2;
 
select * from HR_1;
select * from HR_2;
-- 1. Average Attrition rate for all Departments
select department,
avg(CASE when Attrition = "Yes" then 1 else 0 End) as Avg_Attrition
FROM HR_1
GROUP BY  department;

-- 2.Average Hourly rate of Male Research Scientist
SELECT AVG(HourlyRate) AS Avg_Hourly_Rate
FROM HR_1
WHERE Gender = 'Male' AND JobRole = 'Research Scientist';

-- 3.Attrition rate Vs Monthly income stats
SELECT h1.Attrition, 
       AVG(h2.MonthlyIncome) AS Avg_Monthly_Income
FROM HR_1 h1
JOIN HR_2 h2 ON h1.EmployeeNumber = h2.`Employee ID`
GROUP BY h1.Attrition;

-- 4.Average working years for each Department
SELECT H1.DEPARTMENT,
AVG(H2.TotalWorkingYears) as Avg_Working_Years
from HR_1 H1
join HR_2 H2 ON H1.EmployeeNumber = H2.`Employee ID`
Group BY H1.Department;

-- 5. Job Role Vs Work-life balance
SELECT h1.JobRole,
Avg(h2.WorkLifeBalance) AS Avg_Work_Life_Balance
FROM HR_1 h1
JOIN HR_2 h2 on h1.EmployeeNumber = h2.`Employee ID`
Group by h1.jobrole;

-- 6. Attrition rate Vs Year since last promotion relation
select h1.Attrition,
 avg(h2.YearsSinceLastPromotion) AS Avg_Years_Since_Promotion
from HR_1 h1
JOIN HR_2 H2 ON h1.EmployeeNumber = h2.`Employee ID`
Group by h1.Attrition;













































