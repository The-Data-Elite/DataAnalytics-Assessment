SELECT 
    adashi_staging.user.id AS owner_id,
    CONCAT(user.first_name, ' ', user.last_name) AS name,
     # using coalesce to return '0' instead of NULL for missing values
    COALESCE(s.savings_count, 0) AS savings_count,
    COALESCE(p.investment_count, 0) AS investment_count,
    COALESCE(s.savings_total, 0) + COALESCE(p.investment_total, 0) AS total_deposits
FROM adashi_staging.users_customuser AS user
LEFT JOIN (
    SELECT owner_id, 
           COUNT(*) AS savings_count,
           SUM(amount) AS savings_total
    FROM adashi_staging.savings_savingsaccount
    WHERE amount > 0
    GROUP BY owner_id) AS s ON user.id = s.owner_id
JOIN (
    SELECT owner_id,
           COUNT(*) AS investment_count,
           SUM(amount) AS investment_total
    FROM adashi_staging.plans_plan
    WHERE amount > 0 AND is_a_fund = 1
    GROUP BY owner_id
) p ON user.id = p.owner_id
ORDER BY total_deposits DESC;
