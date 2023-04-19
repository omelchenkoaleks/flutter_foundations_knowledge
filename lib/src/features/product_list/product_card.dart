import 'package:flutter/material.dart';

import 'package:flutter_foundations_knowledge/src/common_widgets/custom_image.dart';
import 'package:flutter_foundations_knowledge/src/constants/app_sizes.dart';
import 'package:flutter_foundations_knowledge/src/features/product_page/product_average_rating.dart';
import 'package:flutter_foundations_knowledge/src/localization/string_hardcoded.dart';
import 'package:flutter_foundations_knowledge/src/models/product.dart';
import 'package:flutter_foundations_knowledge/src/utils/currency_formatter.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product, this.onPressed})
      : super(key: key);
  final Product product;
  final VoidCallback? onPressed;

  static const productCardKey = Key('product-card');

  @override
  Widget build(BuildContext context) {
    // TODO: Inject formatter
    final priceFormatted = kCurrencyFormatter.format(product.price);
    return Card(
      child: InkWell(
        key: productCardKey,
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomImage(imageUrl: product.imageUrl),
              gapH8,
              const Divider(),
              gapH8,
              Text(product.title, style: Theme.of(context).textTheme.headline6),
              if (product.numRatings >= 1) ...[
                gapH8,
                ProductAverageRating(product: product),
              ],
              gapH24,
              Text(priceFormatted,
                  style: Theme.of(context).textTheme.headline5),
              gapH4,
              Text(
                product.availableQuantity <= 0
                    ? 'Out of Stock'.hardcoded
                    : 'Quantity: ${product.availableQuantity}'.hardcoded,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        ),
      ),
    );
  }
}
