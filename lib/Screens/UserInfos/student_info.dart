import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/SearchIntern/results_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:http/http.dart' as http;


class StudentInfo extends StatelessWidget {

  final email;
  final password;

  StudentInfo({
    Key key,
    @required this.email,
    this.password,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: Text('Student Info')
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
  final surname = TextEditingController();
  final age = TextEditingController();
  final gender = TextEditingController();
  final offer_acceptance = TextEditingController();


  getItemAndNavigate(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => resultScreen(
                nameHolder : name.text,
                surnameHolder : surname.text,
                ageHolder : age.text,
                genderHolder : gender.text,
                offerHolder : offer_acceptance.text,
            )
        )
    );
  }

  Future signUp() async{

    final response = await http.post(Uri.parse('http://192.168.1.106/database/signup.php'),body: {
      "name": name.text,
      "surname":surname.text,
      "user_type":"student",
      "age":age.text,
      "offer_acceptance":offer_acceptance.text,
      "email":widget.email,
      "password":widget.password,
      "gender":gender.text
    } );
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
                        decoration: InputDecoration(hintText: 'Name'),
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
                        controller: surname,
                        autocorrect: true,
                        decoration: InputDecoration(hintText: 'Surname'),
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
                          controller: age,
                          autocorrect: true,
                          decoration: InputDecoration(hintText: 'Age'),
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
                        cursorColor: kPrimaryColor,
                        controller: gender,
                        autocorrect: true,
                        decoration: InputDecoration(hintText: 'Gender (male/female)'),
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
                          controller: offer_acceptance,
                          autocorrect: true,
                          decoration: InputDecoration(hintText: 'Offer Acceptance (open/close)'),
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
