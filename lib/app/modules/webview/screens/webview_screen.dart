import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '/path.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({
    super.key,
    required this.title,
    required this.link,
    this.fromSignUp,
    this.fromCreatePW,
  });

  final String title;
  final String link;
  final bool? fromSignUp;
  final bool? fromCreatePW;

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late WebViewController _controller;
  bool isControllerReady = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        if (widget.fromSignUp == true) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/sign-up',
            (route) => false,
          );
        } else if (widget.fromCreatePW == true) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUpPasswordScreen(),
            ),
            (route) => false,
          );
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/profile',
            (route) => false,
          );
        }
      },
      child: Scaffold(
        backgroundColor: ColorConstant.whiteColor,
        appBar: AppBar(
          backgroundColor: ColorConstant.whiteColor,
          leading: IconButton(
            onPressed: () {
              if (widget.fromSignUp == true) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/sign-up',
                  (route) => false,
                );
              } else if (widget.fromCreatePW == true) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpPasswordScreen(),
                  ),
                  (route) => false,
                );
              } else {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/profile',
                  (route) => false,
                );
              }
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: Text(
            widget.title,
            style: FontFamilyConstant.primaryFont.copyWith(
              fontSize: size.width < 600 ? 18 : 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: isControllerReady
            ? WebViewWidget(
                controller: _controller
                  ..loadRequest(
                    Uri.parse(widget.link),
                  ),
              )
            : Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: ColorConstant.primaryColor,
                  size: 32,
                ),
              ),
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      late final PlatformWebViewControllerCreationParams params;
      params = WebViewPlatform.instance is WebKitWebViewPlatform
          ? WebKitWebViewControllerCreationParams(
              allowsInlineMediaPlayback: true,
            )
          : const PlatformWebViewControllerCreationParams();
      final WebViewController controller = WebViewController.fromPlatformCreationParams(params);
      controller.setJavaScriptMode(JavaScriptMode.unrestricted);
      // set text zoom in android tab
      if (controller.platform is AndroidWebViewController) {
        AndroidWebViewController.enableDebugging(true);
        (controller.platform as AndroidWebViewController).setTextZoom(100);
      }
      // solusi 1 = set user agent menjadi macos/desktop
      if (controller.platform is WebKitWebViewController) {
        (controller.platform as WebKitWebViewController).setUserAgent(
          'Mozilla/5.0 (iPad; CPU OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/95.0.4638.50 Mobile/15E148 Safari/604.1',
        );
      }
      setState(() {
        _controller = controller;
        isControllerReady = true;
      });
    });
    super.initState();
  }
}
