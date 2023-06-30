import 'package:engineers_academy/screens/mechsubjects1_screen.dart';
import 'package:engineers_academy/screens/semester_screen.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_button/neumorphic_button.dart';

class Department extends StatelessWidget {
  const Department({Key? key}) : super(key: key);

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
                    "Choose your\n     Department",
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
                              builder: (context) => const Semester(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Image.asset(
                            'assets/images/mechanical engineering.png'),
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
                    Expanded(
                      child: NeumorphicButton(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const Semester(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Image.asset('assets/images/civil.png'),
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
                        padding: EdgeInsets.all(10),
                        bottomRightOffset: Offset(4, 4),
                        topLeftOffset: Offset(-4, -4),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: NeumorphicButton(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const Semester(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Image.asset('assets/images/ece.jpg'),
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
                        padding: EdgeInsets.all(10),
                        bottomRightOffset: Offset(4, 4),
                        topLeftOffset: Offset(-4, -4),
                      ),
                    ),
                    Expanded(
                      child: NeumorphicButton(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const Department(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Image.asset('assets/images/eee.jpg'),
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
                        padding: EdgeInsets.all(10),
                        bottomRightOffset: Offset(4, 4),
                        topLeftOffset: Offset(-4, -4),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: NeumorphicButton(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const Semester(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Image.asset('assets/images/cse.png'),
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
