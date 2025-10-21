# Operations KPI SQL Warehouse

I like turning messy event data into clean, decision-grade KPIs. This little project keeps everything small on purpose - one file database, a few reliable queries, and tests that stay green. In a real deployment, the same patterns scale to Postgres or BigQuery with dbt models and a data quality layer.

## What’s inside

- A compact schema for support interactions, search events, onboarding and knowledge articles.
- Reproducible queries for ticket deflection percent, AI agent resolution percent, search success rate, onboarding time-to-value, and article freshness coverage.
- Seed data that simulate real customer interactions and knowledge updates.
- A tiny test harness so KPIs are always green before sharing a report.

## Quick start

Run these commands from your terminal:

make setup  
make load  
make kpis  
make test

If you want a walkthrough, I can show how this structure scales into a bigger warehouse or a dbt project.
