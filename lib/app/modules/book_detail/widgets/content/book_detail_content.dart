import 'package:flutter/material.dart';

import '/path.dart';

class BookDetailContent extends StatefulWidget {
  const BookDetailContent({
    super.key,
    required this.size,
    required this.state,
    this.isFromBundle,
    required this.hasBeenDisconnected,
    this.isFree,
    required this.formattedTimeZone,
    this.title,
    required this.isPhysicalDevice,
    required this.isExpired,
  });
  final Size size;
  final BookDetailState state;
  final bool? isFromBundle;
  final bool hasBeenDisconnected;
  final bool? isFree;
  final String formattedTimeZone;
  final String? title;
  final bool isPhysicalDevice;
  final bool isExpired;
  @override
  State<BookDetailContent> createState() => _BookDetailContentState();
}

class _BookDetailContentState extends State<BookDetailContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300.0,
            flexibleSpace: ClipRect(
              child: HeaderBookDetailComponent(
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
                child: BodyBookDetailComponent(
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
