import 'package:go_router/go_router.dart';

import 'package:flutter_foundations_knowledge/src/features/shopping_cart/shopping_cart_screen.dart';
import 'package:flutter_foundations_knowledge/src/features/product_list/product_list_screen.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ProductsListScreen(),
      routes: [
        GoRoute(
          path: 'cart',
          builder: (context, state) => const ShoppingCartScreen(),
        ),
      ],
    ),
  ],
);
