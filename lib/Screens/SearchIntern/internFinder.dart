import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/SearchIntern/results_screen.dart';
import 'package:flutter_auth/constants.dart';

class InternFinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
                title: Text('InternFinder')
            ),
            body: Center(
                child: searchScreen()
            )
        );
  }
}


class searchScreen extends StatefulWidget {
  searchScreenState createState() => searchScreenState();
}

class searchScreenState extends State<searchScreen>{
  final schoolName = TextEditingController();
  final department = TextEditingController();
  final minGPA = TextEditingController();
  final minGrade = TextEditingController();
  final minNumOfProjects = TextEditingController();
  final minNumOfExperience = TextEditingController();
  final mainSkill = TextEditingController();
  final mainLanguage = TextEditingController();

  bool schoolSearch = false;
  bool departmentSearch = false;
  bool gpaSearch = false;
  bool gradeSearch = false;
  bool projectSearch = false;
  bool experienceSearch = false;
  bool skillSearch  = false;
  bool languageSearch = false;

  getItemAndNavigate(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => resultScreen(
                  schoolHolder : schoolName.text,
                  departmentHolder : department.text,
                  gpaHolder : minGPA.text,
                  gradeHolder : minGrade.text,
                  projectHolder : minNumOfProjects.text,
                  experienceHolder : minNumOfExperience.text,
                  skillHolder : mainSkill.text,
                  languageHolder : mainLanguage.text
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget> [Container(

                    width: 315,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: schoolName,
                      autocorrect: true,
                      decoration: InputDecoration(hintText: 'School Name'),
                      enabled: schoolSearch,
                    )
                ),
                  SizedBox(width: 25),
                  Checkbox(value: schoolSearch, onChanged: (bool val) => setState(() => schoolSearch = val))
          ]
              ),

              Row(
                  children: <Widget> [Container(
                      width: 315,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: department,
                        autocorrect: true,
                        decoration: InputDecoration(hintText: 'Department'),
                        enabled: departmentSearch,
                      )
                  ),
                    SizedBox(width: 25),
                    Checkbox(value: departmentSearch, onChanged: (bool val) => setState(() => departmentSearch = val))
                  ]
              ),

              Row(
                  children: <Widget> [
                    Container(
                      width: 315,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: minGPA,
                        autocorrect: true,
                        decoration: InputDecoration(hintText: 'Min GPA'),
                        enabled: gpaSearch,
                      )
                  ),
                    SizedBox(width: 25),
                    Checkbox(value: gpaSearch, onChanged: (bool val) => setState(() => gpaSearch = val))
                  ]
              ),
              Row(
                  children: <Widget> [Container(
                      width: 315,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        cursorColor: kPrimaryColor,
                        controller: minGrade,
                        autocorrect: true,
                        decoration: InputDecoration(hintText: 'Min Grade'),
                        enabled: gradeSearch,
                      )
                  ),
                    SizedBox(width: 25),
                    Checkbox(value: gradeSearch, onChanged: (bool val) => setState(() => gradeSearch = val))
                  ]
              ),
              Row(
                  children: <Widget> [
                    Container(
                      width: 315,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: minNumOfProjects,
                        autocorrect: true,
                        decoration: InputDecoration(hintText: 'Min Number Of projects'),
                        enabled: projectSearch,
                      )
                  ),
                    SizedBox(width: 25),
                    Checkbox(value: projectSearch ,onChanged: (bool val) => setState(() => projectSearch = val))
                  ]
              ),
              Row(
                  children: <Widget> [Container(
                      width: 315,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: minNumOfExperience,
                        autocorrect: true,
                        decoration: InputDecoration(hintText: 'Min Number Of Experience'),
                        enabled: experienceSearch,
                      )
                  ),
                    SizedBox(width: 25),
                    Checkbox(value: experienceSearch, onChanged: (bool val) => setState(() => experienceSearch = val))
                  ]
              ),    Row(
                  children: <Widget> [Container(
                      width: 315,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: mainSkill,
                        autocorrect: true,
                        decoration: InputDecoration(hintText: 'Main Skill Student Has'),
                        enabled: skillSearch,
                      )
                  ),
                    SizedBox(width: 25),
                    Checkbox(value: skillSearch, onChanged: (bool val) => setState(() => skillSearch = val))
                  ]
              ),    Row(
                  children: <Widget> [Container(
                      width: 315,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: mainLanguage,
                        autocorrect: true,
                        decoration: InputDecoration(hintText: 'Main Language Student Has'),
                        enabled: languageSearch,
                      )
                  ),
                    SizedBox(width: 25),
                    Checkbox(value: languageSearch, onChanged: (bool val) => setState(() => languageSearch = val))
                  ]
              ),

              RaisedButton(
                onPressed:()=> getItemAndNavigate(context),
                color: kPrimaryColor,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text('Search For Intern'),
              ),

            ],
          ),
        ));
  }
}
