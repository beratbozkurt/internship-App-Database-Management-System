import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class CompanyProfile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Company Profile"),
        ),
        body: Container(
          color: kPrimaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 150,
                color: kPrimaryColor,
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
                          'Description: Our company is the best steel producer of the world. We are innovating state of the art construction materials.',
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 40, 10, 0),
                        child: Text(
                          'Address: apple@apple.com',
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
