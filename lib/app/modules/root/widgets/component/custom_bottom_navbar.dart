import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/path.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({
    super.key,
    required this.size,
    this.index,
    required this.indexs,
  });

  final Size size;
  final int? index;
  final List<int> indexs;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavbarCubit, BottomNavbarState>(
      builder: (context, state) {
        if (state is BottomNavbarChanged) {
          return Container(
            color: ColorConstant.blackColor,
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _item(
                  0,
                  state,
                  context,
                  "assets/icons/svg/ic_home.svg",
                  "Home",
                ),
                _item(
                  1,
                  state,
                  context,
                  "assets/icons/svg/ic_category.svg",
                  "Catalog",
                ),
                // _item(
                //   2,
                //   state,
                //   context,
                //   "assets/icons/svg/ic_category.svg",
                //   "Catalog",
                // ),
                _item(
                  2,
                  state,
                  context,
                  "assets/icons/svg/ic_profile.svg",
                  "Profile",
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _item(
    int index,
    BottomNavbarChanged state,
    BuildContext context,
    String icon,
    String title,
  ) {
    return InkWell(
      onTap: () {
        context.read<BottomNavbarCubit>().changeIndex(index);
        indexs.add(index);
      },
      child: Container(
        width: size.width * 0.25,
        decoration: BoxDecoration(
          color: ColorConstant.blackColor,
        ),
        child: SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(5.5),
            child: Container(
              decoration: BoxDecoration(
                color: state.index == index ? ColorConstant.blueColor : ColorConstant.blackColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    icon,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  if (state.index == index)
                    Text(
                      title,
                      style: TextStyle(
                        color: ColorConstant.whiteColor,
                        fontSize: size.width < 600 ? 12 : 18,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
