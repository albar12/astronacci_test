import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '/path.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({
    super.key,
    required this.state,
    required this.size,
    required this.scrollController,
    required this.refreshController,
    required this.sectionKey1,
    required this.sectionTopKey,
    required this.homeCubit,
    this.onRefresh,
    this.onLoading,
  });

  final HomeState state;
  final Size size;
  final RefreshController refreshController;
  final ScrollController scrollController;
  final GlobalKey sectionKey1;
  final GlobalKey sectionTopKey;
  final HomeCubit homeCubit;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoading;

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
          body: HomelistComponent(
            size: widget.size,
            state: widget.state,
            onRefresh: widget.onRefresh,
            onLoading: widget.onLoading,
            refreshController: widget.refreshController,
          ),
        ),
      ),
    );
  }
}
