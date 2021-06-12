import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Profiles/student_profile.dart';
import 'package:flutter_auth/Screens/Profiles/company_profile.dart';
import 'package:http/http.dart' as http;

class CompanyOffers extends StatefulWidget {
  final company_id;


  CompanyOffers({
    Key key,
    @required this.company_id


  }) : super(key: key);


  @override
  State<CompanyOffers> createState() => _CompanyOffersState();
}

class _CompanyOffersState extends State<CompanyOffers> {

  var info;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSentOffers();

  }

  Future fetchSentOffers() async{
    final response = await http.post(
        Uri.parse('http://192.168.1.106/database/fetch_offers.php'),body: {
          "user_id":widget.company_id,
          "user_type":"company"
    }
    );
    print(response.body);
    setState(() {
      info =  jsonDecode(response.body);
    });


  }
  Future deleteOffers(var student_id) async{
    final response = await http.post(
        Uri.parse('http://192.168.1.106/database/delete_offers.php'),body: {
      "company_id":widget.company_id,
      "student_id":student_id
    }
    );
    print(response.body);
    fetchSentOffers();

  }

  var candidatesData = [
    'Age: \nGender: \nOpen To Work: \n',
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
        title: Text("Sent Offers"),
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
                  child: Text('Age:'+info[index]["data"]["age"]+'\nGender:'+info[index]["data"]["gender"]+'\nOpen To Work:'+info[index]["data"]["offer_acceptance"],textAlign: TextAlign.left,style: TextStyle(color:Colors.deepPurple,fontSize: 18),),
                ),
                Container(
                    child: Row(
                      children: <Widget>[
                        FlatButton(
                          color: Colors.purple[100],
                          child: Text("Delete Offer"),
                          onPressed: () {
                            deleteOffers(info[index]["data"]["student_id"]);
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
