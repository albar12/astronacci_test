import 'package:flutter/material.dart';
import '/path.dart';

class HomeHeaderComponent extends StatelessWidget {
  const HomeHeaderComponent({
    super.key,
    required this.state,
    required this.size,
    required this.sectionKey1,
  });

  final HomeState state;
  final Size size;
  final GlobalKey sectionKey1;

  @override
  Widget build(BuildContext context) {
    String fullName = state.data.name ?? '';
    // String fullName = 'Irwanto Kogawa Datebayo Uzumaki Hutagaol';

    // Pisahkan nama-nama berdasarkan spasi
    List<String> names = fullName.split(' ');

    String result;

    // Jika jumlah nama lebih dari 3, ambil 3 nama pertama + huruf pertama dari nama ke-4
    if (names.length > 2) {
      String firstThreeNames = names.take(2).join(' '); // Ambil 3 nama pertama
      result = firstThreeNames;
    } else {
      // Jika jumlah nama 3 atau kurang, ambil seluruh nama
      result = fullName;
    }

    return Container(
      width: 500,
      height: 250,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/images/img_home_card_background.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 0.1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Hello, $result",
              textAlign: TextAlign.center,
              style: FontFamilyConstant.primaryFont.copyWith(
                color: ColorConstant.whiteColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: size.width / 1.1,
              child: Text(
                "Sudah baca buku \n hari ini?",
                textAlign: TextAlign.center,
                style: FontFamilyConstant.primaryFont.copyWith(
                  color: ColorConstant.whiteColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstant.blueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  _scrollToSection(sectionKey1);
                },
                child: Text(
                  "Mulai Baca",
                  style: FontFamilyConstant.primaryFont.copyWith(
                    fontSize: 14,
                    color: ColorConstant.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      // Menggunakan ScrollController untuk scroll ke posisi bagian tertentu
      Scrollable.of(context).position.ensureVisible(
            context.findRenderObject()!,
            alignment: 0.0, // Scroll ke bagian atas
            duration: const Duration(seconds: 1), // Durasi animasi
          );
    }
  }
}
