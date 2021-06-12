import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Profiles/attr_edit.dart';
import 'package:flutter_auth/constants.dart';
import 'package:http/http.dart' as http;

import '../student_homepage.dart';

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
    getEducation();
  }

  Future getInfo() async{
    final response = await http.post(
        Uri.parse('http://$ip/database/fetch_userInfo.php'),
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

  var education_info;
  Future getEducation() async{
    final response = await http.post(
        Uri.parse('http://$ip/database/fetch_education.php'),
        body: {
          "student_id": widget.studentid
        }
    );
    log(response.body);
    setState(() {
      education_info =  jsonDecode(response.body);
    });
    print('educationinfo = '+ education_info);
  }

  goToEdit(var student_id){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AttrEdit(
                  student_id: widget.studentid,
                )
        )
    );
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

  var languages = 'English';

  var skills = 'football';

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
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                    color: Colors.white,
                                    child: Text(
                                        'School: '+(education_info.length == 0 ? "" : education_info[0]["data"]["school_name"] )
                                    )
                                    ,
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                    color: Colors.white,
                                    child: Text(
                                        'GPA: '+( education_info.length == 0 ? "" :education_info[0]["data"]["gpa"].toString() )
                                    )
                                    ,
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                    color: Colors.white,
                                    child: Text(
                                        'Department: '+ (education_info.length == 0 ? "" :education_info[0]["data"]["department"] )
                                    )
                                    ,
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                    color: Colors.white,
                                    child: Text(
                                        'Grade: '+( education_info.length == 0 ? "" :education_info[0]["data"]["grade"].toString() )
                                    )
                                    ,
                                  ),
                                  FlatButton(
                                    color: Colors.purple[100],
                                    child: Text("Edit Info"),
                                    onPressed: () {
                                      goToEdit('');
                                    },
                                  ),
                                ],
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
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.6,
                                  color: Colors.grey
                              ),
                              color: Colors.white60
                          ),
                        child: ExpansionTile(
                          title: Text('Languages'),
                          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                              color: Colors.white,
                              child: Text(
                                  languages),
                            ),
                          ],
                        )
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.6,
                                color: Colors.grey
                            ),
                            color: Colors.white60
                        ),
                        child: ExpansionTile(
                          title: Text('Skills'),
                          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                              color: Colors.white,
                              child: Text(
                                  skills),
                            ),
                          ],
                        ),
                      )
                    ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(height: 80),
                    child: ElevatedButton(
                      child: Text('My Offers'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return StudentHomepage(
                                user_id: widget.studentid,
                              );
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          primary: Colors.purple[300],
                          textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
