select
    cast(Tarih as date) as kur_tarihi,
    "Kullanılan Kur (USD/TRY)" as dolar_kuru
from {{ source('raw_data', 'dolar_kuru') }}
where "Kullanılan Kur (USD/TRY)" is not null