SELECT
  adashi_staging.u.id AS customer_id,
  # joining first name and last name 
  CONCAT(adashi_staging.u.first_name, ' ', adashi_staging.u.last_name) AS name,
  TIMESTAMPDIFF(MONTH, adashi_staging.u.date_joined, CURDATE()) AS tenure_months,
  COUNT(adashi_staging.s.savings_id) AS total_transactions,
  ROUND(
    (COUNT(adashi_staging.s.savings_id) / NULLIF(TIMESTAMPDIFF(MONTH, adashi_staging.u.date_joined, CURDATE()), 0)) * 12 *
    AVG(s.amount) * 0.001, 2) AS estimated_clv
FROM adashi_staging.users_customuser u
LEFT JOIN adashi_staging.savings_savingsaccount s ON adashi_staging.s.owner_id = u.id
GROUP BY adashi_staging.u.id, adashi_staging.u.first_name, adashi_staging.u.last_name, adashi_staging.u.date_joined
ORDER BY estimated_clv DESC;
