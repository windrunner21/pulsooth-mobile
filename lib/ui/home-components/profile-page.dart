import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:pulsooth_mobile/ui/profile-components/my-orders-page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Colors.white,
              ),
              ClipPath(
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xFF715DF4), Color(0xFF4D69EE)],
                    ),
                  ),
                ),
                clipper: BottomWaveClipper(),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyOrdersPage(),
                              ),
                            );
                          },
                          leading: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(
                              SimpleLineIcons.handbag,
                              color: Colors.black,
                            ),
                          ),
                          title: Text(
                            'My Orders',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          trailing: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              SimpleLineIcons.arrow_right,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        indent: 20,
                        endIndent: 20,
                        color: Colors.black38,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          onTap: () {
                            print('y');
                          },
                          leading: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(
                              SimpleLineIcons.directions,
                              color: Colors.black,
                            ),
                          ),
                          title: Text('Contact & Delivery',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          trailing: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              SimpleLineIcons.arrow_right,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: ListTile(
                          onTap: () {
                            print('z');
                          },
                          leading: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(
                              SimpleLineIcons.note,
                              color: Colors.black,
                            ),
                          ),
                          title: Text(
                            'About Me',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          trailing: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              SimpleLineIcons.arrow_right,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        indent: 20,
                        endIndent: 20,
                        color: Colors.black38,
                      ),
                      ListTile(
                        onTap: () {
                          print('xx');
                        },
                        leading: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(
                            SimpleLineIcons.book_open,
                            color: Colors.black,
                          ),
                        ),
                        title: Text(
                          'News',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        trailing: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            SimpleLineIcons.arrow_right,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Divider(
                        indent: 20,
                        endIndent: 20,
                        color: Colors.black38,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          onTap: () {
                            print('zz');
                          },
                          leading: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(
                              SimpleLineIcons.globe,
                              color: Colors.black,
                            ),
                          ),
                          title: Text(
                            'Language',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          trailing: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              SimpleLineIcons.arrow_right,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: ListTile(
                      onTap: () {
                        print('zxx');
                      },
                      leading: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          SimpleLineIcons.logout,
                          color: Colors.black,
                        ),
                      ),
                      title: Text(
                        'Sign Out',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                      trailing: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          SimpleLineIcons.arrow_right,
                          size: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
