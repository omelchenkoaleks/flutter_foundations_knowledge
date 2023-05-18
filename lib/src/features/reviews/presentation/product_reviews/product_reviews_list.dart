import 'package:flutter/material.dart';

import 'package:flutter_foundations_knowledge/src/common_widgets/responsive_center.dart';
import 'package:flutter_foundations_knowledge/src/constants/app_sizes.dart';
import 'package:flutter_foundations_knowledge/src/constants/breakpoints.dart';
import 'package:flutter_foundations_knowledge/src/features/reviews/presentation/product_reviews/product_review_card.dart';
import 'package:flutter_foundations_knowledge/src/features/reviews/domain/review.dart';

class ProductReviewsList extends StatelessWidget {
  const ProductReviewsList({Key? key, required this.productId})
      : super(key: key);
  final String productId;
  @override
  Widget build(BuildContext context) {
    // TODO: Read from data source
    final reviews = <Review>[
      Review(
        date: DateTime(2022, 2, 12),
        score: 4.5,
        comment: 'Great product, would buy again!',
      ),
      Review(
        date: DateTime(2022, 2, 10),
        score: 4.0,
        comment: 'Looks great but the packaging was damaged.',
      ),
    ];
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => ResponsiveCenter(
          maxContentWidth: Breakpoint.tablet,
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p16, vertical: Sizes.p8),
          child: ProductReviewCard(reviews[index]),
        ),
        childCount: reviews.length,
      ),
    );
  }
}
