import 'package:flutter/material.dart';

import 'package:flutter_foundations_knowledge/src/constants/app_sizes.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {Key? key, required this.text, this.style, this.onPressed})
      : super(key: key);
  final String text;
  final TextStyle? style;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.p48,
      child: TextButton(
        child: Text(
          text,
          style: style,
          textAlign: TextAlign.center,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
