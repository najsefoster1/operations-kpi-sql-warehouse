-- Article freshness (% updated within 90 days)
WITH total AS (
  SELECT COUNT(*) AS n FROM knowledge_articles
),
fresh AS (
  SELECT COUNT(*) AS n
  FROM knowledge_articles
  WHERE (JULIANDAY('now') - JULIANDAY(last_updated)) <= 90
)
SELECT CASE WHEN total.n=0 THEN 0
            ELSE ROUND(100.0 * fresh.n / total.n, 2)
       END AS article_freshness_pct
FROM total, fresh;
