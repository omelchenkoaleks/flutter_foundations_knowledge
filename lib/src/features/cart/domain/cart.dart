import 'package:flutter_foundations_knowledge/src/features/products/domain/product.dart';
import 'package:flutter_foundations_knowledge/src/features/cart/domain/item.dart';

class Cart {
  const Cart([this.items = const {}]);

  final Map<ProductID, int> items;
}

extension CartItems on Cart {
  List<Item> toItemsList() {
    return items.entries.map((entry) {
      return Item(
        productId: entry.key,
        quantity: entry.value,
      );
    }).toList();
  }
}
