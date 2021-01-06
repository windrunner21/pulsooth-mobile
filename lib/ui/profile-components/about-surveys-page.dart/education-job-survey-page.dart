import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class EducationJobSurveyPage extends StatefulWidget {
  @override
  _EducationJobSurveyPageState createState() => _EducationJobSurveyPageState();
}

enum Education {
  primary,
  generalSecondary,
  completeSecondary,
  primaryAndSecondary,
  higher
}
enum JobStatus { unemployed, part, full, retired }

enum Salary { first, second, third, fourth, fifth }

class _EducationJobSurveyPageState extends State<EducationJobSurveyPage> {
  Education _education = Education.primary;
  JobStatus _job = JobStatus.unemployed;
  Salary _salary = Salary.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 60, 0, 30),
      color: Color(0xFFF6F6F9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    "Fill Your Information",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF364DB9),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(SimpleLineIcons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                  child: Text(
                    "Education",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0, bottom: 30),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            _education = Education.primary;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('Primary Education'),
                        leading: Radio(
                          value: Education.primary,
                          groupValue: _education,
                          onChanged: (Education value) {
                            setState(() {
                              _education = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            _education = Education.generalSecondary;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('General Secondary Education'),
                        leading: Radio(
                          value: Education.generalSecondary,
                          groupValue: _education,
                          onChanged: (Education value) {
                            setState(() {
                              _education = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            _education = Education.completeSecondary;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('Complete Secondary Education'),
                        leading: Radio(
                          value: Education.completeSecondary,
                          groupValue: _education,
                          onChanged: (Education value) {
                            setState(() {
                              _education = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            _education = Education.primaryAndSecondary;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title:
                            Text('Primary and Secondary Vocational Education'),
                        leading: Radio(
                          value: Education.primaryAndSecondary,
                          groupValue: _education,
                          onChanged: (Education value) {
                            setState(() {
                              _education = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            _education = Education.higher;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('Higher Education'),
                        leading: Radio(
                          value: Education.higher,
                          groupValue: _education,
                          onChanged: (Education value) {
                            setState(() {
                              _education = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                  child: Text(
                    "Job Status",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            _job = JobStatus.unemployed;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('Unemployed'),
                        leading: Radio(
                          value: JobStatus.unemployed,
                          groupValue: _job,
                          onChanged: (JobStatus value) {
                            setState(() {
                              _job = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            _job = JobStatus.part;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('Part-Time Job'),
                        leading: Radio(
                          value: JobStatus.part,
                          groupValue: _job,
                          onChanged: (JobStatus value) {
                            setState(() {
                              _job = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            _job = JobStatus.full;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('Full-Time Job'),
                        leading: Radio(
                          value: JobStatus.full,
                          groupValue: _job,
                          onChanged: (JobStatus value) {
                            setState(() {
                              _job = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            _job = JobStatus.retired;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('Retired'),
                        leading: Radio(
                          value: JobStatus.retired,
                          groupValue: _job,
                          onChanged: (JobStatus value) {
                            setState(() {
                              _job = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
                  child: Text(
                    "Salary",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            _salary = Salary.first;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('₼ 0 - ₼ 249'),
                        leading: Radio(
                          value: Salary.first,
                          groupValue: _salary,
                          onChanged: (Salary value) {
                            setState(() {
                              _salary = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            _salary = Salary.second;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('₼ 250 - ₼ 499'),
                        leading: Radio(
                          value: Salary.second,
                          groupValue: _salary,
                          onChanged: (Salary value) {
                            setState(() {
                              _salary = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            _salary = Salary.third;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('₼ 500 - ₼ 999'),
                        leading: Radio(
                          value: Salary.third,
                          groupValue: _salary,
                          onChanged: (Salary value) {
                            setState(() {
                              _salary = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            _salary = Salary.fourth;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('₼ 1000 - ₼ 1499'),
                        leading: Radio(
                          value: Salary.fourth,
                          groupValue: _salary,
                          onChanged: (Salary value) {
                            setState(() {
                              _salary = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            _salary = Salary.fifth;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('₼ 1500+'),
                        leading: Radio(
                          value: Salary.fifth,
                          groupValue: _salary,
                          onChanged: (Salary value) {
                            setState(() {
                              _salary = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            margin: EdgeInsets.symmetric(vertical: 30),
            width: double.infinity,
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 10),
              onPressed: () {},
              color: Color(0xFF364DB9),
              elevation: 5,
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
