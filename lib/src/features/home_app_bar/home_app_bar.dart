import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_foundations_knowledge/src/routing/app_router.dart';
import 'package:flutter_foundations_knowledge/src/common_widgets/action_text_button.dart';
import 'package:flutter_foundations_knowledge/src/constants/breakpoints.dart';
import 'package:flutter_foundations_knowledge/src/features/home_app_bar/more_menu_button.dart';
import 'package:flutter_foundations_knowledge/src/features/home_app_bar/shopping_cart_icon.dart';
import 'package:flutter_foundations_knowledge/src/localization/string_hardcoded.dart';
import 'package:flutter_foundations_knowledge/src/models/app_user.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: get user from auth repository
    const user = AppUser(uid: '123', email: 'test@test.com');
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < Breakpoint.tablet) {
      return AppBar(
        title: Text('My Shop'.hardcoded),
        actions: const [
          ShoppingCartIcon(),
          MoreMenuButton(user: user),
        ],
      );
    } else {
      return AppBar(
        title: Text('My Shop'.hardcoded),
        actions: [
          const ShoppingCartIcon(),
          if (user != null) ...[
            ActionTextButton(
              key: MoreMenuButton.ordersKey,
              text: 'Orders'.hardcoded,
              onPressed: () => context.pushNamed(AppRoute.orders.name),
            ),
            ActionTextButton(
              key: MoreMenuButton.accountKey,
              text: 'Account'.hardcoded,
              onPressed: () => context.pushNamed(AppRoute.account.name),
            ),
          ] else
            ActionTextButton(
              key: MoreMenuButton.signInKey,
              text: 'Sign In'.hardcoded,
              onPressed: () => context.pushNamed(AppRoute.signIn.name),
            )
        ],
      );
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
