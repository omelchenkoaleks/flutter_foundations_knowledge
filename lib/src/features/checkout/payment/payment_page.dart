import 'package:flutter/material.dart';

import 'package:flutter_foundations_knowledge/src/features/checkout/payment/payment_button.dart';
import 'package:flutter_foundations_knowledge/src/features/cart/presentation/shopping_cart/shopping_cart_item.dart';
import 'package:flutter_foundations_knowledge/src/features/cart/presentation/shopping_cart/shopping_cart_items_builder.dart';
import 'package:flutter_foundations_knowledge/src/features/cart/domain/item.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Listen to cart changes on checkout and update the UI.
    // TODO: Read from data source
    const cartItemsList = [
      Item(
        productId: '1',
        quantity: 1,
      ),
      Item(
        productId: '2',
        quantity: 2,
      ),
      Item(
        productId: '3',
        quantity: 3,
      ),
    ];

    return ShoppingCartItemsBuilder(
      items: cartItemsList,
      itemBuilder: (_, item, index) => ShoppingCartItem(
        item: item,
        itemIndex: index,
        isEditable: false,
      ),
      ctaBuilder: (_) => const PaymentButton(),
    );
  }
}
