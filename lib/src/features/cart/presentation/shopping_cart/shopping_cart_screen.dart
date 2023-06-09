import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_foundations_knowledge/src/common_widgets/primary_button.dart';
import 'package:flutter_foundations_knowledge/src/features/cart/presentation/shopping_cart/shopping_cart_item.dart';
import 'package:flutter_foundations_knowledge/src/features/cart/presentation/shopping_cart/shopping_cart_items_builder.dart';
import 'package:flutter_foundations_knowledge/src/localization/string_hardcoded.dart';
import 'package:flutter_foundations_knowledge/src/features/cart/domain/item.dart';
import 'package:flutter_foundations_knowledge/src/routing/app_router.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'.hardcoded),
      ),
      body: ShoppingCartItemsBuilder(
        items: cartItemsList,
        itemBuilder: (_, item, index) => ShoppingCartItem(
          item: item,
          itemIndex: index,
        ),
        ctaBuilder: (_) => PrimaryButton(
          text: 'Checkout'.hardcoded,
          onPressed: () => context.pushNamed(AppRoute.checkout.name),
        ),
      ),
    );
  }
}
