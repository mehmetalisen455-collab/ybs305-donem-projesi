YBS305 İŞ ZEKASI VE VERİ MADENCİLİĞİ - DÖNEM PROJESİ RAPORU
Proje Konusu: Dolar Kuru Artışlarının Perakende Satışlara Etkisinin İncelenmesi
Öğrenci: Mehmet Şen
Projede Adım Adım Ne Yaptık?
Bu projede, ham verileri alıp sıfırdan profesyonel bir iş zekası raporuna dönüştüren uçtan uca (end-to-end) bir veri analitiği pipeline'ı inşa ettik. Çalışmamızın her aşamasını mantıksal sıralamasına göre sırasıyla şu şekilde gerçekleştirdik:
1. Adım: Verilerin Hazırlanması ve Veritabanına Aktarılması (Python & DuckDB)
•	Projenin ilk aşamasında, analizimizde kullanacağımız ham verileri topladık. Elimizdeki perakende_satis.xlsx (satış verileri) ve dolar_kuru_2024_sablon.xlsx (dönemsel döviz kurları) dosyalarını inceledik.
•	Bu Excel dosyalarındaki verilerin Python programlama dili ve pandas kütüphanesi yardımıyla temizlik işlemlerini (eksik veri kontrolü, sütun isimlerinin standartlaştırılması vb.) yaptık.
•	Temizlediğimiz bu ham verileri, modern ve yüksek performanslı gömülü analitik veritabanı olan DuckDB içerisine (dev.duckdb veritabanı) raw_data şeması altında aktardık. Böylece verilerimizi güvenli ve sorgulanabilir bir depoda toplamış olduk.
2. Adım: dbt Core ile Veri Modelleme ve Dönüştürme Katmanı
Verileri doğrudan ham haliyle raporlamak yerine, endüstri standardı olan katmanlı veri modelleme (dbt - Data Build Tool) yaklaşımını kullandık:
•	Staging Katmanı (stg_): DuckDB'deki ham tablolardan yola çıkarak stg_perakende_satis ve stg_dolar_kuru adında staging (ara) modelleri oluşturdum. Bu katmanda veri tiplerini düzelttim ve analize uygun hale getirdim.
•	Mart Katmanı (fct_satis_kurlar): Staging katmanındaki tabloları birleştirerek (JOIN işlemiyle) satışların o günkü dolar kuru karşısındaki değerlerini hesapladık ve analitik hedef tablomuz olan fct_satis_kurlar tablosunu ürettik.
•	Veri Kalitesi Testleri (dbt test): Oluşturduğumuz modellerin doğruluğunu kanıtlamak için dbt üzerinden otomatik testler (unique, not_null vb.) koşturdum ve tüm testlerin başarıyla geçtiğini (PASS) doğruladım.
3. Adım: Looker Studio ile Görselleştirme ve Dashboard Tasarımı
•	dbt mart katmanından elde ettiğimiz nihai analitik tabloyu dışarı aktarıp raporlama katmanına bağladık.
•	Looker Studio üzerinde interaktif bir iş zekası panosu (dashboard) tasarladık:
o	Tarih Hatası Çözümü: Verideki tarih formatını Looker Studio'nun anlandığı formata getirmek için özel bir hesaplanmış alan (PARSE_DATE) tanımladık.
o	KPI ve Metrikler: Toplam TL ciro, toplam USD ciro ve döviz artışının satış hacmine etkisini gösteren özet kartlar ekledik.
o	Gelişmiş Grafikler: Hangi kategorinin ve şehrin döviz kurlarından nasıl etkilendiğini net bir şekilde gösteren zaman serisi grafikleri ve kategori bazlı sütun grafikler ekleyerek panomuzu zenginleştirdik.
4. Adım: Versiyon Kontrolü ve GitHub Paylaşımı
•	Tüm python kodlarımızı, dbt konfigürasyonlarımızı ve SQL modellerimizi Git versiyon kontrol sistemi ile yöneterek paketledik.
•	Projeyi GitHub üzerinde oluşturduğumuz uzak depoya (ybs305-donem-projesi) güvenli bir şekilde push ettik.
•	Hocamızın raporumuza ve kodlarımıza tek tıkla ulaşabilmesi için Looker Studio canlı rapor bağlantısını proje deposunun "About" kısmına ekledik.

