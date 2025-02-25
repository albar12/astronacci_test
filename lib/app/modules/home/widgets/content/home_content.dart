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
    required this.pageController,
    required this.isDesktop,
    required this.firstReload,
    required this.homeCubit,
    required this.formattedTimeZone,
  });

  final HomeState state;
  final Size size;
  final TabController? controller;
  final ScrollController scrollController;
  final GlobalKey sectionKey1;
  final GlobalKey sectionTopKey;
  final PageController pageController;
  final bool isDesktop;
  final bool firstReload;
  final HomeCubit homeCubit;
  final String formattedTimeZone;

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    List<Widget> oneTabs = [
      HomeBooklistComponent(size: widget.size, state: widget.state),
    ];

    List<Widget> doubleTabs = [
      HomeBooklistComponent(size: widget.size, state: widget.state),
      HomeBundleComponent(
        size: widget.size,
        state: widget.state,
        formattedTimeZone: widget.formattedTimeZone,
      ),
    ];

    return DefaultTabController(
      length: widget.state.data.tabList?.length ?? 1,
      initialIndex: widget.state.data.indexTab,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: SafeArea(
          child: NestedScrollView(
            controller: widget.scrollController,
            headerSliverBuilder: (
              BuildContext context,
              bool innerBoxIsScrolled,
            ) {
              return <Widget>[
                SliverAppBar(
                  key: widget.sectionTopKey,
                  backgroundColor: ColorConstant.whiteColor,
                  expandedHeight:
                      widget.state.data.searchIsStart ? 58.0 : 360.0,
                  collapsedHeight:
                      widget.state.data.searchIsStart ? 58.0 : 360.0,
                  flexibleSpace: Column(
                    children: [
                      widget.state.data.searchIsOn == false
                          ? InkWell(
                            child: Row(
                              children: [
                                nameItem(context),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.search,
                                    size: 25,
                                    color: ColorConstant.blackColor,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                // ignore: use_build_context_synchronously
                                context,
                                '/profile',
                                (route) => false,
                              );
                            },
                          )
                          : HomeSearchComponent(
                            state: widget.state,
                            size: widget.size,
                            firstReload: widget.firstReload,
                          ),
                      const SizedBox(height: 10),
                      Visibility(
                        visible:
                            !widget.state.data.searchIsStart ? true : false,
                        child: HomeHeaderComponent(
                          state: widget.state,
                          size: widget.size,
                          sectionKey1: widget.sectionKey1,
                        ),
                      ),
                    ],
                  ),
                  bottom:
                      !widget.state.data.searchIsStart
                          ? PreferredSize(
                            preferredSize:
                                widget.state.data.tabList?.length == 1
                                    ? const Size.fromHeight(0.0)
                                    : const Size.fromHeight(
                                      8.0,
                                    ), // Tentukan tinggi sesuai kebutuhan
                            child: Visibility(
                              visible:
                                  widget.state.data.tabList == null ||
                                          widget.state.data.tabList?.length == 1
                                      ? false
                                      : true,
                              child: HomeTabbarComponent(
                                controller: DefaultTabController.of(context),
                                state: widget.state,
                                pageController: widget.pageController,
                              ),
                            ),
                          )
                          : null,
                ),
              ];
            },
            body:
                !widget.state.data.searchIsStart
                    ? Visibility(
                      visible: widget.state.data.tabList == null ? false : true,
                      child: PageView(
                        controller: widget.pageController,
                        key: widget.sectionKey1,
                        children:
                            (widget.state.data.tabList != null &&
                                    widget.state.data.tabList!.length > 1)
                                ? doubleTabs
                                : oneTabs,
                        onPageChanged: (value) {
                          // widget.homeCubit.changeIndexTab(value);
                        },
                      ),
                    )
                    : widget.state.data.searchIsOn &&
                        !widget.state.data.searchIsStart
                    ? HomeRecentComponent(
                      size: widget.size,
                      state: widget.state,
                      hasBeenDisconnected: false,
                    )
                    : HomeSearchItemComponent(
                      size: widget.size,
                      state: widget.state,
                      hasBeenDisconnected: false,
                      isDesktop: widget.isDesktop,
                    ),
          ),
        ),
      ),
    );
  }

  Widget nameItem(BuildContext context) {
    String fullName = widget.state.data.name ?? '';
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

    return Row(
      children: [
        CircleAvatar(
          backgroundColor: ColorConstant.greyColor8,
          radius: 20,
          child: Image.asset(
            "assets/images/img_app_logo.png",
            width: 30,
            height: 30,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "Hi, $result",
          style: FontFamilyConstant.primaryFont.copyWith(
            color: ColorConstant.blackColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
