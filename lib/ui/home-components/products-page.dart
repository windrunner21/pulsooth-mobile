import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F9),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage('lib/assets/test.png'),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'December 24, 2020',
                            style: TextStyle(
                                color: Color(0xFF364DB9),
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Meal for Events',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text('Brought to you by Taste Technology'),
                        ],
                      ),
                      Text('98 pcs')
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
