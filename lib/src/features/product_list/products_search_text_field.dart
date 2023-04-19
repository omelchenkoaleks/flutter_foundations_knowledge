import 'package:flutter/material.dart';

import 'package:flutter_foundations_knowledge/src/localization/string_hardcoded.dart';

class ProductsSearchTextField extends StatefulWidget {
  const ProductsSearchTextField({Key? key}) : super(key: key);

  @override
  State<ProductsSearchTextField> createState() =>
      _ProductsSearchTextFieldState();
}

class _ProductsSearchTextFieldState extends State<ProductsSearchTextField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _controller,
      builder: (context, value, _) {
        return TextField(
          controller: _controller,
          autofocus: false,
          style: Theme.of(context).textTheme.headline6,
          decoration: InputDecoration(
            hintText: 'Search products'.hardcoded,
            icon: const Icon(Icons.search),
            suffixIcon: value.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      _controller.clear();
                      // TODO: Clear search state
                    },
                    icon: const Icon(Icons.clear),
                  )
                : null,
          ),
          // TODO: Implement onChanged
          onChanged: null,
        );
      },
    );
  }
}
