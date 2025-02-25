import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '/path.dart';

class HomeContentTablet extends StatelessWidget {
  const HomeContentTablet({
    super.key,
    required this.size,
    required this.state,
    this.controller,
    required this.scrollController,
    required this.sectionKey1,
    required this.sectionTopKey,
    required this.pageController,
    required this.isDesktop,
    required this.firstReload,
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

  @override
  Widget build(BuildContext context) {
    RefreshController refreshController = RefreshController();
    List<Widget> oneTabs = [
      HomeBooklistDesktopComponent(size: size, state: state),
    ];

    List<Widget> doubleTabs = [
      HomeBooklistDesktopComponent(size: size, state: state),
      HomeBundleDesktopComponent(size: size, state: state),
    ];
    return DefaultTabController(
      length: state.data.tabList?.length ?? 1,
      initialIndex: state.data.indexTab,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: NestedScrollView(
            controller: scrollController,
            headerSliverBuilder: (
              BuildContext context,
              bool innerBoxIsScrolled,
            ) {
              return <Widget>[
                SliverAppBar(
                  key: sectionTopKey,
                  backgroundColor: ColorConstant.whiteColor,
                  expandedHeight: state.data.searchIsStart ? 58.0 : 470.0,
                  collapsedHeight: state.data.searchIsStart ? 58.0 : 470.0,
                  flexibleSpace: Column(
                    children: [
                      state.data.searchIsOn == false
                          ? InkWell(
                            child: Row(
                              children: [
                                nameItem(context),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    // context.read<HomeCubit>().searchIsOn(true);
                                  },
                                  icon: Icon(
                                    Icons.search,
                                    size: 35,
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
                            state: state,
                            size: size,
                            firstReload: firstReload,
                          ),
                      const SizedBox(height: 15),
                      Visibility(
                        visible: !state.data.searchIsStart ? true : false,
                        child: HomeHeaderTabletComponent(
                          state: state,
                          size: size,
                          sectionKey1: sectionKey1,
                        ),
                      ),
                    ],
                  ),
                  bottom:
                      !state.data.searchIsStart
                          ? PreferredSize(
                            preferredSize:
                                state.data.tabList == null ||
                                        state.data.tabList?.length == 1
                                    ? const Size.fromHeight(0.0)
                                    : const Size.fromHeight(
                                      20.0,
                                    ), // Tentukan tinggi sesuai kebutuhan
                            child: Visibility(
                              visible:
                                  state.data.tabList == null ||
                                          state.data.tabList?.length == 1
                                      ? false
                                      : true,
                              child: HomeTabbarDesktopComponent(
                                controller: DefaultTabController.of(context),
                                state: state,
                                pageController: pageController,
                              ),
                            ),
                          )
                          : null,
                ),
              ];
            },
            body:
                !state.data.searchIsStart
                    ? Visibility(
                      visible: state.data.tabList == null ? false : true,
                      child: PageView(
                        controller: pageController,
                        key: sectionKey1,
                        children:
                            (state.data.tabList != null &&
                                    state.data.tabList!.length > 1)
                                ? doubleTabs
                                : oneTabs,
                        onPageChanged: (value) {
                          // context.read<HomeCubit>().changeIndexTab(value);
                        },
                      ),
                    )
                    : state.data.searchIsStart
                    ? HomeSearchItemComponent(
                      size: size,
                      state: state,
                      hasBeenDisconnected: false,
                      isDesktop: isDesktop,
                    )
                    : HomeRecentComponent(
                      size: size,
                      state: state,
                      hasBeenDisconnected: false,
                    ),
          ),
        ),
      ),
    );
  }

  Widget nameItem(BuildContext context) {
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

    return Row(
      children: [
        CircleAvatar(
          backgroundColor: ColorConstant.greyColor8,
          radius: 30,
          child: Image.asset(
            "assets/images/img_app_logo.png",
            width: 40,
            height: 40,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "Hi, $result",
          style: FontFamilyConstant.primaryFont.copyWith(
            color: ColorConstant.blackColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
