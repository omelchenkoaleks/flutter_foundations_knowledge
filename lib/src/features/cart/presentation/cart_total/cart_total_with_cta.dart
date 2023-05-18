import 'package:flutter/material.dart';

import 'package:flutter_foundations_knowledge/src/features/cart/presentation/cart_total/cart_total_text.dart';
import 'package:flutter_foundations_knowledge/src/constants/app_sizes.dart';

class CartTotalWithCTA extends StatelessWidget {
  const CartTotalWithCTA({Key? key, required this.ctaBuilder})
      : super(key: key);
  final WidgetBuilder ctaBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CartTotalText(),
        gapH8,
        ctaBuilder(context),
        gapH8,
      ],
    );
  }
}
