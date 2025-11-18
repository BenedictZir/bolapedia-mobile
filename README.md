Tugas 7:
1. Apa itu widget tree dan bagaimana hubungan parent-child bekerja antar widget?
    Flutter menggambarkan tampilan aplikasi dalam bentuk pohon widget (widget tree).
    Artinya, semua elemen di layar — seperti teks, tombol, gambar, kolom, baris — adalah widget yang saling bersarang.
2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
    - MaterialApp:  pembungkus utama untuk gaya Material Design.
    - Scaffold: menyediakan struktur dasar (app bar, body, floating button, dsb).
    - AppBar: menampilkan bar di bagian atas aplikasi.
    - Center: memusatkan widget di tengah layar.
    - Column: menampilkan widget secara vertikal.
    - ElevatedButton.icon: tombol dengan ikon dan teks.
    - SnackBar: pesan kecil yang muncul sementara di bawah layar.
    - Text: menampilkan teks.
    - Icon: menampilkan ikon di tombol.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
    MaterialApp adalah widget root yang: 
    - Menyediakan gaya Material Design (ikon, tombol, warna, font, dsb).
    - Mengatur navigasi antar halaman.
    - Menyediakan theme (warna utama, font global, dsb).
    - Mengatur judul aplikasi dan behavior umum.
    Karena itu, MaterialApp hampir selalu menjadi widget paling atas (root) di aplikasi Flutter berbasis Material Design.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
   - StatelessWidget: Widget yang tidak memiliki state (data tidak berubah)
   - StatefulWidget: Widget yang memiliki state(data bisa berubah rubah)
   Kita bisa memilih StatelessWidget untuk widget yang tidak berubah rubah, seperti button di tugas ini. Lalu StatefulWidget untuk widget dinamis yang bisa berubah data atau statenya.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
    BuildContext adalah objek yang memberi tahu posisi widget dalam widget tree. Penting karena menjadi lokasi widget dalam widget tree. Setiap kali Flutter memanggil metode build(BuildContext context), Flutter akan memberikan BuildContext sebagai argumen. BuildContext ini adalah handle ke lokasi widget saat ini di dalam tree. Widget kemudian menggunakan context ini jika perlu mengambil data dari ancestor (seperti Theme.of(context)) atau meneruskannya ke child (anak) yang dibangunnya.


6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
    Hot reload menyimpan perubahan kode dan memperbarui UI tanpa mengulang seluruh aplikasi. Sedangkan hot restart mengulang aplikasi dari awal (data dan state hilang).

Tugas 8:
1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
   - Model Dart memberi struktur yang jelas (tipe data, field nullable/non-nullable) dan satu tempat untuk parsing (fromJson/toJson). Jika langsung Map<String, dynamic> konsekuensinya adalah rawan typo key, error baru muncul saat runtime, null-safety tidak terjamin, parsing berantakan di banyak tempat, dan sulit dirawat saat schema berubah.

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
   - http: klien HTTP umum (GET/POST) tanpa manajemen sesi/cookie. Cocok untuk akses publik/anonim.
   - CookieRequest: klien HTTP yang menyimpan cookie (sessionid, csrftoken), ada helper login/logout, dan otomatis mengirim cookie di request berikutnya. Cocok untuk endpoint yang butuh autentikasi Django.
   - Pada tugas ini login/register/logout menggunakan CookieRequest, fetch JSON juga menggunakan CookieRequest agar session terbawa.

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
   - Supaya semua halaman memakai sesi yang sama (cookie tersinkron). Kalau bikin instance baru, cookie hilang dan user dianggap tidak login.
   - Dengan Provider di root, perubahan state (loggedIn) bisa memicu rebuild UI yang tepat di semua halaman.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
   - Django:
     - ALLOWED_HOSTS: tambahkan 'localhost', '127.0.0.1', dan '10.0.2.2' (emulator Android ke host).
     - CORS: aktifkan corsheaders dan set CORS_ALLOWED_ORIGINS sesuai asal request.
     - CSRF_TRUSTED_ORIGINS: tambahkan origin Flutter jika beda host/port.
     - Cookie: pastikan session/CSRF bisa dikirim (perhatikan SameSite/secure saat lintas origin).
   - Flutter (Android):
     - AndroidManifest.xml: <uses-permission android:name="android.permission.INTERNET" />.
     - Base URL gunakan http://10.0.2.2:8000 untuk emulator (bukan localhost).
   - Jika tidak benar: request diblokir (CORS), tidak bisa login (cookie/CSRF tidak terset), atau network error (tanpa izin internet).

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
   - Input di Flutter (form) -> validasi -> kirim ke Django via CookieRequest.post.
   - Django view menerima request -> validasi -> simpan ke database -> kembalikan respons (redirect/JSON).
   - Flutter melakukan request.get ke endpoint JSON -> decode -> mapping ke model Dart (ProductEntry.fromJson) -> build UI (ListView/Card/Detail).

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
   - Register: Flutter kirim username/password (dan data lain) ke endpoint register Django -> Django buat user -> respons sukses -> arahkan ke login.
   - Login: Flutter pakai CookieRequest.login ke endpoint Django -> jika sukses, Django set sessionid/csrftoken -> CookieRequest menyimpan cookie.
   - Setelah login: setiap request berikutnya otomatis membawa cookie, sehingga endpoint yang dilindungi bisa diakses.
   - Logout: Flutter panggil CookieRequest.logout -> Django hapus sesi -> CookieRequest buang cookie -> UI kembali ke halaman login.

7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
   - Membuat endpoint JSON di django (/json/ dan versi filtered /json-mine/).
   - Menambahkan CORS, CSRF_TRUSTED_ORIGINS, dan ALLOWED_HOSTS (termasuk 10.0.2.2) di Django, serta izin INTERNET di Android.
   - Membuat model Dart ProductEntry (id, name, price, category, thumbnail, description, brand, stock, is_featured, user_id).
   - Mendaftarkan Provider<CookieRequest> di main.dart agar cookie/sesi dibagikan ke semua halaman.
   - Membuat halaman Register dan Login yang memanggil endpoint Django via CookieRequest (login menyimpan cookie).
   - Membuat halaman list produk (ProductEntryListPage) yang fetch data via request.get, parsing ke ProductEntry, dan menampilkan dengan ProductCard.
   - Membuat ProductDetailPage yang menampilkan seluruh atribut item dan navigasi kembali.
   - Menambahkan filter “My Products”: opsi client-side (filter by user_id) atau server-side (/json-mine/). Tombol “My Products” di menu diarahkan ke halaman filtered.
   - Menambahkan navigasi dari card ke detail dan dari menu ke list/create.
   - Membuat app_theme.dart agar aplikasi mobile senada dengan web