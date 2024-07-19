import 'package:flutter/material.dart';
import 'package:news_app/view/screens/home_page.dart';
import 'package:news_app/view/screens/login_page.dart';
import 'package:news_app/view/screens/signup_page.dart';
import 'package:page_transition/page_transition.dart';

// These methods helps to navigate from one page to another

//navigate to login page
Route createLoginRoute() {
  return PageTransition(
    type: PageTransitionType.fade,
    duration: const Duration(milliseconds: 500),
    child: const LoginPage(),
  );
}

//navigate to signup page

Route createSignupRoute() {
  return PageTransition(
    type: PageTransitionType.fade,
    duration: const Duration(milliseconds: 500),
    child: const SignupPage(),
  );
}

//navigate to signup page

Route createHomeRoute() {
  return PageTransition(
    type: PageTransitionType.fade,
    duration: const Duration(milliseconds: 500),
    child: HomePage(),
  );
}
