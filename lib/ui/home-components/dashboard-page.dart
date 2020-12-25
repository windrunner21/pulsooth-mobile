import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.deepPurple[200],
                  Color(0xFF80B8F3),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Image(
                        image: AssetImage('lib/assets/test.png'),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Brought to you'),
                          Text(
                            'Meal for Events',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text('by Taste Technology'),
                        ],
                      ),
                      ClipOval(
                        child: Material(
                          color: Colors.black87, // button color
                          child: InkWell(
                            splashColor: Color(0xFF364DB9), // inkwell color
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.arrow_right_alt,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              // TODO
                            },
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pulsooth Giveaway',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //Text('No giveaways are now in progress.'),
                  Text('November 21, 2020 - December 22, 2020'),
                  SizedBox(height: 10),
                  for (var i = 0; i < 2; i++)
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image(
                              image: AssetImage('lib/assets/iphone12.png'),
                            ),
                          )),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            color: Colors.grey.withOpacity(0.4),
                            width: 1,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'iPhone 12',
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                                Text('10 people drew',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black.withOpacity(0.4)))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}