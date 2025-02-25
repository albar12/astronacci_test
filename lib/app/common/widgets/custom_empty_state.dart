import 'package:flutter/material.dart';
import '/path.dart';

class CustomEmptyState extends StatelessWidget {
  const CustomEmptyState({
    super.key,
    this.title = 'Data tidak ditemukan',
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/img_empty_state.png',
            width: size.width * 0.8,
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: FontFamilyConstant.primaryFont.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
