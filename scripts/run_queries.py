import sqlite3, csv, pathlib, sys

DB = "warehouse.db"

def run(qpath):
    with open(qpath, "r", encoding="utf-8") as f:
        sql = f.read()
    cur = conn.execute(sql)
    rows = cur.fetchall()
    print(qpath + " ->", rows)

if __name__ == "__main__":
    root = pathlib.Path(__file__).resolve().parents[1]
    conn = sqlite3.connect(root / DB)
    for q in sorted((root / "queries").glob("*.sql")):
        run(str(q))
