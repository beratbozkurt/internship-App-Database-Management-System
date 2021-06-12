import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/SearchIntern/results_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:http/http.dart' as http;

class companyInfo extends StatelessWidget {

  final email;
  final password;

  companyInfo({
    Key key,
    @required this.email,
    this.password,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: Text('Company Info')
        ),
        body: Center(
            child: searchScreen(
              email : email,
              password: password,
            )
        )
    );
  }
}


class searchScreen extends StatefulWidget {
  final email;
  final password;

  searchScreen({
    Key key,
    @required this.email,
    this.password,

  }) : super(key: key);
  searchScreenState createState() => searchScreenState();
}

class searchScreenState extends State<searchScreen>{

  final name = TextEditingController();
  final contactMail = TextEditingController();
  final companyDescription = TextEditingController();


  Future signUp() async{

    final response = await http.post(Uri.parse('http://192.168.1.106/database/signup.php'),body: {
      "name": name.text,
      "user_type":"company",
      "company_desc":companyDescription.text,
      "email":widget.email,
      "password":widget.password,
      "contact_mail":contactMail.text
    }
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Row(
                  children: <Widget> [Container(

                      width: 375,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: name,
                        autocorrect: true,
                        decoration: InputDecoration(hintText: 'Company Name'),
                      )
                  ),
                    SizedBox(width: 25),
                  ]
              ),

              Row(
                  children: <Widget> [Container(
                      width: 375,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: contactMail,
                        autocorrect: true,
                        decoration: InputDecoration(hintText: 'Contact Mail'),
                      )
                  ),
                    SizedBox(width: 25),
                  ]
              ),

              Row(
                  children: <Widget> [
                    Container(
                        width: 375,
                        padding: EdgeInsets.all(10.0),
                        child: TextField(
                          controller: companyDescription,
                          autocorrect: true,
                          decoration: InputDecoration(hintText: 'Company Description'),
                        )
                    ),
                    SizedBox(width: 25),
                  ]
              ),
              RaisedButton(
                onPressed:() {
                  signUp();
                },
                color: kPrimaryColor,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text('Sign Up'),
              ),

            ],
          ),
        ));
  }
}
