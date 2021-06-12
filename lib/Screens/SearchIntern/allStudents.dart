import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Profiles/student_profile.dart';
import 'package:flutter_auth/Screens/Profiles/company_profile.dart';
import 'package:http/http.dart' as http;

class AllStudents extends StatefulWidget {
  final company_id;


  AllStudents({
    Key key,
    @required this.company_id


  }) : super(key: key);

  /*final nameHolder;
  final surnameHolder;
  final ageHolder;
  final genderHolder;
  final offerHolder;
  final experienceHolder;
  final skillHolder;
  final languageHolder;

  AllStudents({
    Key key,
    @required this.nameHolder,
    this.surnameHolder,
    this.ageHolder,
    this.genderHolder,
    this.offerHolder,
    this.experienceHolder,
    this.skillHolder,
    this.languageHolder,
  }) : super(key: key);

  goBack(BuildContext context) {
    Navigator.pop(context);
  }

  getItemAndNavigate(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => StudentProfile()
        )
    );
  }

  navigateToCompany(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CompanyProfile()
        )
    );
  }
*/
  @override
  State<AllStudents> createState() => _AllStudentsState();
}

class _AllStudentsState extends State<AllStudents> {

  var info;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllStudents();

  }

  Future getAllStudents() async{
    final response = await http.post(
        Uri.parse('http://192.168.1.106/database/allStudents.php')
 );

    //print(response.body);

    setState(() {
      info =  jsonDecode(response.body);
    });

  //  print(info);

  }
  Future sendOffer(var student_id) async{
    final response = await http.post(
        Uri.parse('http://192.168.1.106/database/create_offer.php'),body: {

          "company_id":widget.company_id,
          "student_id":student_id
    }

    );


    print(response.body);

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
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("All Internship Candidates"),
      ),
      body: (info == null) ? CircularProgressIndicator(): ListView.builder(
        itemCount: info.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(info[index]["data"]["name"]+" "+info[index]["data"]["surname"],
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Age:"+info[index]["data"]["age"].toString()+"\nGender:"+info[index]["data"]["gender"]+"\nOpen To Work:"+info[index]["data"]["offer_acceptance"],textAlign: TextAlign.left,style: TextStyle(color:Colors.deepPurple,fontSize: 18)),),
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
