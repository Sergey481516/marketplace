import 'package:flutter/material.dart';

import 'package:marketplace/features/presentation/widgets/app_text_field/app_text_field.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  // TODO SearchBar??
  @override
  Widget build(BuildContext context) {
    return AppTextField(
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Search for clothes...'),
      ),
    );
  }
}
