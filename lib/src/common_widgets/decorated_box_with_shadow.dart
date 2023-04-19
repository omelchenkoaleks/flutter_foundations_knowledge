import 'package:flutter/material.dart';

import 'package:flutter_foundations_knowledge/src/constants/app_sizes.dart';

class DecoratedBoxWithShadow extends StatelessWidget {
  const DecoratedBoxWithShadow({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: child,
      ),
    );
  }
}
