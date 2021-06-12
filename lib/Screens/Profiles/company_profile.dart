import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

            ],
          ),
        )
    );
  }
}
