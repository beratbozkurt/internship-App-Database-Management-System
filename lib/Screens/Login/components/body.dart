import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/Screens/SearchIntern/internFinder.dart';
import 'package:flutter_auth/Screens/student_homepage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String email;
  String password;
  bool permission;

  Future login() async{
    log('TRY LOGIN');
    final response = await http.post(
        Uri.parse('http://192.168.43.108/database/login.php'),
        body: {
          "email": email,
          "password": password
        }
    );

    log(response.body);
    log('###################');

    Map<String, dynamic> jsonString = jsonDecode(response.body);
    print(jsonString);

    if(jsonString['success'] == 1) {
      log('Im in');
      permission = true;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return InternFinder();
          },
        ),
      );
    }
    else {
      permission= false;
    }

  }

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
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/newlogin.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                await login();
               if(permission){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return InternFinder();
                      },
                    ),
                  );
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
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
