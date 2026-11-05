import duckdb
import pandas as pd

# dbt'nin veritabanına bağlanıyoruz
con = duckdb.connect("dev.duckdb")
con.execute("CREATE SCHEMA IF NOT EXISTS raw_data;")

# Satış verisini oku ve DuckDB'ye yükle
df_satis = pd.read_excel("../data/perakende_satis.xlsx", sheet_name="Sheet1")
con.execute("CREATE OR REPLACE TABLE raw_data.perakende_satis AS SELECT * FROM df_satis;")

# Dolar kuru verisini oku ve DuckDB'ye yükle
df_kur = pd.read_excel("../data/dolar_kuru_2024_sablon.xlsx", sheet_name="Dolar Kuru")
con.execute("CREATE OR REPLACE TABLE raw_data.dolar_kuru AS SELECT * FROM df_kur;")

print("Tüm ham veriler DuckDB'ye başarıyla yüklendi!")
con.close()