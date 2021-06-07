import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class Homepage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Company Profile"),
        ),
        body: ListView(
          children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 50, 10, 0),
            height: 150,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(40))
            ),
            child: Center(
              child: Text(
                'Apple',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                ),
              ),
            ),
          ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
              height: 150,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(40))
              ),
              child: Center(
                child: Text(
                  'Apple',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                ),
              ),
            ),

    ]
        )
    );
  }
}
