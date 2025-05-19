SELECT
  frequency_category,
  COUNT(*) AS customer_count,
  ROUND(AVG(avg_transactions), 1) AS avg_transactions_per_month
FROM (
  SELECT
    adashi_staging.u.id AS owner_id,
    COALESCE(
      COUNT(s.id) / GREATEST(
        TIMESTAMPDIFF(MONTH, MIN(adashi_staging.s.transaction_date), MAX(adashi_staging.s.transaction_date)), 1
      ), 0
    ) AS avg_transactions,
    CASE
      WHEN COUNT(s.id) / GREATEST(
             TIMESTAMPDIFF(MONTH, MIN(adashi_staging.s.transaction_date), MAX(adashi_staging.s.transaction_date)), 1
           ) >= 10 THEN 'High Frequency'
      WHEN COUNT(s.id) / GREATEST(
             TIMESTAMPDIFF(MONTH, MIN(adashi_staging.s.transaction_date), MAX(adashi_staging.s.transaction_date)), 1
           ) BETWEEN 3 AND 9 THEN 'Medium Frequency'
      ELSE 'Low Frequency'
    END AS frequency_category
  FROM adashi_staging.users_customuser AS u
  LEFT JOIN adashi_staging.savings_savingsaccount AS s ON adashi_staging.u.id = adashi_staging.s.owner_id
  GROUP BY adashi_staging.u.id
) AS customer_freq
GROUP BY frequency_category
ORDER BY 
  CASE frequency_category
    WHEN 'High Frequency' THEN 1
    WHEN 'Medium Frequency' THEN 2
    WHEN 'Low Frequency' THEN 3
  END;
