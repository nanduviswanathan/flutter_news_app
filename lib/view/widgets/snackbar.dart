import 'package:flutter/material.dart';

import '../../shared/constants/constants.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnackBar(
  BuildContext context,
  String message,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: Constants.dismissText,
        onPressed: () => ScaffoldMessengerState().removeCurrentSnackBar(),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}
