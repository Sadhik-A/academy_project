import 'package:engineers_academy/screens/department_screen.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_button/neumorphic_button.dart';

class UniversityScreen extends StatelessWidget {
  const UniversityScreen({Key? key}) : super(key: key);

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
                    "Choose your\n     University",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 12),
                  child: Text(
                    "Anna University",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                NeumorphicButton(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const Department()),
                        (route) => false);
                  },
                  child: Image.asset('assets/images/Annauniversity.png'),
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
                const SizedBox(height: 65),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 12),
                  child: Text(
                    " KTU",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                NeumorphicButton(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const Department()),
                        (route) => false);
                  },
                  child: Image.asset(
                    'assets/images/ktulogo.png',
                  ),
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
                )
              ],
            ),
          )),
        ));
  }
}
