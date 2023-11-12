import 'package:aulerta_final/pages/login_&_signup/Login/components/already_have_an_account_acheck.dart';
import 'package:aulerta_final/pages/login_&_signup/Login/components/background.dart';
import 'package:aulerta_final/pages/login_&_signup/Login/components/input_field.dart';
import 'package:aulerta_final/pages/login_&_signup/Login/components/password_field.dart';
import 'package:aulerta_final/pages/login_&_signup/Login/login.dart';
import 'package:aulerta_final/pages/login_&_signup/SignUp/components/or_divider.dart';
import 'package:aulerta_final/pages/login_&_signup/SignUp/components/social_icon.dart';
import 'package:aulerta_final/pages/login_&_signup/utils/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  final Widget child;
  const Body({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "CADASTRE-SE",
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(fontWeight: FontWeight.w700)),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Insira seu Email",
              onChanged: (value) {},
            ),
            RoundedPassword(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "CADASTRE-SE",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage();
                    },
                  ),
                );
              },
            ),
            const OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
