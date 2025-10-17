import 'package:flutter/material.dart';

import 'package:form_validator/form_validator.dart';
import 'package:marketplace/features/presentation/widgets/app_text_field/app_text_field.dart';

class AppEmailField extends StatelessWidget {
  final TextEditingController controller;
  final bool? enabled;

  const AppEmailField({
    super.key,
    required this.controller,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: 'Email',
      child: TextFormField(
        enabled: enabled,
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(hintText: 'Enter your email address'),
        validator: ValidationBuilder()
            .required('Email address is required.')
            .email('Please enter a valid email address.')
            .maxLength(100, 'Email address must be less than 100 characters.')
            .build(),
      ),
    );
  }
}
