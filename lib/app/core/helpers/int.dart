// extension untuk format ribuan, puluhan ribu, ratusan ribu dan jutaan menggunakan .
// Sebagai contoh untuk 1.000, 1.000.000, 1.000.000.000, 1.000.000.000.000, 1.000.000.000.000.000
extension IntExtension on int {
  String formatDotInteger() {
    return toString().replaceAllMapped(
      // mengganti 1000 menjadi 1.000
      // menggunakan regex untuk menambahkan titik setiap 3 digit
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      // menambahkan . setiap 3 digit
      (Match m) => '${m[1]}.',
    );
  }
}
