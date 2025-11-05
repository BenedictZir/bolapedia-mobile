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
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
- Navigator.push() menambahkan halaman baru di atas halaman sebelumnya di stack navigasi. Pengguna masih bisa kembali ke halaman sebelumnya dengan tombol back.
- Navigator.pushReplacement() menggantikan halaman saat ini dengan halaman baru. Halaman lama dihapus dari stack, jadi pengguna tidak bisa kembali ke halaman sebelumnya.
- Pada aplikasi bolapedia, Navigator.push() cocok digunakan ketika pengguna berpindah ke halaman detail produk agar bisa kembali ke halaman katalog. Sementara Navigator.pushReplacement() cocok untuk navigasi seperti setelah login, karena kita tidak ingin pengguna kembali ke halaman login lagi.


2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
- Scaffold digunakan di setiap halaman untuk memberikan struktur dasar (AppBar, Drawer, dan body).
- AppBar menampilkan judul halaman atau nama toko, sehingga pengguna selalu tahu di mana mereka berada.
- Drawer berisi menu navigasi untuk berpindah antar halaman.
Dengan struktur ini, semua halaman memiliki tampilan yang seragam dan mudah digunakan tanpa harus menulis ulang komponen layout utama di setiap halaman.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
- Padding digunakan untuk memberi jarak antar elemen agar tampilan form lebih rapi dan mudah dibaca. Contohnya di ProductFormPage, setiap TextFormField seperti “Nama Produk” dan “Harga” dibungkus dengan Padding(padding: EdgeInsets.all(8.0)) sehingga elemen tidak menempel satu sama lain.

- SingleChildScrollView digunakan agar form bisa scroll jika isinya panjang. Pada ProductFormPage, seluruh elemen form (nama, harga, deskripsi, kategori, dst.) dimasukkan ke dalam SingleChildScrollView sehingga pengguna tetap bisa mengakses semua field meskipun layar kecil.

- ListView digunakan di LeftDrawer untuk menampilkan daftar menu seperti Home, Add Product, dan View Products. Dengan ListView, menu tetap rapi dan bisa discroll jika jumlah item bertambah.

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
- Untuk saat ini, saya masih menggunakan warna dasar bawaan Flutter seperti indigo dan putih agar tampilan aplikasi tetap bersih dan mudah dibaca. Warna ini digunakan di beberapa elemen seperti AppBar, tombol ElevatedButton, dan DrawerHeader untuk menjaga konsistensi tampilan antarhalaman. Walaupun belum mencerminkan brand final Bolapedia secara spesifik, warna ini memberikan dasar tema yang seragam. Ke depannya, tema warna dapat disesuaikan lagi agar lebih mencerminkan identitas visual toko, misalnya dengan menambahkan custom color palette sesuai logo atau karakter toko.