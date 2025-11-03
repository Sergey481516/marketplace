import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:marketplace/config/theme/app_colors.dart';
import 'package:marketplace/config/theme/app_typography.dart';

class AppDialog extends StatelessWidget {
  final String iconPath;
  final Color iconColor;
  final String? title;
  final String description;
  final String okButtonText;
  final VoidCallback onOk;

  const AppDialog._({
    super.key,
    required this.iconPath,
    required this.iconColor,
    this.title,
    required this.description,
    required this.okButtonText,
    required this.onOk,
  });

  factory AppDialog.success({
    String? title,
    required String description,
    required String okButtonText,
    required VoidCallback onOk,
  }) {
    return AppDialog._(
      iconPath: 'assets/icons/Check-duotone.svg',
      iconColor: AppColors.success,
      title: title,
      description: description,
      okButtonText: okButtonText,
      onOk: onOk,
    );
  }

  factory AppDialog.error({
    String? title,
    required String description,
    required String okButtonText,
    required VoidCallback onOk,
  }) {
    return AppDialog._(
      iconPath: 'assets/icons/WarningCircle.svg',
      iconColor: AppColors.error,
      title: title,
      description: description,
      okButtonText: okButtonText,
      onOk: onOk,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          SizedBox(
            width: 68,
            height: 68,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: const Color(0xFFED1010).withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                ),

                SvgPicture.asset(
                  iconPath,
                  width: 68,
                  height: 68,
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                ),

                if (title != null) Text(title!),
              ],
            ),
          ),

          const SizedBox(height: 12),

          Text(
            description,
            textAlign: TextAlign.center,
            style: AppTypography.body2Medium,
          ),
        ],
      ),

      content: FilledButton(
        onPressed: () {
          onOk();
        },
        child: Text(okButtonText),
      ),
    );
  }
}
