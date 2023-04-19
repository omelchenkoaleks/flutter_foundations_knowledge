import 'package:flutter/material.dart';
import 'package:flutter_foundations_knowledge/src/utils/currency_formatter.dart';

class CartTotalText extends StatelessWidget {
  const CartTotalText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Read from data source
    const cartTotal = 104.0;
    // TODO: Inject formatter
    final totalFormatted = kCurrencyFormatter.format(cartTotal);
    return Text(
      'Total: $totalFormatted',
      style: Theme.of(context).textTheme.headline5,
      textAlign: TextAlign.center,
    );
  }
}
