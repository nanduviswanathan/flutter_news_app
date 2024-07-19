import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/services/firebase_remote_config_service.dart';
import 'package:news_app/shared/constants/colors.dart';
import 'package:news_app/shared/constants/constants.dart';
import 'package:news_app/view/screens/signup_page.dart';
import 'package:news_app/viewmodel/authentication_provider.dart';
import 'package:news_app/viewmodel/home_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final remoteConfigService = FirebaseRemoteConfigService();
  await remoteConfigService.initialize();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(),
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (_) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: appNavigatorKey,
        debugShowCheckedModeBanner: false,
        title: Constants.newsAppText,
        theme: _buildTheme(Brightness.light),
        home: const SignupPage(),
      ),
    );
  }

  // to build theme data
  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
    );
  }
}
