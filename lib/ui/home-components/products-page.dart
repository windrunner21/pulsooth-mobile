import 'package:flutter/material.dart';
import 'package:pulsooth_mobile/ui/product-components/product-page.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
  final authObject;
  ProductsPage({Key key, this.authObject}) : super(key: key);
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F9),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        itemCount: 3,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductPage(authObject: widget.authObject),
                ),
              );
            },
            child: Container(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
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
            ),
          );
        },
      ),
    );
  }
}
