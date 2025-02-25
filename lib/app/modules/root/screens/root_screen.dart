import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/path.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({
    super.key,
    this.indexsRoot,
  });

  final List<int>? indexsRoot;

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  List<Widget> screens = const [
    HomeScreen(),
    ProfileScreen(),
  ];

  List<int> indexs = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }

        final bool shouldPop = await _backDialog(context) ?? false;

        // if (indexs.length > 1) {
        //   indexs.removeLast();
        //   context.read<BottomNavbarCubit>().changeIndex(indexs[indexs.length - 1]);
        // } else {
        //   final bool shouldPop = await _backDialog(context) ?? false;
        //   if (context.mounted && shouldPop) {
        //     Navigator.pop(context);
        //   }
        // }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstant.whiteColor,
          body: RootContent(
            widget: widget,
            screens: screens,
            indexs: indexs,
          ),
          bottomNavigationBar: CustomBottomNavbar(
            size: size,
            indexs: indexs,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    indexs.add(0);
    super.initState();
  }

  Future<dynamic> _backDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(
          Icons.info_outline_rounded,
          size: 50,
          color: ColorConstant.redColor,
        ),
        title: const Text('Ingin keluar aplikasi?'),
        content: const Text('Apa Anda yakin ingin keluar aplikasi?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Kembali tanpa konfirmasi
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else if (Platform.isIOS) {
                exit(0);
              } // Konfirmasi untuk kembali
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
