import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pulsooth_mobile/classes/phone-number-formatter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pulsooth_mobile/ui/home-components/home-page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
  final toSignUp;
  SignUpPage({Key key, this.toSignUp}) : super(key: key);
}

class _SignUpPageState extends State<SignUpPage> {
  // scaffold key
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  // key to check the sign in form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode emailFocusNode;
  FocusNode passwordFocusNode;
  FocusNode phoneNumberNode;
  FocusNode fullNameNode;

  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final fullName = TextEditingController();

  // focus nodes for text fields - sms validation
  FocusNode _focus1;
  FocusNode _focus2;
  FocusNode _focus3;
  FocusNode _focus4;
  FocusNode _focus5;
  FocusNode _focus6;

  final _pin1 = TextEditingController();
  final _pin2 = TextEditingController();
  final _pin3 = TextEditingController();
  final _pin4 = TextEditingController();
  final _pin5 = TextEditingController();
  final _pin6 = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    phoneNumberNode = FocusNode();
    fullNameNode = FocusNode();
    _focus1 = FocusNode();
    _focus2 = FocusNode();
    _focus3 = FocusNode();
    _focus4 = FocusNode();
    _focus5 = FocusNode();
    _focus6 = FocusNode();
  }

  @override
  void dispose() {
    // texteditingcontroller
    email.dispose();
    password.dispose();
    phoneNumber.dispose();
    fullName.dispose();
    _pin1.dispose();
    _pin2.dispose();
    _pin3.dispose();
    _pin4.dispose();
    _pin5.dispose();
    _pin6.dispose();

    // focusnode
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    phoneNumberNode.dispose();
    fullNameNode.dispose();
    _focus1.dispose();
    _focus2.dispose();
    _focus3.dispose();
    _focus4.dispose();
    _focus5.dispose();
    _focus6.dispose();

    super.dispose();
  }

  void _requestFocus(numb) {
    setState(() {
      if (numb == 1) {
        FocusScope.of(context).requestFocus(emailFocusNode);
      } else if (numb == 2) {
        FocusScope.of(context).requestFocus(passwordFocusNode);
      } else if (numb == 3) {
        FocusScope.of(context).requestFocus(phoneNumberNode);
      } else if (numb == 4) {
        FocusScope.of(context).requestFocus(fullNameNode);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFF6F6F9),
      appBar: widget.toSignUp
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(
                color: Color(0xFF5B70D9),
              ),
            )
          : null,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: widget.toSignUp
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[400],
                      offset: Offset(0.0, 1.0),
                      blurRadius: 10,
                    ),
                  ],
                ),
                padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Registration",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                      focusNode: fullNameNode,
                      onTap: () {
                        _requestFocus(4);
                      },
                      controller: fullName,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFE2E2E2), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF5B70D9), width: 2),
                        ),
                        focusColor: Color(0xFF5B70D9),
                        labelText: 'Full Name',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: fullNameNode.hasFocus
                              ? Color(0xFF5B70D9)
                              : Colors.grey[400],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      focusNode: phoneNumberNode,
                      onTap: () {
                        _requestFocus(3);
                      },
                      controller: phoneNumber,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        PhoneNumberFormatter(
                          mask: 'xx xxx xx xx',
                          separator: ' ',
                        ),
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFE2E2E2), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF5B70D9), width: 2),
                        ),
                        focusColor: Color(0xFF5B70D9),
                        labelText: 'Phone Number',
                        prefixText: '+994 ',
                        hintText: 'xx xxx xx xx',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: phoneNumberNode.hasFocus
                              ? Color(0xFF5B70D9)
                              : Colors.grey[400],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      focusNode: emailFocusNode,
                      onTap: () {
                        _requestFocus(1);
                      },
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFE2E2E2), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF5B70D9), width: 2),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: emailFocusNode.hasFocus
                              ? Color(0xFF5B70D9)
                              : Colors.grey[400],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      focusNode: passwordFocusNode,
                      onTap: () {
                        _requestFocus(2);
                      },
                      controller: password,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFE2E2E2), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF5B70D9), width: 2),
                        ),
                        focusColor: Color(0xFF5B70D9),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: passwordFocusNode.hasFocus
                              ? Color(0xFF5B70D9)
                              : Colors.grey[400],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        color: Color(0xFF5B70D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _register();
                          }
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _register() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: email.text,
      password: password.text,
    ))
        .user;

    if (user != null) {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+994 ' + phoneNumber.text,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          user.linkWithCredential(credential).then((user) {
            print(user.user.uid);
            user.user.updateProfile(displayName: fullName.text).then((value) {
              http.post(
                'https://pulsooth.az/api/auth/createUser',
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(
                  <String, String>{'f_id': user.user.uid},
                ),
              );

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                  (route) => false);
            }).catchError((error) {
              user.user.delete();
            });
          }).catchError((error) {
            user.delete();
            print(error.toString());
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            user.delete();
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text("Phone number is invalid"),
              ),
            );
          } else {
            user.delete();
            SnackBar(
              content: Text("Failed to sign up via your credentials"),
            );

            print(e.code);
          }
        },
        codeSent: (String verificationId, int resendToken) async {
          // Update the UI - wait for the user to enter the SMS code

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            builder: (BuildContext context) {
              return Scaffold(
                body: Padding(
                  padding: EdgeInsets.symmetric(vertical: 100, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Enter the Code',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      Text(
                        'to Verify Your Phone',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'We have sent you an SMS with a code to',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Text(
                        'the number +994 ' + phoneNumber.text,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      // custom sms code entering
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          // sms pin 1
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 12,
                            child: TextField(
                                controller: _pin1,
                                focusNode: _focus1,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                onChanged: (str) {
                                  if (str.length == 1) {
                                    FocusScope.of(context)
                                        .requestFocus(_focus2);
                                  }
                                }),
                          ),
                          // sms pin 2
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 12,
                            child: TextField(
                                controller: _pin2,
                                focusNode: _focus2,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                onChanged: (str) {
                                  if (str.length == 0) {
                                    FocusScope.of(context)
                                        .requestFocus(_focus1);
                                  }
                                  if (str.length == 1) {
                                    FocusScope.of(context)
                                        .requestFocus(_focus3);
                                  }
                                }),
                          ),
                          // sms pin 3
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 12,
                            child: TextField(
                                controller: _pin3,
                                focusNode: _focus3,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                onChanged: (str) {
                                  if (str.length == 0) {
                                    FocusScope.of(context)
                                        .requestFocus(_focus2);
                                  }
                                  if (str.length == 1) {
                                    FocusScope.of(context)
                                        .requestFocus(_focus4);
                                  }
                                }),
                          ),
                          // sms pin 4
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 12,
                            child: TextField(
                                controller: _pin4,
                                focusNode: _focus4,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                onChanged: (str) {
                                  if (str.length == 0) {
                                    FocusScope.of(context)
                                        .requestFocus(_focus3);
                                  }
                                  if (str.length == 1) {
                                    FocusScope.of(context)
                                        .requestFocus(_focus5);
                                  }
                                }),
                          ),
                          // sms pin 5
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 12,
                            child: TextField(
                                controller: _pin5,
                                focusNode: _focus5,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                onChanged: (str) {
                                  if (str.length == 0) {
                                    FocusScope.of(context)
                                        .requestFocus(_focus4);
                                  }
                                  if (str.length == 1) {
                                    FocusScope.of(context)
                                        .requestFocus(_focus6);
                                  }
                                }),
                          ),
                          // sms pin 6
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 12,
                            child: TextField(
                              controller: _pin6,
                              focusNode: _focus6,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1)
                              ],
                              onChanged: (str) async {
                                if (str.length == 0) {
                                  FocusScope.of(context).requestFocus(_focus5);
                                }
                                if (str.length == 1) {
                                  final _smsCode = _pin1.text +
                                      _pin2.text +
                                      _pin3.text +
                                      _pin4.text +
                                      _pin5.text +
                                      _pin6.text;

                                  // Create a PhoneAuthCredential with the code
                                  PhoneAuthCredential phoneAuthCredential =
                                      PhoneAuthProvider.credential(
                                    verificationId: verificationId,
                                    smsCode: _smsCode,
                                  );

                                  // Sign the user in (or link) with the credential
                                  user
                                      .linkWithCredential(phoneAuthCredential)
                                      .then(
                                    (user) {
                                      print(user.user.uid);
                                      user.user
                                          .updateProfile(
                                              displayName: fullName.text)
                                          .then(
                                            (value) => http.post(
                                              'https://pulsooth.az/api/auth/createUser',
                                              headers: <String, String>{
                                                'Content-Type':
                                                    'application/json; charset=UTF-8',
                                              },
                                              body: jsonEncode(
                                                <String, String>{
                                                  'f_id': user.user.uid
                                                },
                                              ),
                                            ),
                                          )
                                          .catchError(
                                        (error) {
                                          user.user.delete();
                                        },
                                      );

                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomePage(),
                                          ),
                                          (route) => false);
                                    },
                                  ).catchError(
                                    (error) {
                                      if (error.code !=
                                          'invalid-verification-code') {
                                        print('removed');
                                        user.delete();
                                      } else {
                                        print(
                                            'not removed due to invalid verification code');
                                      }
                                      print(error.toString());
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Send a new code',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } else {
      SnackBar(
        content: Text("Failed to sign up via your credentials"),
      );
    }
  }
}
