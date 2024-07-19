import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final String labelText;
  final bool obscureText;
  final TextInputAction? textInputAction;

  const CustomTextField({
    super.key,
    required this.controller,
    this.validator,
    this.obscureText = false,
    required this.labelText,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: _inputDecoration(labelText),
      style: const TextStyle(color: Colors.black),
      obscureText: obscureText,
      validator: validator,
      textInputAction: textInputAction,
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      helperText: ' ',
      hintText: label,
      labelStyle: GoogleFonts.poppins(
        color: kBlackColor,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      filled: true,
      fillColor: kWhiteColor,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: kWhiteColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: kWhiteColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: kWhiteColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: kWhiteColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      isDense: true,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
    );
  }
}
