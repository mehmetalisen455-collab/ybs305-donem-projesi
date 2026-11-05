select
    s.siparis_id,
    s.siparis_tarihi,
    s.musteri_id,
    s.sehir,
    s.bolge,
    s.kanal,
    s.kategori,
    s.urun,
    s.miktar,
    s.birim_fiyat,
    s.maliyet,
    s.indirim_orani,
    -- Toplam ciro hesaplama
    (s.miktar * s.birim_fiyat * (1 - s.indirim_orani)) as toplam_tutar_tl,
    -- O güne ait dolar kuru
    k.dolar_kuru,
    -- Cironun USD karşılığı
    (s.miktar * s.birim_fiyat * (1 - s.indirim_orani)) / nullif(k.dolar_kuru, 0) as toplam_tutar_usd
from {{ ref('stg_perakende_satis') }} s
left join {{ ref('stg_dolar_kuru') }} k
  on s.siparis_tarihi = k.kur_tarihi