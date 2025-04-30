# Attrition and Retention
#1. What is the attrition rate across the entire organization?
SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM hr_employee_attrition) AS attrition_rate FROM hr_employee_attrition
WHERE Attrition = 'Yes';

# 2.What is the attrition rate by department?
SELECT Department, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM hr_employee_attrition) AS attrition_rate FROM hr_employee_attrition
WHERE Attrition = 'Yes' GROUP BY Department;

# 3. What percentage of employees left the company within their first year?
SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM hr_employee_attrition) AS first_year_attrition FROM hr_employee_attrition
WHERE Attrition = 'Yes' AND YearsAtCompany < 1;

# Employee Demographics
# 1.What is the average age of employees in each department?
SELECT Department, AVG(Age) AS average_age FROM hr_employee_attrition
GROUP BY Department;

# 2.How many male and female employees are in each job role?
SELECT JobRole, Gender, COUNT(*) AS employee_count FROM hr_employee_attrition 
GROUP BY JobRole, Gender;

# 3.What percentage of employees in each marital status group left the company?
SELECT MaritalStatus, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM hr_employee_attrition) 
AS attrition_rate FROM hr_employee_attrition
WHERE Attrition = 'Yes'GROUP BY MaritalStatus;

# Compensation and Benefits
# 1.What is the average monthly income by department?
SELECT Department, AVG(MonthlyIncome) AS avg_income FROM hr_employee_attrition
GROUP BY Department;

# 2.How does the stock option level vary across departments?
SELECT Department, AVG(StockOptionLevel) AS avg_stock_options FROM hr_employee_attrition
GROUP BY Department;

#3.What is the average salary hike percentage by performance rating?
SELECT PerformanceRating, AVG(PercentSalaryHike) AS avg_salary_hike FROM hr_employee_attrition
GROUP BY PerformanceRating;

# Performance and Satisfaction
#1. What is the average job satisfaction level by department?
SELECT Department, AVG(JobSatisfaction) AS avg_job_satisfaction FROM hr_employee_attrition
GROUP BY Department;

#2. How many employees with high job satisfaction left the company?
SELECT COUNT(*) AS high_satisfaction_attrition FROM hr_employee_attrition
WHERE Attrition = 'Yes' AND JobSatisfaction >= 4;

#3. What percentage of employees report a high work-life balance?
SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM hr_employee_attrition) AS high_work_life_balance FROM hr_employee_attrition
WHERE WorkLifeBalance >= 4;

# Training and Development
#1. What is the average training time by department?
SELECT Department, AVG(TrainingTimesLastYear) AS avg_training_time FROM hr_employee_attrition 
GROUP BY Department;

#2. How many employees received no training in the last year?
SELECT COUNT(*) AS no_training_employees FROM hr_employee_attrition
WHERE TrainingTimesLastYear = 0;

#3. What is the attrition rate for employees who received no training?
SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM hr_employee_attrition WHERE TrainingTimesLastYear = 0) AS no_training_attrition FROM hr_employee_attrition 
WHERE Attrition = 'Yes' AND TrainingTimesLastYear = 0;

# Experience and Tenure
#1. What is the average tenure by job role?
SELECT JobRole, AVG(YearsAtCompany) AS avg_tenure FROM hr_employee_attrition
GROUP BY JobRole;

#2.How many employees have not been promoted in the last 5 years?
SELECT COUNT(*) AS no_promotion_employees FROM hr_employee_attrition
WHERE YearsSinceLastPromotion >= 5;

#3. What is the average number of years employees have worked with their current manager?
SELECT AVG(YearsWithCurrManager) AS avg_years_with_manager FROM hr_employee_attrition;

# Travel and Commute
#1. What is the attrition rate by frequency of business travel?
SELECT BusinessTravel, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM hr_employee_attrition WHERE BusinessTravel IS NOT NULL) AS attrition_rate 
FROM hr_employee_attrition
WHERE Attrition = 'Yes' GROUP BY BusinessTravel;

#2. What is the average distance from home by department for employees who left?
SELECT Department, AVG(DistanceFromHome) AS avg_distance FROM hr_employee_attrition
WHERE Attrition = 'Yes' GROUP BY Department;