-- Search success rate = successful queries / total queries
WITH totals AS (
  SELECT COUNT(*) AS n FROM search_events
),
success AS (
  SELECT COUNT(*) AS n FROM search_events WHERE success=1
)
SELECT CASE WHEN totals.n=0 THEN 0
            ELSE ROUND(100.0 * success.n / totals.n, 2)
       END AS search_success_pct
FROM totals, success;
