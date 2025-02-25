import 'package:flutter/material.dart';
import '/path.dart';

class HomeHeaderTabletComponent extends StatelessWidget {
  const HomeHeaderTabletComponent({
    super.key,
    required this.size,
    required this.state,
    required this.sectionKey1,
  });

  final Size size;
  final HomeState state;
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
      height: 320,
      width: size.width,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/images/img_home_card_background.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              "Hello, $result",
              style: FontFamilyConstant.primaryFont.copyWith(
                color: ColorConstant.whiteColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Sudah baca buku \n hari ini?",
              textAlign: TextAlign.center,
              style: FontFamilyConstant.primaryFont.copyWith(
                color: ColorConstant.whiteColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
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
                    fontSize: 18,
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
