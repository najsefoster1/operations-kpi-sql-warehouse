from pathlib import Path
import sqlite3


def test_db_exists():
    assert Path("warehouse.db").exists()


def test_queries_run():
    conn = sqlite3.connect("warehouse.db")
    for qfile in Path("queries").glob("*.sql"):
        sql = qfile.read_text()
        conn.execute(sql)
    conn.close()
