import 'package:engineers_academy/screens/mechsubjects1_screen.dart';
import 'package:engineers_academy/screens/semester_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:neumorphic_button/neumorphic_button.dart';

class Semester extends StatelessWidget {
  const Semester({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  height: 170,
                  child: Text(
                    "Choose your\n     Semester",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: NeumorphicButton(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => MechSubjectsScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Image.asset('assets/images/s1.jpg'),
                        borderRadius: 12,
                        bottomRightShadowBlurRadius: 15,
                        bottomRightShadowSpreadRadius: 1,
                        borderWidth: 5,
                        backgroundColor: Colors.grey.shade300,
                        topLeftShadowBlurRadius: 15,
                        topLeftShadowSpreadRadius: 1,
                        topLeftShadowColor: Colors.white,
                        bottomRightShadowColor: Colors.grey.shade500,
                        height: size.width * 0.4,
                        width: size.width * 0.4,
                        padding: EdgeInsets.all(20),
                        bottomRightOffset: Offset(4, 4),
                        topLeftOffset: Offset(-4, -4),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
