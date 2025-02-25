import 'dart:async';

import 'package:flutter/material.dart';

mixin AfterRenderMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      afterRender(context);
    });
  }

  FutureOr<void> afterRender(BuildContext context);
}
