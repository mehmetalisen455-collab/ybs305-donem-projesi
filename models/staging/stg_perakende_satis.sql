select
    SiparisID as siparis_id,
    cast(Tarih as date) as siparis_tarihi,
    Musteri_ID as musteri_id,
    Sehir as sehir,
    Bolge as bolge,
    Kanal as kanal,
    Kategori as kategori,
    Urun as urun,
    Miktar as miktar,
    BirimFiyat as birim_fiyat,
    Maliyet as maliyet,
    IndirimOrani as indirim_orani
from {{ source('raw_data', 'perakende_satis') }}