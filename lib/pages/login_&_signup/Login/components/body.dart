import 'package:aulerta_final/pages/home.dart';
import 'package:aulerta_final/pages/login_&_signup/Login/components/already_have_an_account_acheck.dart';
import 'package:aulerta_final/pages/login_&_signup/Login/components/background.dart';
import 'package:aulerta_final/pages/login_&_signup/Login/components/input_field.dart';
import 'package:aulerta_final/pages/login_&_signup/Login/components/password_field.dart';
import 'package:aulerta_final/pages/login_&_signup/SignUp/signup.dart';
import 'package:aulerta_final/pages/login_&_signup/utils/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
              )),
            ),
            //SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.40,
            ),
            //SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Seu Email",
              onChanged: (value) {},
            ),
            RoundedPassword(
              onChanged: (value) {},
            ),
            RoundedButton(
                text: "LOGIN",
                press: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (Route<dynamic> route) => false);
                }),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUpPage();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
