import duckdb

# DuckDB bağlantısı
con = duckdb.connect("dev.duckdb")

# Tabloyu CSV olarak dışarı aktar
con.execute(
    "COPY (SELECT * FROM fct_satis_kurlar) TO '../data/fct_satis_kurlar.csv'"
    " (HEADER, DELIMITER ',');"
)

print("CSV dosyası başarıyla oluşturuldu!")
con.close()