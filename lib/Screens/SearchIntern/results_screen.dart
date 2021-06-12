import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Profiles/student_profile.dart';
import 'package:flutter_auth/Screens/Profiles/company_profile.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class resultScreen extends StatefulWidget {

  final school;
  final department;
  final gpa;
  final grade;
  final company_id;

  resultScreen({
    Key key,
    @required this.school,
    this.department,
    this.gpa,
    this.grade,
    this.company_id

  }) : super(key: key);

  @override
  State<resultScreen> createState() => _resultScreenState();
}

class _resultScreenState extends State<resultScreen> {

  var info;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchStudents();

  }

  Future searchStudents() async{
    print(widget.school);
    print(widget.department);
    print(widget.gpa);
    print(widget.grade);

    final response = await http.post(
        Uri.parse('http://$ip/database/search_intern.php'),body: {
          "school":widget.school,
          "department":widget.department,
          "gpa":widget.gpa,
          "grade":widget.grade
    }
    );

    print(response.body);

    setState(() {
      info =  jsonDecode(response.body);
    });

    //  print(info);

  }
  Future sendOffer(var student_id) async{
    final response = await http.post(
        Uri.parse('http://$ip/database/create_offer.php'),body: {

      "company_id":widget.company_id,
      "student_id":student_id
    }

    );
    print(response.body);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Candidate Students"),
      ),
      body:(info == null) ? CircularProgressIndicator(): ListView.builder(
        itemCount: info.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(info[index]["data"]["name"]+" "+info[index]["data"]["surname"],
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Age:"+info[index]["data"]["age"].toString()+
                              "\nGender:"+info[index]["data"]["gender"]+
                              "\nOpen To Work:"+info[index]["data"]["offer_acceptance"]+
                              "\nGPA:"+info[index]["data"]["GPA"].toString()+
                               "\nDepartment:"+info[index]["data"]["department"]+
                              "\nSchool:"+info[index]["data"]["school_name"]+
                               "\nGrade:"+info[index]["data"]["grade"],
                           textAlign: TextAlign.left,style: TextStyle(color:Colors.deepPurple,fontSize: 18)),),
                Container(
                    child: Row(
                      children: <Widget>[
                        FlatButton(
                          color: Colors.purple[100],
                          child: Text("Student Profile"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StudentProfile(studentid:info[index]["data"]["student_id"] )
                                )
                            );
                          },
                        ),

                        FlatButton(
                          color: Colors.purple[200],
                          child: Text("Send An Offer"),
                          onPressed: () {
                            sendOffer(info[index]["data"]["student_id"]);
                          },
                        ),

                      ],
                    )
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
