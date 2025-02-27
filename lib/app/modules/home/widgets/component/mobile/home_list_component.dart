import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '/path.dart';

class HomelistComponent extends StatelessWidget {
  const HomelistComponent({
    super.key,
    required this.size,
    required this.state,
    required this.refreshController,
    this.onRefresh,
    this.onLoading,
  });
  final Size size;
  final HomeState state;
  final RefreshController refreshController;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoading;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: true,
      enablePullUp: state.data.enablePullUp ?? true,
      onRefresh: onRefresh,
      onLoading: onLoading,
      child: ListView.builder(
        itemCount: state.data.users?.length ?? 0,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: _items(context, state.data.users![index]),
          );
        },
      ),
    );
  }

  Widget _items(BuildContext context, User user) {
    return InkWell(
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1.0, color: ColorConstant.primaryColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: ColorConstant.blueColor,
                child: Text(
                  user.nama[0].toString(),
                  style: FontFamilyConstant.primaryFont.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(width: 10),
              _footer(user),
            ],
          ),
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                content: HomeDetailComponent(
                  size: size,
                  state: state,
                  user: user,
                ),
                actions: <Widget>[
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstant.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        Navigator.of(context).pop(false);
                      },
                      child: Text(
                        "Tutup",
                        style: FontFamilyConstant.primaryFont.copyWith(
                          color: ColorConstant.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        );
      },
    );
  }

  Widget _footer(User user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user.nama,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: FontFamilyConstant.primaryFont.copyWith(
            color: ColorConstant.primaryColor,
            fontSize: 14,
          ),
        ),
        Divider(height: 1.5, thickness: 5, color: ColorConstant.blackColor),
        Text(
          user.email,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: FontFamilyConstant.primaryFont.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
