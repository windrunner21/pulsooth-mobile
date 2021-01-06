import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulsooth_mobile/ui/product-components/bag-page.dart';
import 'package:pulsooth_mobile/ui/profile-components/about-surveys-page.dart/education-job-survey-page.dart';
import 'package:pulsooth_mobile/ui/profile-components/about-surveys-page.dart/family-survey-page.dart';
import 'package:pulsooth_mobile/ui/profile-components/about-surveys-page.dart/personal-survey-page.dart';

class AboutMePage extends StatefulWidget {
  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F9),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'About Me',
          style: GoogleFonts.exo2(
            textStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: false,
        backgroundColor: Color(0xFF5B70D9),
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BagPage(),
                  ),
                );
              },
              icon: Icon(SimpleLineIcons.bag, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Colors.white,
              ),
              ClipPath(
                child: Container(
                  color: Color(0xFF5B70D9),
                  height: MediaQuery.of(context).size.height / 3.5,
                ),
                clipper: BottomWaveClipper(),
              ),
            ],
          ),
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            children: [
              Text(
                'Privacy & Policy',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                'Your private information is not being shared with anyone and is only being used for personal recommendations to ease your experience.',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('lib/assets/test3.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Text(
                        'Earn +5 quota',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        'Enter the information about yourself to get custom tailored recommendations and get +5 to your quota of product orders.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'Categories',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF4D69EE),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ListTile(
                      onTap: () => _openSurvey(context, 1),
                      leading: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          SimpleLineIcons.user,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        'Personal',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          SimpleLineIcons.arrow_right,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF80B8F3),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ListTile(
                      onTap: () => _openSurvey(context, 2),
                      leading: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          SimpleLineIcons.briefcase,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        'Education & Job',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          SimpleLineIcons.arrow_right,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF746AEB),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ListTile(
                      onTap: () => _openSurvey(context, 3),
                      leading: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          SimpleLineIcons.home,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        'Family',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          SimpleLineIcons.arrow_right,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _openSurvey(context, index) async {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    builder: (BuildContext context) {
      if (index == 1) {
        return PersonalSurveyPage();
      }

      if (index == 2) {
        return EducationJobSurveyPage();
      }

      if (index == 3) {
        return FamilySurveyPage();
      }

      return SizedBox();
    },
  );
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);

    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
