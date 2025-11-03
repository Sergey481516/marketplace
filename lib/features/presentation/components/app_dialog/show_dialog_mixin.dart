import 'package:flutter/material.dart';

import 'app_dialog.dart';

mixin ShowDialogMixin<T extends StatefulWidget> on State<T> {
  void showSuccessDialog({
    String? title,
    required String description,
    required String okButtonText,
    required VoidCallback onOk,
  }) {
    showDialog(
      context: context,
      builder: (_) => AppDialog.success(
        title: title,
        description: description,
        okButtonText: okButtonText,
        onOk: onOk,
      ),
    );
  }

  void showErrorDialog({
    String? title,
    String? description,
    String? okButtonText,
    required VoidCallback onOk,
  }) {
    showDialog(
      context: context,
      builder: (_) => AppDialog.error(
        title: title,
        description:
            description ?? 'An error occurred, please try again later.',
        okButtonText: okButtonText ?? 'Ok',
        onOk: onOk,
      ),
    );
  }
}
