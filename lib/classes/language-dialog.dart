import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageDialog extends StatefulWidget {
  final String title, descriptions, text;
  final Image img;

  const LanguageDialog(
      {Key key, this.title, this.descriptions, this.text, this.img})
      : super(key: key);

  @override
  _LanguageDialogState createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  static const double padding = 20;
  static const double avatarRadius = 45;
  bool _azeri = false;
  bool _english = true;
  bool _russian = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: padding,
              top: avatarRadius + padding,
              right: padding,
              bottom: padding),
          margin: EdgeInsets.only(top: avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0, 10),
                    blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Divider(color: Colors.grey[400]),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: Image(
                        image: AssetImage('lib/assets/aze.png'),
                        height: 30,
                      ),
                      title: Text('Azerbaijani'),
                      trailing: CupertinoSwitch(
                        activeColor: Color(0xFF5B70D9),
                        value: _azeri,
                        onChanged: (bool value) {
                          setState(() {
                            _azeri = true;

                            if (_azeri) {
                              _english = false;
                              _russian = false;
                            }
                          });
                        },
                      ),
                      onTap: () {
                        setState(() {
                          _azeri = true;

                          if (_azeri) {
                            _english = false;
                            _russian = false;
                          }
                        });
                      },
                    ),
                    Divider(color: Colors.grey[400]),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: Image(
                        image: AssetImage('lib/assets/eng.png'),
                        height: 30,
                      ),
                      title: Text('English'),
                      trailing: CupertinoSwitch(
                        activeColor: Color(0xFF5B70D9),
                        value: _english,
                        onChanged: (bool value) {
                          setState(() {
                            _english = true;

                            if (_english) {
                              _azeri = false;
                              _russian = false;
                            }
                          });
                        },
                      ),
                      onTap: () {
                        setState(() {
                          _english = true;

                          if (_english) {
                            _azeri = false;
                            _russian = false;
                          }
                        });
                      },
                    ),
                    Divider(color: Colors.grey[400]),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: Image(
                        image: AssetImage('lib/assets/ru.png'),
                        height: 30,
                      ),
                      title: Text('Russian'),
                      trailing: CupertinoSwitch(
                        activeColor: Color(0xFF5B70D9),
                        value: _russian,
                        onChanged: (bool value) {
                          setState(() {
                            _russian = true;

                            if (_russian) {
                              _azeri = false;
                              _english = false;
                            }
                          });
                        },
                      ),
                      onTap: () {
                        setState(() {
                          _russian = true;

                          if (_russian) {
                            _azeri = false;
                            _english = false;
                          }
                        });
                      },
                    ),
                    Divider(color: Colors.grey[400]),
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      widget.text,
                      style: TextStyle(fontSize: 18),
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          left: padding,
          right: padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: avatarRadius,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
              child: Image.asset("lib/assets/test4.png"),
            ),
          ),
        ),
      ],
    );
  }
}
