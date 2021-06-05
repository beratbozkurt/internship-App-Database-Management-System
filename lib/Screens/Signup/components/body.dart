import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool company = false;
  bool student = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/newsignup.svg",
              height: size.height * 0.25,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
           Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(
                Radius.circular(50.0))
                ,color: kPrimaryLightColor
            ),
            child: CheckboxListTile(
              value: company,
              onChanged: (bool val) => setState(() => company = val),
              title: Text("Company"),
              controlAffinity: ListTileControlAffinity.trailing,
            ),
          ),
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(borderRadius: BorderRadius.all(
                  Radius.circular(50.0))
                  ,color: kPrimaryLightColor
              ),
              child: CheckboxListTile(
                value: student,
                onChanged: (bool val) => setState(() => student = val),
                title: Text("Student"),
                controlAffinity: ListTileControlAffinity.trailing,
              ),
            ),
            RoundedButton(
              text: "SIGNUP",
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
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
