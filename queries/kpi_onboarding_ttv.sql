-- Onboarding time-to-value (days): avg days between start and first_success
WITH starts AS (
  SELECT user_id, ts AS start_ts
  FROM onboarding_events WHERE event='start'
),
firsts AS (
  SELECT user_id, ts AS first_ts
  FROM onboarding_events WHERE event='first_success'
),
joined AS (
  SELECT s.user_id,
         JULIANDAY(f.first_ts) - JULIANDAY(s.start_ts) AS days_to_value
  FROM starts s JOIN firsts f USING (user_id)
)
SELECT ROUND(AVG(days_to_value), 2) AS avg_days_ttv FROM joined;
