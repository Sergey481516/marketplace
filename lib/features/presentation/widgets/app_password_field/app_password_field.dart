import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';

import 'package:marketplace/config/theme/app_colors.dart';
import 'package:marketplace/features/presentation/widgets/app_text_field/app_text_field.dart';

class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
    super.key,
    required this.controller,
    this.label = 'Password',
    this.hintText = 'Enter your password',
    this.enabled,
  });

  final TextEditingController controller;

  final String label;
  final String hintText;
  final bool? enabled;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool showPassword = false;

  Widget _icon() {
    if (!showPassword) {
      return SvgPicture.asset(
        'assets/icons/eye-off.svg',
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(AppColors.primary[400]!, BlendMode.srcIn),
      );
    }

    return SvgPicture.asset(
      'assets/icons/Eye.svg',
      width: 24,
      height: 24,
      colorFilter: ColorFilter.mode(AppColors.primary[900]!, BlendMode.srcIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: widget.label,
      child: TextFormField(
        enabled: widget.enabled,
        controller: widget.controller,
        obscureText: !showPassword,
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: SizedBox(
            width: 24,
            height: 24,
            child: IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: _icon(),
            ),
          ),
        ),
        validator: ValidationBuilder()
            .required('Password is required.')
            .minLength(8, 'Password must be at least 8 characters long.')
            .maxLength(20, 'Password must be no more than 20 characters long.')
            .build(),
      ),
    );
  }
}
