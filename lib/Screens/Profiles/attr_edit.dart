

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../constants.dart';

class AttrEdit extends StatefulWidget {


  final student_id;

  const AttrEdit({
    Key key,
    @required this.student_id
  }) : super(key: key);

  @override
  _AttrEditState createState() => _AttrEditState();
}

class _AttrEditState extends State<AttrEdit> {

  final grade = TextEditingController();
  final gpa = TextEditingController();
  final school = TextEditingController();
  final department = TextEditingController();

  Future<void> updateAtribute() async {
    final response = await http.post(
        Uri.parse('http://$ip/database/editInfo.php'), body: {
      "student_id": widget.student_id,
      "grade": grade.text,
      "gpa": gpa.text,
      "department": department.text,
      "school": school.text,
    }
    );

    log('### RESPONSE ###');
    log(response.body);
    log('####################');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Info"),
      ),
      body: Column(
        children: [
          Container(
              width: 215,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: school,
                autocorrect: true,
                decoration: InputDecoration(hintText: 'School Name'),
              )
          ),
          Container(
              width: 215,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: gpa,
                autocorrect: true,
                decoration: InputDecoration(hintText: 'GPA'),
              )
          ),
          Container(
              width: 215,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: department,
                autocorrect: true,
                decoration: InputDecoration(hintText: 'Department'),
              )
          ),
          Container(
              width: 215,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: grade,
                autocorrect: true,
                decoration: InputDecoration(hintText: 'Grade'),
              )
          ),
          FlatButton(
            color: Colors.purple[100],
            child: Text("DONE"),
            onPressed: () {
              updateAtribute();
            },
          ),
        ],
      ),
    );
  }
}
