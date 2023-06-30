import 'package:engineers_academy/screens/login_screen.dart';
import 'package:engineers_academy/screens/university_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding/onboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class SharedPreferencesHelper {
  static final String _seenOnboardingKey = 'seenOnboarding';
  static final String _isLoggedInKey = 'isLoggedIn';

  static Future<bool> getSeenOnboarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_seenOnboardingKey) ?? false;
  }

  static Future<void> setSeenOnboarding(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_seenOnboardingKey, value);
  }

  static Future<bool> getLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  static Future<void> setLoggedIn(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, value);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
        future: SharedPreferencesHelper.getSeenOnboarding(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final bool seenOnboarding = snapshot.data!;
            if (seenOnboarding) {
              return FutureBuilder<bool>(
                future: SharedPreferencesHelper.getLoggedIn(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!) {
                    return UniversityScreen();
                  } else {
                    return LoginPage();
                  }
                },
              );
            } else {
              return OnBoard();
            }
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
