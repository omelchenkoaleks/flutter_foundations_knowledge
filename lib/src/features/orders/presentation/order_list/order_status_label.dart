import 'package:flutter/material.dart';

import 'package:flutter_foundations_knowledge/src/localization/string_hardcoded.dart';
import 'package:flutter_foundations_knowledge/src/features/orders/domain/order.dart';

class OrderStatusLabel extends StatelessWidget {
  const OrderStatusLabel({Key? key, required this.order}) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1!;
    switch (order.orderStatus) {
      case OrderStatus.confirmed:
        return Text(
          'Confirmed - preparing for delivery'.hardcoded,
          style: textStyle,
        );
      case OrderStatus.shipped:
        return Text(
          'Shipped'.hardcoded,
          style: textStyle,
        );
      case OrderStatus.delivered:
        return Text(
          'Delivered'.hardcoded,
          style: textStyle.copyWith(color: Colors.green),
        );
    }
  }
}
