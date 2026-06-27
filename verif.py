import duckdb
import numpy
import pandas


con = duckdb.connect("dev.duckdb")

print("=== TABLES ===")
print(
    con.execute("""
    SELECT table_schema, table_name
    FROM information_schema.tables
    ORDER BY table_schema, table_name
    """).fetchdf()
)

print("\n=== STG_FARMS ===")
print(
    con.execute("""
    SELECT *
    FROM main_staging.stg_farms
    LIMIT 5
    """).fetchdf()
)



print("\n=== Dim Farm ===")
print(
    con.execute("""
    SELECT *
    FROM main_marts.dim_farms
    LIMIT 5
    """).fetchdf()
)

print(
    con.execute("""
    SELECT total_area_hectares, farm_type
    FROM main_marts.dim_farms
    WHERE farm_type='mixte'
    LIMIT 5
    """).fetchdf()
)

print(
    con.execute("""
    SELECT *
    FROM main_marts.dim_farm_type
    LIMIT 5
    """).fetchdf()
)