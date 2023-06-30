import 'package:engineers_academy/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../resources/auth_methods.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool isElevated = false;
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
  }

  Future resetpassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text)
          .then((value) => {});
      return QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Great',
          text: 'Password reset link sent! Check your email  ',
          backgroundColor: Colors.black,
          titleColor: Colors.white,
          textColor: Colors.white,
          confirmBtnText: 'Okay',
          confirmBtnColor: Colors.white,
          confirmBtnTextStyle: TextStyle(color: Colors.black),
          animType: QuickAlertAnimType.scale,
          customAsset: 'assets/images/cheering-smurfs.gif');
    } on FirebaseAuthException catch (e) {
      print(e);
      return QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Oops!',
          text: 'wrong Email ',
          backgroundColor: Colors.black,
          titleColor: Colors.white,
          textColor: Colors.white,
          confirmBtnText: 'Try again',
          confirmBtnColor: Colors.white,
          confirmBtnTextStyle: TextStyle(color: Colors.black),
          animType: QuickAlertAnimType.scale,
          customAsset: 'assets/images/1Rbo.gif');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                Stack(
                  children: [
                    Image.asset('assets/images/giphy (1).gif'),
                    Padding(
                      padding: const EdgeInsets.only(top: 260),
                      child: Container(
                        color: Colors.white,
                        height: 50,
                      ),
                    )
                  ],
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
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    resetpassword();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Container(
                      child: isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: Colors.white,
                            ))
                          : const Text(
                              "Reset Password",
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
              ],
            ),
          )),
        ));
  }
}
