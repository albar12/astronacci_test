import 'package:flutter/material.dart';

import '/path.dart';

class BookDetailContentTablet extends StatefulWidget {
  const BookDetailContentTablet({
    super.key,
    required this.size,
    required this.state,
    this.isFromBundle,
    required this.hasBeenDisconnected,
    this.isFree,
    required this.formattedTimeZone,
    required this.isPhysicalDevice,
    this.title,
  });
  final Size size;
  final BookDetailState state;
  final bool? isFromBundle;
  final bool hasBeenDisconnected;
  final bool? isFree;
  final String formattedTimeZone;
  final bool isPhysicalDevice;
  final String? title;

  @override
  State<BookDetailContentTablet> createState() =>
      _BookDetailContentTabletState();
}

class _BookDetailContentTabletState extends State<BookDetailContentTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 400.0,
            flexibleSpace: ClipRect(
              child: HeaderBookDetailComponentTablet(
                size: widget.size,
                image: '',
                state: widget.state,
              ),
            ), // Isi flexibleSpace sesuai kebutuhan Anda
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: BodyBookDetailComponentTablet(
                  size: widget.size,
                  state: widget.state,
                  isFree: widget.isFree,
                  formattedTimeZone: widget.formattedTimeZone,
                ),
              );
            }, childCount: 1),
          ),
        ],
      ),
    );
  }
}
