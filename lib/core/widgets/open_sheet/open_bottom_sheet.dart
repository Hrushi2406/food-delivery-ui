import 'package:flutter/material.dart';

Future<void> openBottomSheet({
  required BuildContext context,
  required Widget child,
  Color? backgroundColor,
}) async {
  await showModalBottomSheet(
    context: context,
    backgroundColor:
        backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
    enableDrag: true,
    builder: (context) => child,
  );
}
