import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FamilySurveyPage extends StatefulWidget {
  @override
  _FamilySurveyPageState createState() => _FamilySurveyPageState();
}

enum MaritalStatus { single, married }
enum Children { zero, one, twothree, fourmore }

class _FamilySurveyPageState extends State<FamilySurveyPage> {
  MaritalStatus _maritalStatus = MaritalStatus.single;
  Children _children = Children.zero;

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
                    "Marital Status",
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
                            _maritalStatus = MaritalStatus.single;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('Single'),
                        leading: Radio(
                          value: MaritalStatus.single,
                          groupValue: _maritalStatus,
                          onChanged: (MaritalStatus value) {
                            setState(() {
                              _maritalStatus = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            _maritalStatus = MaritalStatus.married;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('Married'),
                        leading: Radio(
                          value: MaritalStatus.married,
                          groupValue: _maritalStatus,
                          onChanged: (MaritalStatus value) {
                            setState(() {
                              _maritalStatus = value;
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
                    "Children",
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
                            _children = Children.zero;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('0'),
                        leading: Radio(
                          value: Children.zero,
                          groupValue: _children,
                          onChanged: (Children value) {
                            setState(() {
                              _children = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            _children = Children.one;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('1'),
                        leading: Radio(
                          value: Children.one,
                          groupValue: _children,
                          onChanged: (Children value) {
                            setState(() {
                              _children = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            _children = Children.twothree;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('2-3'),
                        leading: Radio(
                          value: Children.twothree,
                          groupValue: _children,
                          onChanged: (Children value) {
                            setState(() {
                              _children = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            _children = Children.fourmore;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text('4+'),
                        leading: Radio(
                          value: Children.fourmore,
                          groupValue: _children,
                          onChanged: (Children value) {
                            setState(() {
                              _children = value;
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
