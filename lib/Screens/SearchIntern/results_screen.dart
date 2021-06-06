import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class resultScreen extends StatelessWidget {
  final schoolHolder;
  final departmentHolder;
  final gpaHolder;
  final gradeHolder;
  final projectHolder;
  final experienceHolder;
  final skillHolder;
  final languageHolder;

  resultScreen({
    Key key,
    @required this.schoolHolder,
    this.departmentHolder,
    this.gpaHolder,
    this.gradeHolder,
    this.projectHolder,
    this.experienceHolder,
    this.skillHolder,
    this.languageHolder,
  }) : super(key: key);

  goBack(BuildContext context) {
    Navigator.pop(context);
  }

  var candiates = [
    'Berat Bozkurt',
    'Yasin Inal',
    'Michael Jackson',
    'Aybala Kilic',
    'Burak Milidere',
    'Feyzanur Yilmaz',
    'Roberto Carlos'
  ];
  var candidatesData = [
    'School: AGU\nGPA: 2.78\nDepartment: Computer Engineering\nGrade: 2\nNumber of projects: 7\nNumber of experiences: 2',
    'School: ITU\nGPA: 1.68\nDepartment: Dentistry\nGrade: 2\nNumber of projects: 6\nNumber of experiences: 7',
    'School: Corum Technical University\nGPA: 3.78\nDepartment: conservatoire\nGrade: 4\nNumber of projects: 3\nNumber of experiences: 1',
    'School: ODTU\nGPA: 3.20\nDepartment: Industrial Engineering\nGrade: 1\nNumber of projects: 0\nNumber of experiences: 10',
    'School: ADU\nGPA: 1.18\nDepartment: Mechanical Engineering\nGrade: 2\nNumber of projects: 3\nNumber of experiences: 3',
    'School: Esogu\nGPA: 2.78\nDepartment: Civil Engineering\nGrade: 4\nNumber of projects: 2\nNumber of experiences: 8',
    'School: Gulhane\nGPA: 3.88\nDepartment: Mathematics Engineering\nGrade: 3\nNumber of projects: 1\nNumber of experiences: 0',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Candidate Students"),
      ),
      body: ListView.builder(
        itemCount: candiates.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(candiates[index], style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(candidatesData[index],textAlign: TextAlign.left),
                ),
                Container(

                    child: Row(
                  children: <Widget>[
                    FlatButton(
                      color: Colors.purple[100],
                      child: Text("Student Profile"),
                      onPressed: () {},
                    ),
                    FlatButton(
                      color: Colors.purple[200],
                      child: Text("Send An Offer"),
                      onPressed: () {},
                    ),

                  ],
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
