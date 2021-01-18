import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pulsooth_mobile/classes/giveaway-dialog.dart';
import 'package:pulsooth_mobile/ui/auth-components/signup-page.dart';
import 'package:pulsooth_mobile/ui/product-components/product-page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
  final authObject;
  final future;
  DashboardPage({Key key, this.authObject, this.future}) : super(key: key);
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
          ClipPath(
            child: Container(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                        child: FutureBuilder(
                          future: widget.future,
                          builder: (context, snapshot) {
                            if (ConnectionState.done ==
                                snapshot.connectionState) {
                              return Image.network(
                                'https://pulsooth.az/' +
                                    snapshot.data.itemsList.items[0].image,
                              );
                            } else {
                              return SizedBox();
                            }
                          },
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
                            FutureBuilder(
                              future: widget.future,
                              builder: (context, snapshot) {
                                if (ConnectionState.done ==
                                    snapshot.connectionState) {
                                  return Text(
                                    snapshot.data.itemsList.items[0].name,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  );
                                } else {
                                  return Text(
                                    'Loading',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  );
                                }
                              },
                            ),
                            SizedBox(height: 10),
                            FutureBuilder(
                              future: widget.future,
                              builder: (context, snapshot) {
                                if (ConnectionState.done ==
                                    snapshot.connectionState) {
                                  return Text('by ' +
                                      snapshot
                                          .data.itemsList.items[0].brandName);
                                } else {
                                  return Text('Loading');
                                }
                              },
                            ),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductPage(
                                        authObject: widget.authObject),
                                  ),
                                );
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
            clipper: BottomWaveClipper(),
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
                  FutureBuilder(
                    future: widget.future,
                    builder: (context, snapshot) {
                      if (ConnectionState.done == snapshot.connectionState) {
                        if (snapshot.data.giveawayList.giveaways.length > 0) {
                          // overall format
                          DateFormat format = new DateFormat("MMMM dd, yyyy");

                          // date times - start and end
                          DateTime startDateTime = DateTime.parse(snapshot
                              .data.giveawayList.giveaways[0].startDate);
                          DateTime endDateTime = DateTime.parse(
                              snapshot.data.giveawayList.giveaways[0].endDate);

                          // formatted strings
                          String formatStartDate = format.format(startDateTime);
                          String formatEndDate = format.format(endDateTime);

                          return Text(formatStartDate + ' - ' + formatEndDate);
                        } else {
                          return Text('No giveaways are now in progress.');
                        }
                      } else {
                        return Text('Loading');
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  FutureBuilder(
                    future: widget.future,
                    builder: (context, snapshot) {
                      if (ConnectionState.done == snapshot.connectionState) {
                        if (snapshot.data.giveawayList.giveaways.length > 0) {
                          return Column(
                            children: [
                              for (var i = 0;
                                  i <
                                      snapshot
                                          .data.giveawayList.giveaways.length;
                                  i++)
                                GestureDetector(
                                  onTap: () {
                                    widget.authObject != null
                                        ? showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return GiveawayDialog(
                                                title: snapshot
                                                        .data
                                                        .giveawayList
                                                        .giveaways[i]
                                                        .name +
                                                    " Coupon",
                                                descriptions:
                                                    'You are about to draw your coupon. Are you sure?',
                                                no: 'No',
                                                yes: 'Yes',
                                                img: snapshot.data.giveawayList
                                                    .giveaways[i].image,
                                              );
                                            },
                                          )
                                        : Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SignUpPage(toSignUp: true),
                                            ),
                                          );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 15),
                                    width: double.infinity,
                                    height:
                                        MediaQuery.of(context).size.height / 8,
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
                                            child: Image.network(
                                              'https://pulsooth.az/' +
                                                  snapshot.data.giveawayList
                                                      .giveaways[i].image,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          color: Colors.grey.withOpacity(0.4),
                                          width: 1,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                snapshot.data.giveawayList
                                                    .giveaways[i].name,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              Text(
                                                snapshot
                                                        .data
                                                        .giveawayList
                                                        .giveaways[i]
                                                        .drawsNumber
                                                        .toString() +
                                                    ' people drew',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                            ],
                          );
                        } else {
                          return SizedBox();
                        }
                      } else {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
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

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);

    // var firstControlPoint = Offset(size.width / 4, size.height);
    // var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    // path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
    //     firstEndPoint.dx, firstEndPoint.dy);

    // var secondControlPoint =
    //     Offset(size.width - (size.width / 3.25), size.height - 65);
    // var secondEndPoint = Offset(size.width, size.height - 40);
    // path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
    //     secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
