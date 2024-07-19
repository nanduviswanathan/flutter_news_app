import 'package:flutter/material.dart';
import 'package:news_app/shared/constants/colors.dart';

import 'custom_text_types.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: elevatedButtonStyle(context),
      onPressed: onPressed,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: TextBoldW700(
          text: buttonText,
          fontSize: 16,
          isUnderLine: false,
          textColor: kWhiteColor,
        ),
      ),
    );
  }

  // button style
  static ButtonStyle elevatedButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: kPrimaryColor,
      foregroundColor: kWhiteColor,
      minimumSize: Size(MediaQuery.of(context).size.width * 0.6,
          MediaQuery.of(context).size.height * 0.06),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
