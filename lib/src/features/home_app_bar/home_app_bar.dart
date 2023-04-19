import 'package:flutter/material.dart';

import 'package:flutter_foundations_knowledge/src/common_widgets/action_text_button.dart';
import 'package:flutter_foundations_knowledge/src/constants/breakpoints.dart';
import 'package:flutter_foundations_knowledge/src/features/account/account_screen.dart';
import 'package:flutter_foundations_knowledge/src/features/home_app_bar/more_menu_button.dart';
import 'package:flutter_foundations_knowledge/src/features/home_app_bar/shopping_cart_icon.dart';
import 'package:flutter_foundations_knowledge/src/features/order_list/orders_list_screen.dart';
import 'package:flutter_foundations_knowledge/src/features/sign_in/email_password_sign_in_screen.dart';
import 'package:flutter_foundations_knowledge/src/features/sign_in/email_password_sign_in_state.dart';
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
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (_) => const OrdersListScreen(),
                ),
              ),
            ),
            ActionTextButton(
              key: MoreMenuButton.accountKey,
              text: 'Account'.hardcoded,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (_) => const AccountScreen(),
                ),
              ),
            ),
          ] else
            ActionTextButton(
              key: MoreMenuButton.signInKey,
              text: 'Sign In'.hardcoded,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (_) => const EmailPasswordSignInScreen(
                    formType: EmailPasswordSignInFormType.signIn,
                  ),
                ),
              ),
            )
        ],
      );
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
