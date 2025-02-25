import 'package:flutter/material.dart';
/// utils ini digunakan untuk mengganti default tipe [Color] yang menggunakan 0xFF menjadi #
class HexColor extends Color {
  /// function ini bertipe [Int] 
  /// flow dari function ini adalah mengganti 0xFF menjadi # dengan membuat hexColor nya menjadi uppercase lalu mereplace semua karakter 0 dengan #
  /// setelah di replace maka akan di parsing menjadi [int]
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
