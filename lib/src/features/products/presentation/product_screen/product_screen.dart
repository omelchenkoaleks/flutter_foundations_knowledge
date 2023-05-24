import 'package:flutter/material.dart';

import 'package:flutter_foundations_knowledge/src/common_widgets/custom_image.dart';
import 'package:flutter_foundations_knowledge/src/common_widgets/responsive_center.dart';
import 'package:flutter_foundations_knowledge/src/common_widgets/responsive_two_column_layout.dart';
import 'package:flutter_foundations_knowledge/src/constants/app_sizes.dart';
import 'package:flutter_foundations_knowledge/src/constants/test_products.dart';
import 'package:flutter_foundations_knowledge/src/features/products/data/fake_products_repository.dart';
import 'package:flutter_foundations_knowledge/src/features/products/presentation/home_app_bar/home_app_bar.dart';
import 'package:flutter_foundations_knowledge/src/common_widgets/empty_placeholder_widget.dart';
import 'package:flutter_foundations_knowledge/src/features/cart/presentation/add_to_cart/add_to_cart_widget.dart';
import 'package:flutter_foundations_knowledge/src/features/products/presentation/product_screen/leave_review_action.dart';
import 'package:flutter_foundations_knowledge/src/features/products/presentation/product_screen/product_average_rating.dart';
import 'package:flutter_foundations_knowledge/src/features/reviews/presentation/product_reviews/product_reviews_list.dart';
import 'package:flutter_foundations_knowledge/src/localization/string_hardcoded.dart';
import 'package:flutter_foundations_knowledge/src/features/products/domain/product.dart';
import 'package:flutter_foundations_knowledge/src/utils/currency_formatter.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.productId}) : super(key: key);
  final String productId;

  @override
  Widget build(BuildContext context) {
    // TODO: Read from data source
    final product = FakeProductsRepository.instance.getProduct(productId);
    return Scaffold(
      appBar: const HomeAppBar(),
      body: product == null
          ? EmptyPlaceholderWidget(
              message: 'Product not found'.hardcoded,
            )
          : CustomScrollView(
              slivers: [
                ResponsiveSliverCenter(
                  padding: const EdgeInsets.all(Sizes.p16),
                  child: ProductDetails(product: product),
                ),
                ProductReviewsList(productId: productId),
              ],
            ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    final priceFormatted = kCurrencyFormatter.format(product.price);
    return ResponsiveTwoColumnLayout(
      startContent: Card(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: CustomImage(imageUrl: product.imageUrl),
        ),
      ),
      spacing: Sizes.p16,
      endContent: Card(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(product.title, style: Theme.of(context).textTheme.headline6),
              gapH8,
              Text(product.description),
              // Only show average if there is at least one rating
              if (product.numRatings >= 1) ...[
                gapH8,
                ProductAverageRating(product: product),
              ],
              gapH8,
              const Divider(),
              gapH8,
              Text(priceFormatted,
                  style: Theme.of(context).textTheme.headline5),
              gapH8,
              LeaveReviewAction(productId: product.id),
              const Divider(),
              gapH8,
              AddToCartWidget(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
