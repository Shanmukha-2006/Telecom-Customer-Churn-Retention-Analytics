create database telecom_churn;
use telecom_churn;
show tables;
SELECT *
FROM `wa_fn-usec_-telco-customer-churn`
LIMIT 10;

RENAME TABLE `wa_fn-usec_-telco-customer-churn`
TO telco_customer_churn;

#View the dataset
SELECT *
FROM telco_customer_churn
LIMIT 10;

# Total number of customers
SELECT COUNT(DISTINCT customerID) AS total_customers
FROM telco_customer_churn;

# Total churned customers
SELECT COUNT(*) AS churned_customers
FROM telco_customer_churn
WHERE Churn = 'Yes';

# Total retained customers
SELECT COUNT(*) AS retained_customers
FROM telco_customer_churn
WHERE Churn = 'No';

#Overall churn rate
SELECT
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telco_customer_churn;

#Overall retention rate
SELECT
    ROUND(
        SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS retention_rate_percentage
FROM telco_customer_churn;

#Churn distribution
SELECT
    Churn,
    COUNT(*) AS total_customers
FROM telco_customer_churn
GROUP BY Churn;

#Churn by contract type
SELECT
    Contract,
    Churn,
    COUNT(*) AS total_customers
FROM telco_customer_churn
GROUP BY Contract, Churn
ORDER BY Contract;

#Churn rate by contract type

#This is one of the most important queries for your project.

SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_customer_churn
GROUP BY Contract
ORDER BY churn_rate DESC;


# Churn by tenure group

#If you created TenureGroup in Python:

SELECT
    CASE
        WHEN tenure <= 12 THEN '0-1 Year'
        WHEN tenure <= 24 THEN '1-2 Years'
        WHEN tenure <= 48 THEN '2-4 Years'
        ELSE '4+ Years'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM telco_customer_churn
GROUP BY tenure_group
ORDER BY churned_customers DESC;


# Churn rate by tenure group
SELECT
    CASE
        WHEN tenure <= 12 THEN '0-1 Year'
        WHEN tenure <= 24 THEN '1-2 Years'
        WHEN tenure <= 48 THEN '2-4 Years'
        ELSE '4+ Years'
    END AS tenure_group,

    COUNT(*) AS total_customers,

    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS churn_rate

FROM telco_customer_churn

GROUP BY tenure_group

ORDER BY churn_rate DESC;

# Churn by payment method
SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_customer_churn
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;


# Churn by internet service
SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_customer_churn
GROUP BY InternetService
ORDER BY churn_rate DESC;


# Average monthly charges by churn status
SELECT
    Churn,
    ROUND(AVG(MonthlyCharges), 2)
        AS average_monthly_charges
FROM telco_customer_churn
GROUP BY Churn;


#Average total charges by churn status
SELECT
    Churn,
    ROUND(AVG(TotalCharges), 2)
        AS average_total_charges
FROM telco_customer_churn
GROUP BY Churn;


# Average tenure of churned vs retained customers
SELECT
    Churn,
    ROUND(AVG(tenure), 2) AS average_tenure
FROM telco_customer_churn
GROUP BY Churn;

# Churn by gender
SELECT
    gender,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_customer_churn
GROUP BY gender;


# Churn by senior citizen status
SELECT
    SeniorCitizen,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_customer_churn
GROUP BY SeniorCitizen;


# Churn by tech support
SELECT
    TechSupport,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_customer_churn
GROUP BY TechSupport
ORDER BY churn_rate DESC;


# Churn by online security
SELECT
    OnlineSecurity,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_customer_churn
GROUP BY OnlineSecurity
ORDER BY churn_rate DESC;


# Churn by paperless billing
SELECT
    PaperlessBilling,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_customer_churn
GROUP BY PaperlessBilling
ORDER BY churn_rate DESC;


# Top 10 customers by total charges
SELECT
    customerID,
    tenure,
    Contract,
    MonthlyCharges,
    TotalCharges,
    Churn
FROM telco_customer_churn
ORDER BY TotalCharges DESC
LIMIT 10;


# High-value churned customers
SELECT
    customerID,
    tenure,
    Contract,
    MonthlyCharges,
    TotalCharges,
    PaymentMethod
FROM telco_customer_churn
WHERE Churn = 'Yes'
  AND TotalCharges > (
      SELECT AVG(TotalCharges)
      FROM telco_customer_churn
  )
ORDER BY TotalCharges DESC;

#This query demonstrates a subquery.

# Rank contract types by churn rate
WITH contract_analysis AS
(
    SELECT
        Contract,
        COUNT(*) AS total_customers,
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
            AS churned_customers,
        ROUND(
            SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
            * 100.0 / COUNT(*),
            2
        ) AS churn_rate
    FROM telco_customer_churn
    GROUP BY Contract
)

SELECT
    Contract,
    total_customers,
    churned_customers,
    churn_rate,
    RANK() OVER (
        ORDER BY churn_rate DESC
    ) AS churn_risk_rank
FROM contract_analysis;

#This demonstrates CTE + Window Function + RANK().

# 25. Create customer risk categories

#This is a useful business-analysis query for your project:

SELECT
    customerID,
    tenure,
    Contract,
    MonthlyCharges,
    InternetService,
    Churn,
    CASE
        WHEN tenure <= 12
             AND Contract = 'Month-to-month'
             AND MonthlyCharges >= 70
        THEN 'High Risk'

        WHEN tenure <= 24
             OR Contract = 'Month-to-month'
        THEN 'Medium Risk'

        ELSE 'Low Risk'
    END AS customer_risk
FROM telco_customer_churn;