import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '/path.dart';

class CustomRefresh extends StatelessWidget {
  const CustomRefresh({
    super.key,
    required this.child,
    required this.onLoading,
    required this.onRefresh,
    required this.refreshController,
    this.footer,
  });

  final Widget child;
  final Widget? footer;
  final Function()? onRefresh;
  final Function()? onLoading;
  final RefreshController refreshController;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      header: WaterDropMaterialHeader(
        color: ColorConstant.primaryColor,
        backgroundColor: ColorConstant.whiteColor,
      ),
      footer: CustomFooter(
        builder: (context, mode) {
          if (mode == LoadStatus.loading || mode == LoadStatus.idle) {
            return footer ??
                const ClassicFooter(
                  loadStyle: LoadStyle.ShowWhenLoading,
                  completeDuration: Duration(milliseconds: 500),
                );
          }
          return Center(
            child: Text(
              '',
              style: FontFamilyConstant.primaryFont.copyWith(
                color: ColorConstant.greyColor1,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
      ),
      onRefresh: onRefresh,
      onLoading: onLoading,
      enablePullDown: true,
      enablePullUp: onLoading != null ? true : false,
      child: child,
    );
  }
}
