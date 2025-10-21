-- Minimal SQLite schema to support KPI queries

DROP TABLE IF EXISTS interactions;
CREATE TABLE interactions (
  id INTEGER PRIMARY KEY,
  ts TEXT NOT NULL,
  channel TEXT,            -- "bot" | "human" | "self_service"
  resolved_by TEXT,        -- "bot" | "agent" | "self_service"
  intent TEXT,
  customer_id TEXT
);

DROP TABLE IF EXISTS search_events;
CREATE TABLE search_events (
  id INTEGER PRIMARY KEY,
  ts TEXT NOT NULL,
  query TEXT,
  success INTEGER          -- 1 = success, 0 = no result/click
);

DROP TABLE IF EXISTS onboarding_events;
CREATE TABLE onboarding_events (
  id INTEGER PRIMARY KEY,
  user_id TEXT,
  event TEXT,              -- "start" | "first_success"
  ts TEXT NOT NULL
);

DROP TABLE IF EXISTS knowledge_articles;
CREATE TABLE knowledge_articles (
  id INTEGER PRIMARY KEY,
  title TEXT,
  last_updated TEXT,       -- ISO date
  audience TEXT
);
