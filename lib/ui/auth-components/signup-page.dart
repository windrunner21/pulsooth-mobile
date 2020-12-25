import 'package:flutter/material.dart';
import 'package:pulsooth_mobile/classes/phone-number-formatter.dart';
import 'package:pulsooth_mobile/ui/home-components/home-page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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

  @override
  void initState() {
    super.initState();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    phoneNumberNode = FocusNode();
    fullNameNode = FocusNode();
  }

  @override
  void dispose() {
    // texteditingcontroller
    email.dispose();
    password.dispose();
    phoneNumber.dispose();
    fullName.dispose();

    // focusnode
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    phoneNumberNode.dispose();
    fullNameNode.dispose();

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
      backgroundColor: Color(0xFFF6F6F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0xFF5B70D9),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
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
}
