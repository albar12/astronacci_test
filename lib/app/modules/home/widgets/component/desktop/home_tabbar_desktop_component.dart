import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

class HomeTabbarDesktopComponent extends StatelessWidget {
  const HomeTabbarDesktopComponent({
    super.key,
    this.controller,
    required this.state,
    required this.pageController,
  });
  final TabController? controller;
  final HomeState state;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    return Container();
    //  TabBar(
    //   controller: controller,
    //   isScrollable: state.data.tabList!.length > 1 ? false : true,
    //   indicator: const BoxDecoration(),
    //   dividerHeight: 1,
    //   dividerColor: Colors.grey.shade300,
    //   tabs: state.data.tabList!.map((title) {
    //     int index = state.data.tabList!.indexOf(title);
    //     return _item(
    //       title,
    //       state.data.indexTab == index,
    //     );
    //   }).toList(),
    //   onTap: (value) {
    //     pageController.animateToPage(
    //       value,
    //       duration: const Duration(milliseconds: 300),
    //       curve: Curves.ease,
    //     );
    //     context.read<HomeCubit>().changeIndexTab(value);
    //   },
    // );
  }

  // Widget _item(String title, bool isActive) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 0.0),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Text(
  //           title,
  //           style: FontFamilyConstant.primaryFont.copyWith(
  //             fontWeight: FontWeight.w900,
  //             fontSize: 20,
  //             color:
  //                 isActive
  //                     ? ColorConstant.primaryColor
  //                     : ColorConstant.blackColor,
  //           ),
  //         ),
  //         const SizedBox(height: 5),
  //         Visibility(
  //           visible: isActive,
  //           child: SizedBox(
  //             width: 50,
  //             child: Divider(
  //               color: ColorConstant.primaryColor,
  //               height: 1,
  //               thickness: 3,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
