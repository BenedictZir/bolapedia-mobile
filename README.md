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