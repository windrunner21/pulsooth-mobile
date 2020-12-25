import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulsooth_mobile/ui/auth-components/login-page.dart';
import 'package:pulsooth_mobile/ui/home-components/home-page.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 5),
                child: FlatButton(
                  onPressed: () {},
                  child: IconButton(
                    icon: Icon(SimpleLineIcons.question),
                    onPressed: () {
                      launch("tel://+994517807929");
                    },
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image(
                    image: AssetImage('lib/assets/upleft.png'),
                    height: 115,
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Image(
                    image: AssetImage('lib/assets/upright.png'),
                    height: 115,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'PULSOOTH',
                  style: GoogleFonts.bungeeShade(
                    textStyle: TextStyle(
                        color: Colors.black, fontSize: 45, letterSpacing: 2),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Hands full of items.',
                  style: TextStyle(
                      color: Color(0xFF2B2A34),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image(
                    image: AssetImage('lib/assets/bottomleft.png'),
                    height: 115,
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Image(
                    image: AssetImage('lib/assets/bottomright.png'),
                    height: 115,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  width: double.infinity,
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInPage()),
                      );
                    },
                    color: Colors.white,
                    elevation: 5,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xFF364DB9),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  width: double.infinity,
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    color: Color(0xFF364DB9),
                    elevation: 5,
                    child: Text(
                      'Get Started',
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
          ],
        ),
      ),
    );
  }
}
