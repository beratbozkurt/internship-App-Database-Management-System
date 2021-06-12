import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/login_body.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/Screens/UserInfos/company_info.dart';
import 'package:flutter_auth/Screens/UserInfos/student_info.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class SignupBody extends StatefulWidget {
  @override
  _SignupBodyState createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  bool company = false;
  bool student = false;
  String email;
  String password;

  Future signUp() async{

    final response = await http.post(Uri.parse('http://$ip/database/signup.php'),body: {
      "email": email,
      "password":password,
      "user_type":company ? "company":"student"
    } );

    print(company ? "company":"student");

    log(response.body);
    log('###################');

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
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
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
              text: "CONTINUE TO SIGNUP",
              press: () {
                if((company && student) || (!company && !student)){
                    print("wrong type of user");
                }
                else {
                  if (student) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return StudentInfo(
                            email: email,
                            password: password,
                          );
                        },
                      ),
                    );
                  }
                  if (company) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return companyInfo(
                            email: email,
                            password: password,
                          );
                        },
                      ),
                    );
                  }
                  // signUp();
                }
              },
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
