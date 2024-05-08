import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:engineers_academy/screens/forget_passwordscreen.dart';
import 'package:engineers_academy/screens/signupscreen.dart';
import 'package:engineers_academy/screens/university_screen.dart';
import 'package:engineers_academy/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/utils/images.dart';
import '../resources/auth_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class SharedPreferencesHelper {
  static final String _seenOnboardingKey = 'seenOnboarding';
  static final String _isLoggedInKey = 'isLoggedIn';
  static final String _seenHubScreenKey = 'seenHubScreen';

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

  static Future<bool> getSeenHomeScreen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_seenHubScreenKey) ?? false;
  }

  static Future<void> setSeenHomeScreen(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_seenHubScreenKey, value);
  }
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool isElevated = false;
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  void loginUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: emailcontroller.text, password: passwordcontroller.text);
    if (res == 'success') {
      await SharedPreferencesHelper.setLoggedIn(true);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const UniversityScreen()),
          (route) => false);
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      Wrongemilmsg();
    }
  }

  Wrongemilmsg() {
    {
      return QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Oops!',
          text: 'wrong email or password',
          backgroundColor: Colors.black,
          titleColor: Colors.white,
          textColor: Colors.white,
          confirmBtnText: 'Try again',
          confirmBtnColor: Colors.white,
          confirmBtnTextStyle: TextStyle(color: Colors.black),
          animType: QuickAlertAnimType.scale,
          customAsset: 'assets/images/jQ.gif');
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE7ECEF),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 42),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 250.0,
                  height: 300,
                  child: TextLiquidFill(
                    loadDuration: const Duration(seconds: 5),
                    textAlign: TextAlign.left,
                    text: 'Engineers\n   Academy',
                    waveColor: Colors.black,
                    boxBackgroundColor: Color(0xFFE7ECEF),
                    textStyle: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                    boxHeight: 300.0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldinput(
                    textEditingController: emailcontroller,
                    hinttext: "Email",
                    textInputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 15,
                ),
                TextFieldinput(
                  textEditingController: passwordcontroller,
                  hinttext: "Password",
                  textInputType: TextInputType.visiblePassword,
                  ispass: true,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const ForgetPassword()),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: loginUser,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Container(
                      child: isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: Colors.white,
                            ))
                          : const Text(
                              "Log In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const SignupPage()),
                        );
                      },
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
        ));
  }
}
