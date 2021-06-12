import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Profiles/student_profile.dart';
import 'package:flutter_auth/constants.dart';
import 'package:http/http.dart' as http;

class StudentHomepage extends StatefulWidget {

  final user_id;

  const StudentHomepage({
    Key key,
    @required this.user_id,
  }) : super(key: key);

  @override
  _StudentHomepageState createState() => _StudentHomepageState();
}

class _StudentHomepageState extends State<StudentHomepage> {

  var info;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSentOffers();
  }

  Future fetchSentOffers() async {
    final response = await http.post(
        Uri.parse('http://$ip/database/fetch_offers.php'), body: {
      "user_id": widget.user_id,
      "user_type": "student"
    }
    );

    log('### FETCH OFFERS ###');
    log(response.body);
    log('####################');

    setState(() {
      info = jsonDecode(response.body);
    });
  }

  Future updateOffer(var company_id, var status) async {
    final response = await http.post(
        Uri.parse('http://$ip/database/update_offers.php'), body: {
      "company_id": company_id,
      "student_id": widget.user_id,
      "status": status
    }
    );
    log(response.body);
    fetchSentOffers();
  }

  navigateToStudentProfile(BuildContext context) {
    log('navigate to student profile');
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                StudentProfile(
                  studentid: null,
                  //todo buraya don

                )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sent Offers"),
      ),
      body: (info == null) ? CircularProgressIndicator() : ListView.builder(
        itemCount: info.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(info[index]["data"]["name"] + " " +
                info[index]["data"]["surname"],
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Age:' + info[index]["data"]["age"] + '\nGender:' +
                        info[index]["data"]["gender"] + '\nOpen To Work:' +
                        info[index]["data"]["offer_acceptance"],
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.deepPurple, fontSize: 18),),
                ),
                Container(
                    child: Row(
                      children: <Widget>[
                        FlatButton(
                          color: Colors.purple[100],
                          child: Text("Accept Offer"),
                          onPressed: () {
                            updateOffer(
                                info[index]["data"]["company_id"], "accepted");
                          },
                        ),
                        FlatButton(
                          color: Colors.purple[100],
                          child: Text("Reject Offer"),
                          onPressed: () {
                            updateOffer(
                                info[index]["data"]["company_id"], "rejected");
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

// ListView(
// children: [
// GestureDetector(
// onTap: (){
// navigateToStudentProfile(context);
// },
// child: Container(
// margin: EdgeInsets.fromLTRB(10, 50, 10, 0),
// height: 70,
// decoration: BoxDecoration(
// color: kPrimaryColor,
// borderRadius: BorderRadius.all(Radius.circular(40))
// ),
// child: Center(
// child: Text(
// 'Go to Your Profile',
// style: TextStyle(
// color: Colors.white,
// fontSize: 23,
// ),
// ),
// ),
// ),
// ),
// Container(
// margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
// height: 70,
// decoration: BoxDecoration(
// color: kPrimaryColor,
// borderRadius: BorderRadius.all(Radius.circular(40))
// ),
// child: SwitchScreen()
// ),
// ]
// ),


/// switch

// class SwitchScreen extends StatefulWidget {
//   @override
//   SwitchClass createState() => new SwitchClass();
// }
//
// class SwitchClass extends State {
//   bool isSwitched = false;
//   var textValue = 'Switch is OFF';
//
//   void toggleSwitch(bool value) {
//
//     if(isSwitched == false)
//     {
//       setState(() {
//         isSwitched = true;
//         textValue = 'Switch Button is ON';
//       });
//       print('Switch Button is ON');
//     }
//     else
//     {
//       setState(() {
//         isSwitched = false;
//         textValue = 'Switch Button is OFF';
//       });
//       print('Switch Button is OFF');
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children:[ Transform.scale(
//             scale: 2,
//             child: Switch(
//               onChanged: toggleSwitch,
//               value: isSwitched,
//               activeColor: Colors.blue,
//               activeTrackColor: Colors.yellow,
//               inactiveThumbColor: Colors.redAccent,
//               inactiveTrackColor: Colors.orange,
//             )
//         ),
//           Text('$textValue', style: TextStyle(fontSize: 20),)
//         ]);
//   }
// }
