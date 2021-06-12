import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Offers/company_offers.dart';
import 'package:flutter_auth/Screens/SearchIntern/allStudents.dart';
import 'package:flutter_auth/Screens/SearchIntern/internFinder.dart';
import 'package:flutter_auth/constants.dart';
import 'package:http/http.dart' as http;

class CompanyProfile extends StatefulWidget {

  final companyid;

  CompanyProfile({
    Key key,
    @required this.companyid

  }) : super(key: key);

  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
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
          "user_type": "company",
          "user_id": widget.companyid
        }
    );

    print(response.body);
    setState(() {
      info =  jsonDecode(response.body);
    });
    print(info);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Company Profile"),
        ),
        body: (info == null) ? CircularProgressIndicator(): Container(
          color: kPrimaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 150,
                color: kPrimaryColor,
                child: Center(
                  child: Text(
                    info["company_name"]
                    ,
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
                        margin: EdgeInsets.fromLTRB(25, 40, 10, 0),
                        decoration: BoxDecoration(
                        ),
                        child: Text(
                           info["description"]
                          ,
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 40, 10, 0),
                        child: Text(
                          info["contact_mail"]
                          ,
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                      ),
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
                        child: Text('Sent Offers'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CompanyOffers(
                                    company_id:widget.companyid
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
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                     Expanded(
                      child: ConstrainedBox(
                   constraints: BoxConstraints.tightFor(height: 80),
                        child: ElevatedButton(
                          child: Text('All  Students'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return AllStudents(
                                    company_id:widget.companyid
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
                  Expanded(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(height: 80),
                      child: ElevatedButton(
                        child: Text('Find An Intern'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return InternFinder(
                                    company_id:widget.companyid
                                );
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.purple[300],
                            textStyle: TextStyle(
                              fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),

                ],
              )

            ],
          ),
        )
    );
  }
}
