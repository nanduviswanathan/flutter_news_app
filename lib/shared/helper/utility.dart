//This class serves as the Utility class for the App.
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../constants/constants.dart';

class Utility {
  static String? validateEmail(String value) {
    RegExp regex = RegExp(Constants.emailRegex);
    if (value.isEmpty) {
      return Constants.requiredText;
    } else if (!regex.hasMatch(value)) {
      return Constants.enterValidEmailText;
    }
    return null;
  }

  //validate name
  static String? validateName(String value) {
    if (value.isEmpty) {
      return Constants.requiredText;
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return Constants.requiredText;
    } else if (value.length < 6) {
      return Constants.enterValidPasswordText;
    }
    return null;
  }

  // to get time time difference
  static String getDifferenceBetweenTime(DateTime newsTime) {
    String givenTimeStr = '2024-07-18T02:37:53Z';
    DateTime givenTime =
        DateTime.parse(givenTimeStr); // Parse the given time string
    DateTime currentTime =
        DateTime.now().toUtc(); // Ensure both times are in UTC

    Duration difference = currentTime.difference(givenTime);

    int differenceInMinutes = difference.inMinutes;
    if (differenceInMinutes > 60) {
      return '${difference.inHours} hrs ago';
    } else {
      return '$differenceInMinutes min ago';
    }
  }

  // get api from env
  static String getNewsApi() {
    return dotenv.env[Constants.newsAPiKey]!;
  }
}

// Extension to capitalize first letter
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
