import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:http/http.dart' as http;

class StudentProfile extends StatefulWidget {

  final studentid;

  StudentProfile({
    Key key,
    @required this.studentid,
  }) : super(key: key);

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  Map<String, dynamic> info;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();

  }

  Future getInfo() async{
    final response = await http.post(
        Uri.parse('http://192.168.1.106/database/fetch_userInfo.php'),
        body: {
          "user_type": "student",
          "user_id": widget.studentid
        }
    );

    print(response.body);
    setState(() {
      info =  jsonDecode(response.body);
    });
    print(info);

  }

  var education = 'School Name: AGU\n\n'
              'GPA: 2.78\n\n'
              'Department: Computer Engineering\n\n'
              'Grade: 2\n\n';

  var experience = 'Start Date: 5 July 2054\n'
      'End Date: 2 October 2096\n'
      'Role: President\n\n'
      'Description: I have worked in Apple as a president. I developed so much application.';

  var project = 'Title: Durability of Steel Constructions\n'
      'Description: We invented a concrete that is compatible '
      'with steel constructions.\n\n'
      'Start Date: 3 December 2071\n'
      'End Date: 4 December 2071\n';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Profile"),
      ),
      body: (info == null) ? CircularProgressIndicator():Container(
        color: kPrimaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 150,
              color: kPrimaryColor,
              child: Center(
                child: Text(
                  info["name"]+" "+info["surname"],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                  )
                ),
                child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.6,
                                  color: Colors.grey
                              ),
                              color: Colors.white60
                          ),
                          child: ExpansionTile(
                            title: Text('Educations'),
                            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                color: Colors.white,
                                child: Text(
                                    education),
                              )
                            ],
                          )
                      ),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.6,
                                  color: Colors.grey
                              ),
                              color: Colors.white60
                          ),
                          child: ExpansionTile(
                            title: Text('Experiences'),
                            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                color: Colors.white,
                                child: Text(
                                    experience),
                              ),
                            ],
                          )
                      ),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.6,
                                  color: Colors.grey
                              ),
                              color: Colors.white60
                          ),
                          child: ExpansionTile(
                            title: Text('Projects'),
                            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                color: Colors.white,
                                child: Text(
                                    project
                                )
                                ,
                              )
                            ],
                          )
                      ),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.6,
                                  color: Colors.grey
                              ),
                              color: Colors.white60
                          ),
                          child: ExpansionTile(
                            title: Text('Education'),
                            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                color: Colors.white,
                                child: Text(
                                    education),
                              )
                            ],
                          )
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 40, 10, 0),
                        child: Text(
                          'Languages: English, Turkish, Kurdish',
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 40, 10, 0),
                        child: Text(
                          'Skills: Football, Basketball, Formatting Computers',
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                      ),
                    ],
                ),
              ),
            ),

          ],
        ),
      )
    );
  }
}
