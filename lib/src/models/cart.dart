import 'package:flutter_foundations_knowledge/src/models/item.dart';
import 'package:flutter_foundations_knowledge/src/models/product.dart';

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
