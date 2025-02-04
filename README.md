🚀 Crypto Tracker

Crypto Tracker, SwiftUI ve MVVM mimarisi kullanılarak geliştirilmiş bir kripto para takip ve portföy yönetim uygulamasıdır.<br> Gerçek zamanlı fiyat güncellemeleri, modern arayüzü ve kullanıcı dostu özellikleri ile kripto para piyasalarını kolayca analiz edebilirsiniz.

📌 Özellikler

🔹 Gerçek Zamanlı Kripto Para Takibi<br>
	•	Piyasadaki en popüler kripto para birimlerinin anlık fiyat bilgilerini gösterir.<br>
	•	USD ve diğer para birimleri üzerinden fiyatlandırma desteği sunar.<br>
	•	Combine Framework ile veriler anlık olarak güncellenir.<br>

🎨 Özel Tema Desteği<br>
	•	Uygulamada iki ana tema bulunmaktadır:<br>
	•	ColorTheme: Uygulamanın genel renk şemasını belirler.<br>
	•	LaunchTheme: Açılış ekranı için özel renk seti içerir.<br>
	•	SwiftUI Color Extension ile dinamik tema yönetimi sağlanmıştır.<br>

📊 Portföy Yönetimi<br>
	•	Kullanıcılar sahip oldukları kripto para birimlerini portföylerine ekleyebilir ve değerlerini güncelleyebilir.<br>
	•	Core Data kullanılarak portföy verileri saklanır.<br>
	•	State & EnvironmentObject ile veriler bileşenler arasında senkronize edilir.<br>

🌑 Karanlık Mod Desteği<br>
	•	iOS sistem teması ile uyumlu çalışarak otomatik olarak karanlık ve aydınlık mod arasında geçiş yapar.<br>

📈 Gelişmiş Grafikler ve Analizler<br>
	•	Günlük, haftalık ve aylık fiyat değişimlerini analiz etmek için grafik desteği eklenmiştir.<br>
	•	LazyHStack ve LazyVStack kullanılarak performanslı listeleme yapılmıştır.<br>

🔊 Haptic Geri Bildirim Desteği<br>
	•	Kullanıcının işlemlerini daha hissedilebilir kılmak için HapticManager ile dokunsal geri bildirim sağlanmıştır.<br>
	•	UINotificationFeedbackGenerator kullanılarak işlem sonrası geri bildirim verilmiştir.<br>

🌍 Çoklu Dil Desteği<br>
	•	Kullanıcının cihaz diline göre otomatik olarak uyarlanan çoklu dil desteği (i18n formatında).<br>

🏗️ Teknolojiler ve Kullanılan Yapılar<br>
	•	SwiftUI: Deklaratif UI oluşturma<br>
	•	MVVM Mimarisi: UI ve iş mantığının ayrılması<br>
	•	Combine Framework: Gerçek zamanlı veri akışı<br>
	•	Core Data: Portföy verilerinin saklanması<br>
	•	EnvironmentObject & State Management: Global ve lokal veri yönetimi<br>
	•	LazyHStack & LazyVStack: Performanslı listeleme<br>
	•	NavigationView & ScrollView: Esnek ve dinamik arayüz<br>
	•	HapticManager: Kullanıcı geri bildirimi sağlama<br>

🚀 Kurulum ve Çalıştırma

1️⃣ Depoyu Klonlayın:

git clone https://github.com/kullanici-adi/crypto-tracker.git
cd crypto-tracker

2️⃣ Xcode’da Açın ve Çalıştırın:

open Crypto-Tracker.xcodeproj

	•	Simülatör veya fiziksel cihazda çalıştırabilirsiniz.

🏗️ Kod Yapısı

📂 Crypto-Tracker<br>
	•	📂 Views/ - Uygulamanın kullanıcı arayüzü bileşenleri<br>
	•	📂 Models/ - Kripto para verileri için model dosyaları<br>
	•	📂 ViewModels/ - İş mantığı ve veri yönetimi için ViewModel’ler<br>
	•	📂 Services/ - API çağrıları ve veri çekme işlemleri<br>
	•	📂 Themes/ - Uygulama renk ve tema yönetimi<br>
	•	📂 Utilities/ - Yardımcı fonksiyonlar (HapticManager gibi)<br>

🤝 Katkıda Bulunma<br>

Bu projeye katkıda bulunmak isterseniz:<br>
	1.	Depoyu forklayın.<br>
	2.	Yeni bir branch oluşturun: git checkout -b feature-yeni-ozellik<br>
	3.	Değişikliklerinizi yapın ve commitleyin: git commit -m "Yeni özellik eklendi"<br>
	4.	Branch’i gönderin: git push origin feature-yeni-ozellik<br>
	5.	Pull Request açarak katkınızı paylaşın.<br>

📩 İletişim


Proje ile ilgili herhangi bir sorunuz olursa aşağıdaki kanallardan bana ulaşabilirsiniz:

📧 Email: sabriyazilim@gmail.com  
👨‍💻 LinkedIn: https://www.linkedin.com/notifications/?filter=all

# Ekran Görüntüsü
 ![Crypto](https://github.com/user-attachments/assets/d1927409-a69f-44fa-9350-de126fd5ec75)
