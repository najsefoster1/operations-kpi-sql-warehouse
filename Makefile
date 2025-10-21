.PHONY: setup load kpis test

setup:
	python -m venv .venv && . .venv/bin/activate && pip install -U pip && pip install -r requirements.txt

load:
	rm -f warehouse.db
	sqlite3 warehouse.db < schema.sql
	csvsql --db sqlite:///warehouse.db --tables temp_interactions --insert seed/interactions.csv
	csvsql --db sqlite:///warehouse.db --tables temp_search --insert seed/search_events.csv
	csvsql --db sqlite:///warehouse.db --tables temp_onboarding --insert seed/onboarding_events.csv
	sqlite3 warehouse.db "INSERT INTO interactions SELECT * FROM temp_interactions;"
	sqlite3 warehouse.db "INSERT INTO search_events SELECT * FROM temp_search;"
	sqlite3 warehouse.db "INSERT INTO onboarding_events SELECT * FROM temp_onboarding;"
	sqlite3 warehouse.db "INSERT INTO knowledge_articles (title,last_updated,audience) VALUES ('Reset password','2025-10-05','external');"
	sqlite3 warehouse.db "INSERT INTO knowledge_articles (title,last_updated,audience) VALUES ('Billing overview','2025-06-01','external');"

kpis:
	python scripts/run_queries.py

test:
	pytest -q
