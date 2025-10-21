-- Ticket deflection % = (self_service solves + bot solves) / total intents
WITH totals AS (
  SELECT COUNT(*) AS total FROM interactions
),
deflected AS (
  SELECT COUNT(*) AS deflected
  FROM interactions
  WHERE resolved_by IN ('self_service','bot')
)
SELECT ROUND(100.0 * deflected.deflected / totals.total, 2) AS deflection_pct
FROM totals, deflected;
