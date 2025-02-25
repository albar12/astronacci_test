import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '/path.dart';

class HeaderBookDetailComponent extends StatelessWidget {
  const HeaderBookDetailComponent({
    super.key,
    required this.size,
    required this.image,
    required this.state,
  });
  final Size size;
  final String image;
  final BookDetailState state;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("assets/images/img_placeholder.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: FadeInImage.assetNetwork(
                placeholder:
                    "assets/images/img_placeholder.png", // Gambar placeholder
                image: '', // Gunakan string kosong jika URL tidak ada
                fit: BoxFit.cover,
                fadeInDuration: const Duration(
                  milliseconds: 200,
                ), // Durasi efek fade-in
                fadeOutDuration: const Duration(
                  milliseconds: 200,
                ), // Durasi efek fade-out
              ),
            ),
          ),
        ),
      ],
    );
  }
}
