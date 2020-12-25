import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pulsooth_mobile/ui/auth-components/launch-page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => LaunchPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: Center(
          child: Image(
            image: AssetImage('lib/assets/logo.png'),
            height: MediaQuery.of(context).size.height / 5,
          ),
        ),
      ),
    );
  }
}
