-- AI agent resolution % = bot-resolved / interactions handled by bot
WITH bot_total AS (
  SELECT COUNT(*) AS n FROM interactions WHERE channel='bot'
),
bot_resolved AS (
  SELECT COUNT(*) AS n FROM interactions WHERE resolved_by='bot'
)
SELECT CASE WHEN bot_total.n=0 THEN 0
            ELSE ROUND(100.0 * bot_resolved.n / bot_total.n, 2)
       END AS ai_resolution_pct
FROM bot_total, bot_resolved;
