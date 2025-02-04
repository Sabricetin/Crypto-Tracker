🚀 Crypto Tracker

Crypto Tracker, SwiftUI ve MVVM mimarisi kullanılarak geliştirilmiş bir kripto para takip ve portföy yönetim uygulamasıdır. Gerçek zamanlı fiyat güncellemeleri, modern arayüzü ve kullanıcı dostu özellikleri ile kripto para piyasalarını kolayca analiz edebilirsiniz.

📌 Özellikler

🔹 Gerçek Zamanlı Kripto Para Takibi
	-	Piyasadaki en popüler kripto para birimlerinin anlık fiyat bilgilerini gösterir.
	-	USD ve diğer para birimleri üzerinden fiyatlandırma desteği sunar.
	-	Combine Framework ile veriler anlık olarak güncellenir.

🎨 Özel Tema Desteği
	•	Uygulamada iki ana tema bulunmaktadır:
	•	ColorTheme: Uygulamanın genel renk şemasını belirler.
	•	LaunchTheme: Açılış ekranı için özel renk seti içerir.
	•	SwiftUI Color Extension ile dinamik tema yönetimi sağlanmıştır.

📊 Portföy Yönetimi
	•	Kullanıcılar sahip oldukları kripto para birimlerini portföylerine ekleyebilir ve değerlerini güncelleyebilir.
	•	Core Data kullanılarak portföy verileri saklanır.
	•	State & EnvironmentObject ile veriler bileşenler arasında senkronize edilir.

🌑 Karanlık Mod Desteği
	•	iOS sistem teması ile uyumlu çalışarak otomatik olarak karanlık ve aydınlık mod arasında geçiş yapar.

📈 Gelişmiş Grafikler ve Analizler
	•	Günlük, haftalık ve aylık fiyat değişimlerini analiz etmek için grafik desteği eklenmiştir.
	•	LazyHStack ve LazyVStack kullanılarak performanslı listeleme yapılmıştır.

🔊 Haptic Geri Bildirim Desteği
	•	Kullanıcının işlemlerini daha hissedilebilir kılmak için HapticManager ile dokunsal geri bildirim sağlanmıştır.
	•	UINotificationFeedbackGenerator kullanılarak işlem sonrası geri bildirim verilmiştir.

🌍 Çoklu Dil Desteği
	•	Kullanıcının cihaz diline göre otomatik olarak uyarlanan çoklu dil desteği (i18n formatında).

🏗️ Teknolojiler ve Kullanılan Yapılar
	•	SwiftUI: Deklaratif UI oluşturma
	•	MVVM Mimarisi: UI ve iş mantığının ayrılması
	•	Combine Framework: Gerçek zamanlı veri akışı
	•	Core Data: Portföy verilerinin saklanması
	•	EnvironmentObject & State Management: Global ve lokal veri yönetimi
	•	LazyHStack & LazyVStack: Performanslı listeleme
	•	NavigationView & ScrollView: Esnek ve dinamik arayüz
	•	HapticManager: Kullanıcı geri bildirimi sağlama

🚀 Kurulum ve Çalıştırma

1️⃣ Depoyu Klonlayın:

git clone https://github.com/kullanici-adi/crypto-tracker.git
cd crypto-tracker

2️⃣ Xcode’da Açın ve Çalıştırın:

open Crypto-Tracker.xcodeproj

	•	Simülatör veya fiziksel cihazda çalıştırabilirsiniz.

🏗️ Kod Yapısı

📂 Crypto-Tracker
	•	📂 Views/ - Uygulamanın kullanıcı arayüzü bileşenleri
	•	📂 Models/ - Kripto para verileri için model dosyaları
	•	📂 ViewModels/ - İş mantığı ve veri yönetimi için ViewModel’ler
	•	📂 Services/ - API çağrıları ve veri çekme işlemleri
	•	📂 Themes/ - Uygulama renk ve tema yönetimi
	•	📂 Utilities/ - Yardımcı fonksiyonlar (HapticManager gibi)

🤝 Katkıda Bulunma

Bu projeye katkıda bulunmak isterseniz:
	1.	Depoyu forklayın.
	2.	Yeni bir branch oluşturun: git checkout -b feature-yeni-ozellik
	3.	Değişikliklerinizi yapın ve commitleyin: git commit -m "Yeni özellik eklendi"
	4.	Branch’i gönderin: git push origin feature-yeni-ozellik
	5.	Pull Request açarak katkınızı paylaşın.

📩 İletişim


Proje ile ilgili herhangi bir sorunuz olursa aşağıdaki kanallardan bana ulaşabilirsiniz:

📧 Email: sabriyazilim@gmail.com  
👨‍💻 LinkedIn: https://www.linkedin.com/notifications/?filter=all

# Ekran Görüntüsü
 ![Crypto](https://github.com/user-attachments/assets/d1927409-a69f-44fa-9350-de126fd5ec75)
