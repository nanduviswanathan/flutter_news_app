import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/shared/constants/colors.dart';
import 'package:news_app/shared/helper/route.dart';
import 'package:news_app/shared/helper/sizes_helpers.dart';
import 'package:news_app/view/widgets/custom_button.dart';
import 'package:news_app/viewmodel/authentication_provider.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../shared/constants/constants.dart';
import '../../shared/helper/utility.dart';
import '../widgets/custom_text_types.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/loading_overlay.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _signupFormKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
        builder: (context, authenticationProvider, child) {
      return LoadingOverlay(
        isLoading: authenticationProvider.loading,
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Form(
                  key: _signupFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: TextBoldW700(
                          text: Constants.myNewsText,
                          fontSize: 20,
                          textColor: kPrimaryColor,
                        ),
                      ),
                      SizedBox(height: displayHeight(context) / 5.5),
                      CustomTextField(
                        controller: _nameController,
                        labelText: Constants.nameText,
                        validator: (value) => Utility.validateName(value!),
                        textInputAction: TextInputAction.next,
                      ),
                      CustomTextField(
                        controller: _emailController,
                        labelText: Constants.emailText,
                        validator: (value) => Utility.validateEmail(value!),
                        textInputAction: TextInputAction.next,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        labelText: Constants.passwordText,
                        obscureText: true,
                        validator: (value) => Utility.validatePassword(value!),
                        textInputAction: TextInputAction.done,
                      ),
                      SizedBox(height: displayHeight(context) / 3),
                      CustomButton(
                        buttonText: Constants.signupText,
                        onPressed: () async {
                          if (_signupFormKey.currentState!.validate()) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            authenticationProvider.signup(
                                _nameController.text.trim(),
                                _emailController.text.trim(),
                                _passwordController.text.trim());
                          }
                        },
                      ),
                      const SizedBox(height: 5),
                      Text.rich(
                        TextSpan(
                          text: Constants.alreadyHaveAccountText,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: Constants.loginText,
                              style: GoogleFonts.poppins(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(appNavigatorKey.currentContext!)
                                      .pushAndRemoveUntil(
                                    createLoginRoute(),
                                    (Route<dynamic> route) => false,
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
