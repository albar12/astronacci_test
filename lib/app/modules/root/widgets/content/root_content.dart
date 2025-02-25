import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';

import '/path.dart';

class RootContent extends StatelessWidget {
  const RootContent({
    super.key,
    required this.widget,
    required this.screens,
    required this.indexs,
  });

  final RootScreen widget;
  final List<Widget> screens;
  final List<int> indexs;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavbarCubit, BottomNavbarState>(
      builder: (context, state) {
        if (state is BottomNavbarChanged) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: LazyIndexedStack(
              index: state.index,
              key: ValueKey<int>(state.index),
              children: screens,
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
