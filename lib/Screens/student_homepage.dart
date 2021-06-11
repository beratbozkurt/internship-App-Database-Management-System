import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Profiles/student_profile.dart';
import 'package:flutter_auth/constants.dart';

class Homepage extends StatelessWidget {

  navigateToStudentProfile(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => StudentProfile(
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Company Profile"),
        ),
        body: ListView(
          children: [
          GestureDetector(
            onTap: (){
              navigateToStudentProfile(context);
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 50, 10, 0),
              height: 150,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(40))
              ),
              child: Center(
                child: Text(
                  'Go to Your Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
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
              child: SwitchScreen()
            ),
          ]
        )
    );
  }
}

// RaisedButton(
// onPressed:()=> {
//
// },
// color: kPrimaryColor,
// textColor: Colors.white,
// padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
// child: Text('Search For Intern'),
// ),

class SwitchScreen extends StatefulWidget {
  @override
  SwitchClass createState() => new SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[ Transform.scale(
            scale: 2,
            child: Switch(
              onChanged: toggleSwitch,
              value: isSwitched,
              activeColor: Colors.blue,
              activeTrackColor: Colors.yellow,
              inactiveThumbColor: Colors.redAccent,
              inactiveTrackColor: Colors.orange,
            )
        ),
          Text('$textValue', style: TextStyle(fontSize: 20),)
        ]);
  }
}
