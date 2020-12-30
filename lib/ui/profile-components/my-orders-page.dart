import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulsooth_mobile/ui/product-components/bag-page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

final List orderInfoList = [
  {'qty': 3, 'title': 'Claimed Products'},
  {'qty': 1, 'title': 'Available Product Claims'},
  {'qty': 2, 'title': 'Completed Surveys'},
];

class MyOrdersPage extends StatefulWidget {
  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  // current carousel index
  int _currentIndex = 0;

  // carousel items
  final List<Widget> orderInfoCards = orderInfoList
      .map(
        (orderInfo) => Container(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              gradient: orderInfoList.indexOf(orderInfo) == 0
                  ? LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xFF6F5EF1), Color(0xFF5B64ED)],
                    )
                  : orderInfoList.indexOf(orderInfo) == 2
                      ? LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Color(0xFF7D6DEC), Color(0xFF7689F1)],
                        )
                      : null,
              color: orderInfoList.indexOf(orderInfo) == 1
                  ? Color(0xFF7EB1F9)
                  : null,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You Have',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Divider(color: Colors.white, indent: 20, endIndent: 20),
                Text(
                  orderInfo['qty'].toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                Divider(color: Colors.white, indent: 20, endIndent: 20),
                SizedBox(height: 5),
                Text(
                  orderInfo['title'],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'My Orders',
          style: GoogleFonts.exo2(
            textStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
              icon: Icon(SimpleLineIcons.bag, color: Colors.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 7),
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: orderInfoCards,
            ),
            DotsIndicator(
              dotsCount: orderInfoList.length,
              position: _currentIndex.toDouble(),
              decorator: DotsDecorator(
                color: Colors.blue[100],
                activeColor: Colors.blue,
                activeSize: Size(6, 6),
                size: Size(6, 6),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  color: Color(0xFFF6F6F9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recently ordered',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Here you can see all your previously received products.',
                      maxLines: 2,
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 3,
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/test.png'),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Meal for Events',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            Text('21 December, 2020'),
                                            SizedBox(height: 5),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Status: ',
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            index == 1
                                                ? Text(
                                                    'In Transit',
                                                    style: TextStyle(
                                                      color: Color(0xFF364db9),
                                                    ),
                                                  )
                                                : Text(
                                                    'Delivered',
                                                    style: TextStyle(
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                index == 1
                                    ? Icon(
                                        SimpleLineIcons.pencil,
                                        color: Color(0xFF364db9),
                                      )
                                    : Icon(SimpleLineIcons.check,
                                        color: Colors.green)
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
