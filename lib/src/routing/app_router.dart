import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_foundations_knowledge/src/features/sign_in/email_password_sign_in_state.dart';
import 'package:flutter_foundations_knowledge/src/features/sign_in/email_password_sign_in_screen.dart';
import 'package:flutter_foundations_knowledge/src/features/account/account_screen.dart';
import 'package:flutter_foundations_knowledge/src/features/order_list/orders_list_screen.dart';
import 'package:flutter_foundations_knowledge/src/features/shopping_cart/shopping_cart_screen.dart';
import 'package:flutter_foundations_knowledge/src/features/product_list/product_list_screen.dart';

enum AppRoute {
  home,
  cart,
  orders,
  account,
  signIn,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const ProductsListScreen(),
      routes: [
        GoRoute(
          path: 'cart',
          name: AppRoute.cart.name,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            fullscreenDialog: true,
            child: const ShoppingCartScreen(),
          ),
        ),
        GoRoute(
          path: 'orders',
          name: AppRoute.orders.name,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            fullscreenDialog: true,
            child: const OrdersListScreen(),
          ),
        ),
        GoRoute(
          path: 'account',
          name: AppRoute.account.name,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            fullscreenDialog: true,
            child: const AccountScreen(),
          ),
        ),
        GoRoute(
          path: 'signIn',
          name: AppRoute.signIn.name,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            fullscreenDialog: true,
            child: const EmailPasswordSignInScreen(
              formType: EmailPasswordSignInFormType.signIn,
            ),
          ),
        ),
      ],
    ),
  ],
);