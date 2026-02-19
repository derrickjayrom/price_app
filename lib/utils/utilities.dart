import 'package:flutter/material.dart';

class Utils {
  static String normalizeStringToLowerCase(String value) {
    return value.trim().toLowerCase();
  }
}

Future<dynamic> openFilterBottomSheet({
  required BuildContext context,
  required Widget child,
}) {
  final rootContext = rootNavigatorContext(context);
  return showModalBottomSheet(
    context: rootContext,
    isScrollControlled: false,
    backgroundColor: Colors.transparent,
    builder: (_) => child,
  );
}

BuildContext rootNavigatorContext(BuildContext currentContext) {
  return Navigator.of(currentContext, rootNavigator: true).context;
}
