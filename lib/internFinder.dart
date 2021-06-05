import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InternFinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Find An Intern')
            ),
            body: Center(
                child: HomeScreen()
            )
        );
  } }
class HomeScreen extends StatefulWidget {

  HomeScreenState createState() => HomeScreenState();

}

class HomeScreenState extends State<HomeScreen>{

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final studentClass = TextEditingController();

  getItemAndNavigate(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SecondScreen(
                nameHolder : name.text,
                classHolder : studentClass.text,
                numberHolder : phoneNumber.text
            ))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[

              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: name,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Department'),
                  )
              ),

              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: studentClass,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Min GPA'),
                  )
              ),

              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: phoneNumber,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Min GRADE'),
                  )
              ),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: phoneNumber,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Min number of Projects'),
                  )
              ),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: phoneNumber,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Min number of Work Experience'),
                  )
              ),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: phoneNumber,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Main skill the intern should have'),
                  )
              ),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: phoneNumber,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Main language the intern should have'),
                  )
              ),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: phoneNumber,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'School name')
                  )
                  
              ),


              RaisedButton(
                onPressed:()=> getItemAndNavigate(context),
                color: Color(0xffFF1744),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text('Click Here To Send All Entered Items To Next Screen'),
              ),

            ],
          ),
        ));
  }
}

class SecondScreen extends StatelessWidget {

  final  nameHolder ;
  final  classHolder ;
  final  numberHolder ;

  SecondScreen({
    Key key, @required this.nameHolder,
    this.classHolder,
    this.numberHolder}) : super(key: key);

  goBack(BuildContext context){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Activity Screen"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child:
              Text('Student Name = ' + nameHolder,
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,)),

              Center(child:
              Text('Student Class = ' + classHolder,
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,)),

              Center(child:
              Text('Student Phone Number = ' + numberHolder,
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,)),

              RaisedButton(
                onPressed: ()=> goBack(context),
                color: Colors.lightBlue,
                textColor: Colors.white,
                child: Text('Go Back To Previous Screen'),
              )])
    );
  }
}