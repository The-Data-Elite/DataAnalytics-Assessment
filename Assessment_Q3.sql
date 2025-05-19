SELECT
  plan_id,
  owner_id,
  type,
  last_transaction_date,
  inactivity_days
FROM (
  # Inactive Savings Accounts
  SELECT
    adashi_staging.s.savings_id AS plan_id,
    adashi_staging.s.owner_id,
    'Savings' AS type,
    MAX(adashi_staging.s.transaction_date) AS last_transaction_date,
    DATEDIFF(CURDATE(), MAX(adashi_staging.s.transaction_date)) AS inactivity_days
  FROM adashi_staging.savings_savingsaccount AS s
  GROUP BY adashi_staging.s.savings_id, adashi_staging.s.owner_id
  HAVING inactivity_days > 365

  UNION ALL
  
  # Inactive Investment Plans period calculation
  SELECT
    adashi_staging.p.id AS plan_id,
    adashi_staging.p.owner_id,
    'Investment' AS type,
    adashi_staging.p.last_charge_date AS last_transaction_date,
    DATEDIFF(CURDATE(), adashi_staging.p.last_charge_date) AS inactivity_days
  FROM adashi_staging.plans_plan AS p
  WHERE p.is_deleted = 0
    AND p.is_archived = 0
    AND p.last_charge_date IS NOT NULL
    AND DATEDIFF(CURDATE(), p.last_charge_date) > 365
) AS inactive_accounts
ORDER BY inactivity_days DESC;
