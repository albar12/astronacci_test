import 'package:flutter/material.dart';

import '/path.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({
    super.key,
    required this.state,
    required this.size,
    this.controller,
    required this.scrollController,
    required this.sectionKey1,
    required this.sectionTopKey,
    required this.homeCubit,
  });

  final HomeState state;
  final Size size;
  final TabController? controller;
  final ScrollController scrollController;
  final GlobalKey sectionKey1;
  final GlobalKey sectionTopKey;
  final HomeCubit homeCubit;

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: SafeArea(
        child: NestedScrollView(
          controller: widget.scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                key: widget.sectionTopKey,
                backgroundColor: ColorConstant.whiteColor,
                expandedHeight: 58.0,
                collapsedHeight: 58.0,
                flexibleSpace: Column(
                  children: [
                    HomeSearchComponent(state: widget.state, size: widget.size),
                  ],
                ),
              ),
            ];
          },
          body: HomeBooklistComponent(size: widget.size, state: widget.state),
        ),
      ),
    );
  }
}
