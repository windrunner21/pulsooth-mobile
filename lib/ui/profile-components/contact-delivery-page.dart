import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulsooth_mobile/classes/phone-number-formatter.dart';
import 'package:pulsooth_mobile/ui/product-components/bag-page.dart';

class ContactDeliveryPage extends StatefulWidget {
  @override
  _ContactDeliveryPageState createState() => _ContactDeliveryPageState();
}

class _ContactDeliveryPageState extends State<ContactDeliveryPage> {
  FocusNode emailFocusNode;
  FocusNode phoneNumberFocusNode;
  FocusNode cityFocusNode;
  FocusNode districtFocusNode;
  FocusNode addressFocusNode;
  FocusNode postalFocusNode;

  final email = TextEditingController(text: "haciyev@gmail.com");
  final phoneNumber = TextEditingController(text: "51 780 79 29");
  final city = TextEditingController(text: "Baku");
  final district = TextEditingController(text: "Yasamal");
  final address = TextEditingController(text: "Beerbasha");
  final postal = TextEditingController(text: "AZ1073");

  @override
  void initState() {
    super.initState();
    emailFocusNode = FocusNode();
    phoneNumberFocusNode = FocusNode();
    cityFocusNode = FocusNode();
    districtFocusNode = FocusNode();
    addressFocusNode = FocusNode();
    postalFocusNode = FocusNode();
  }

  @override
  void dispose() {
    email.dispose();
    phoneNumber.dispose();
    emailFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    cityFocusNode.dispose();
    districtFocusNode.dispose();
    addressFocusNode.dispose();
    postalFocusNode.dispose();
    super.dispose();
  }

  void _requestFocus(numb) {
    setState(
      () {
        if (numb == 1) {
          FocusScope.of(context).requestFocus(emailFocusNode);
        } else if (numb == 2) {
          FocusScope.of(context).requestFocus(phoneNumberFocusNode);
        } else if (numb == 3) {
          FocusScope.of(context).requestFocus(cityFocusNode);
        } else if (numb == 4) {
          FocusScope.of(context).requestFocus(districtFocusNode);
        } else if (numb == 5) {
          FocusScope.of(context).requestFocus(addressFocusNode);
        } else if (numb == 6) {
          FocusScope.of(context).requestFocus(postalFocusNode);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F9),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          'Contact & Delivery',
          style: GoogleFonts.exo2(
            textStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
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
                  height: MediaQuery.of(context).size.height / 1.6,
                ),
                clipper: BottomWaveClipper(),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
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
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Contact Information",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
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
                        focusNode: phoneNumberFocusNode,
                        onTap: () {
                          _requestFocus(2);
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
                            color: phoneNumberFocusNode.hasFocus
                                ? Color(0xFF5B70D9)
                                : Colors.grey[400],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
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
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Delivery Information",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        focusNode: cityFocusNode,
                        onTap: () {
                          _requestFocus(3);
                        },
                        controller: city,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
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
                          labelText: 'City',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: cityFocusNode.hasFocus
                                ? Color(0xFF5B70D9)
                                : Colors.grey[400],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        focusNode: districtFocusNode,
                        onTap: () {
                          _requestFocus(4);
                        },
                        controller: district,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
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
                          labelText: 'District',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: districtFocusNode.hasFocus
                                ? Color(0xFF5B70D9)
                                : Colors.grey[400],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        focusNode: addressFocusNode,
                        onTap: () {
                          _requestFocus(5);
                        },
                        controller: address,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
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
                          labelText: 'Address Line',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: addressFocusNode.hasFocus
                                ? Color(0xFF5B70D9)
                                : Colors.grey[400],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        focusNode: postalFocusNode,
                        onTap: () {
                          _requestFocus(5);
                        },
                        controller: postal,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.characters,
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
                          labelText: 'Postal Code',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: postalFocusNode.hasFocus
                                ? Color(0xFF5B70D9)
                                : Colors.grey[400],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    color: Color(0xFF5B70D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Save",
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
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 80);

    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width / 1.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
