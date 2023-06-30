import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:engineers_academy/screens/login_screen.dart';
import 'package:engineers_academy/screens/university_screen.dart';
import 'package:engineers_academy/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:engineers_academy/resources/auth_methods.dart';
import 'package:quickalert/quickalert.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController cfpasswordcontroller = TextEditingController();
  bool isElevated = false;
  bool isloading = false;
  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  Wrongemilmsg() {
    {
      return QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Oops!',
          text: 'User Already Exists',
          backgroundColor: Colors.black,
          titleColor: Colors.white,
          textColor: Colors.white,
          confirmBtnText: 'Try again',
          confirmBtnColor: Colors.white,
          confirmBtnTextStyle: TextStyle(color: Colors.black),
          animType: QuickAlertAnimType.scale,
          customAsset: 'assets/images/1Rbo.gif');
    }
    ;
  }

  void signUpUser() async {
    // set loading to true
    setState(() {
      isloading = true;
    });

    // signup user using our authmethodds
    String res = await AuthMethods().signUpUser(
      email: emailcontroller.text,
      password: passwordcontroller.text,
    );
    // if string returned is sucess, user has been created
    if (res == "success") {
      setState(() {
        isloading = false;
      });
      // navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const UniversityScreen()),
      );
    } else {
      setState(() {
        isloading = false;
      });
      // show the error
      Wrongemilmsg();
    }
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
                  width: 300.0,
                  height: 300,
                  child: TextLiquidFill(
                    loadDuration: const Duration(seconds: 5),
                    textAlign: TextAlign.left,
                    text: 'Hi\nRegister Now',
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
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: signUpUser,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Container(
                      child: isloading
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: Colors.white,
                            ))
                          : const Text(
                              "Sign Up",
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
                      'Already have an Account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text(
                        'Login now',
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
