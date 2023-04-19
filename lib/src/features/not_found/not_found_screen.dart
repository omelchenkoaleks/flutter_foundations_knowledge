import 'package:flutter/material.dart';

import 'package:flutter_foundations_knowledge/src/features/not_found/empty_placeholder_widget.dart';
import 'package:flutter_foundations_knowledge/src/localization/string_hardcoded.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: EmptyPlaceholderWidget(
        message: '404 - Page not found!'.hardcoded,
      ),
    );
  }
}
