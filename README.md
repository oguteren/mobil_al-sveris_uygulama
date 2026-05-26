# Alışverii Mini Katalog (Flutter)

Bu proje, Flutter ogrenme surecini adim adim ilerletmek icin hazirlanmis bir egitim projesidir. Uygulama iki temel bolumden olusur:

- **Mini Katalog**: Urunlerin GridView ile listelendigi, detay ekranina gecis yapilan ve basit sepet state'inin yonetildigi bolum.
- **Is Ilanlari**: Gercek bir public API'den ilanlarin cekilip listelendigi bolum.

Proje, 5 gunluk egitim planina dogrudan uygun olacak sekilde tasarlanmistir.

---

## 1) Proje Amaci

Bu proje ile hedeflenen kazanımlar:

- Flutter proje yapisini dogru kurmak ve yonetmek
- Temel widget'lar ile modern bir UI olusturmak
- Sayfalar arasi gecis (Navigator) ve route argument kullanmak
- JSON asset okuyarak dinamik liste olusturmak
- Basit bir state guncelleme senaryosu (sepet sayaci) yazmak
- Harici API'den veri cekmek ve ekranda gostermek

---

## 2) Teknolojiler

- **Flutter** (UI ve uygulama yapisi)
- **Dart** (uygulama dili)
- **http** paketi (REST API cagrilari)
- **Material 3** tema altyapisi

---

## 3) Proje Klasor Yapisi

```text
mobil_proje/
├── assets/
│   └── data/
│       └── products.json
├── lib/
│   ├── data/
│   │   ├── jobs_api_service.dart
│   │   └── product_service.dart
│   ├── models/
│   │   ├── job_posting.dart
│   │   └── product.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   │   ├── jobs_screen.dart
│   │   ├── product_detail_screen.dart
│   │   └── product_list_screen.dart
│   ├── widgets/
│   │   └── product_card.dart
│   └── main.dart
├── pubspec.yaml
└── README.md
```

### Klasorlerin gorevleri

- `lib/models`: Veri modelleri (`Product`, `JobPosting`)
- `lib/data`: Veri kaynaklari (JSON okuma ve API servisleri)
- `lib/screens`: Uygulama ekranlari
- `lib/widgets`: Tekrar kullanilabilir UI bilesenleri
- `assets/data`: Lokal JSON verisi

---

## 4) Ekranlar ve Akis

### `HomeScreen`
- Uygulamanin giris ekranidir.
- Kullanici iki ana bolume yonlendirilir:
  - Mini Katalog
  - Is Ilanlari (API)

### `ProductListScreen`
- Lokal JSON'dan urunleri okur.
- Urunleri **GridView** ile kart yapisinda listeler.
- "Sepete Ekle" ile sepet sayisini arttirir (basit state ornegi).
- Urune tiklandiginda detay ekranina gider.

### `ProductDetailScreen`
- `Navigator` route argument ile gelen urun bilgisini gosterir.
- Urunun isim, kategori, aciklama ve fiyat bilgisi yer alir.

### `JobsScreen`
- API uzerinden ilanlari ceker.
- Sirket, pozisyon, konum ve etiket bilgilerini listeler.

---

## 5) Egitim Asamalari ile Eslesme

### Asama 1 - Kurulum ve Temel Yapi (Gun 1)
- Flutter ortaminin hazirlanmasi
- Proje klasorleme mantigi
- `main.dart` ve uygulama giris noktasi

### Asama 2 - Dart ve UI Temelleri (Gun 2)
- `Scaffold`, `AppBar`, `Card`, `ListTile`, `Icon`
- Mavi tonlarinda tema ve sayfa tasarimi

### Asama 3 - Sayfalar ve Navigasyon (Gun 3)
- Coklu ekran yapisi
- `Navigator.pushNamed` kullanimi
- `onGenerateRoute` ile argument tasima

### Asama 4 - Veri Yapilari ve Listeleme (Gun 4)
- `Product` model sinifi
- `assets/data/products.json` okuma
- `FutureBuilder` ile dinamik listeleme

### Asama 5 - Mini Katalog Uygulamasi (Gun 5)
- Ana sayfa + liste + detay tam akis
- Sepet state simulasyonu
- API entegreli is ilanlari sayfasi

---

## 6) API Bilgisi

Projedeki is ilanlari verisi gercek bir public API'den cekilir:

- Endpoint: `https://www.arbeitnow.com/api/job-board-api`
- HTTP Method: `GET`
- Servis dosyasi: `lib/data/jobs_api_service.dart`

Not:
- API key gerektirmez.
- Internet baglantisi olmadan ilan sayfasi veri cekemez.

---

## 7) Lokal Veri (JSON Asset)

Katalog bolumu icin ornek urunler su dosyadan okunur:

- `assets/data/products.json`

Bu dosya `pubspec.yaml` icinde asset olarak tanimlanmistir. Yeni urun eklemek icin bu JSON listesine ayni formatta yeni obje eklenebilir.

---

## 8) Kurulum ve Calistirma

### Gereksinimler
- Flutter SDK (stable)
- Xcode (iOS Simulator icin)

### Komutlar

```bash
flutter pub get
open -a Simulator
flutter run -d "iPhone 17"
```

Alternatif olarak mevcut cihazlari listelemek icin:

```bash
flutter devices
```

---

## 9) Ogrenim Acisindan Onemli Noktalar

- **FutureBuilder**: Asenkron veriyi ekranda guvenli gostermek
- **StatefulWidget**: Sepet sayaci gibi anlik durum guncellemeleri
- **Route Arguments**: Bir ekrandan digerine model tasimak
- **Reusable Widget**: `ProductCard` ile tekrarli UI'yi sade tutmak

---

## 10) Gelistirme Onerileri (Sonraki Adimlar)

- Is ilanlari icin arama ve filtreleme
- Favorilere ekleme ozelligi
- Urun/sepet yapisini Provider veya Riverpod ile yonetme
- API hata yonetimi ve retry mekanizmasi
- Unit test ve widget testleri ekleme

---

## 11) Proje Ciktilari Ozeti

Bu proje sonunda elde edilen dogrudan ciktilar:

- Calisan bir mini katalog uygulamasi
- Ana sayfa - urun listesi - urun detay akis yapisi
- Navigator tabanli sayfa gecisleri
- Route argument kullanimi
- GridView kart tabanli tasarim
- Basit state guncelleme ornegi
- Dogru klasor yapisi ve asset yonetimi
- Gercek API entegrasyonu ile is ilani listeleme
# is_bulma_mobil
