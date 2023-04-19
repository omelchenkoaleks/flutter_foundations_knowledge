import 'package:flutter_foundations_knowledge/src/models/product.dart';

class Item {
  const Item({
    required this.productId,
    required this.quantity,
  });
  final ProductID productId;
  final int quantity;
}
