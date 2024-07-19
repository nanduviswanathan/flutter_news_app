import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/shared/constants/colors.dart';
import 'package:news_app/shared/helper/sizes_helpers.dart';
import 'package:news_app/view/widgets/custom_button.dart';
import 'package:news_app/viewmodel/authentication_provider.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../shared/constants/constants.dart';
import '../../shared/helper/route.dart';
import '../../shared/helper/utility.dart';
import '../widgets/custom_text_types.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/loading_overlay.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
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
                  key: _loginFormKey,
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
                      SizedBox(height: displayHeight(context) / 4),
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
                      SizedBox(height: displayHeight(context) / 2.95),
                      CustomButton(
                        buttonText: Constants.loginText,
                        onPressed: () async {
                          if (_loginFormKey.currentState!.validate()) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            authenticationProvider.login(
                                _emailController.text.trim(),
                                _passwordController.text.trim());
                          }
                        },
                      ),
                      const SizedBox(height: 5),
                      Text.rich(
                        TextSpan(
                          text: Constants.newHereText,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: Constants.signupText,
                              style: GoogleFonts.poppins(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(appNavigatorKey.currentContext!)
                                      .pushAndRemoveUntil(
                                    createSignupRoute(),
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
