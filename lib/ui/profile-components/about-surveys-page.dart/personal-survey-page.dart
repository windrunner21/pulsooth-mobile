import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PersonalSurveyPage extends StatefulWidget {
  @override
  _PersonalSurveyPageState createState() => _PersonalSurveyPageState();
}

enum HumanGender { male, female }
enum HumanAge { first, second, third, fourth, fifth }

class _PersonalSurveyPageState extends State<PersonalSurveyPage> {
  HumanGender _gender = HumanGender.male;
  HumanAge _age = HumanAge.first;

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
                    "Gender",
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
                            _gender = HumanGender.male;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('Male'),
                        leading: Radio(
                          value: HumanGender.male,
                          groupValue: _gender,
                          onChanged: (HumanGender value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            _gender = HumanGender.female;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('Female'),
                        leading: Radio(
                          value: HumanGender.female,
                          groupValue: _gender,
                          onChanged: (HumanGender value) {
                            setState(() {
                              _gender = value;
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
                    "Age",
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
                            _age = HumanAge.first;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('12 - 17'),
                        leading: Radio(
                          value: HumanAge.first,
                          groupValue: _age,
                          onChanged: (HumanAge value) {
                            setState(() {
                              _age = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            _age = HumanAge.second;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('18 - 24'),
                        leading: Radio(
                          value: HumanAge.second,
                          groupValue: _age,
                          onChanged: (HumanAge value) {
                            setState(() {
                              _age = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            _age = HumanAge.third;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('25 - 34'),
                        leading: Radio(
                          value: HumanAge.third,
                          groupValue: _age,
                          onChanged: (HumanAge value) {
                            setState(() {
                              _age = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            _age = HumanAge.fourth;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('35 - 44'),
                        leading: Radio(
                          value: HumanAge.fourth,
                          groupValue: _age,
                          onChanged: (HumanAge value) {
                            setState(() {
                              _age = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            _age = HumanAge.fifth;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('45+'),
                        leading: Radio(
                          value: HumanAge.fifth,
                          groupValue: _age,
                          onChanged: (HumanAge value) {
                            setState(() {
                              _age = value;
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
