import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pulsooth_mobile/ui/product-components/product-page.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
  final authObject;
  final future;
  ProductsPage({Key key, this.authObject, this.future}) : super(key: key);
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF6F6F9),
        body: FutureBuilder(
          future: widget.future,
          builder: (context, snapshot) {
            if (ConnectionState.done == snapshot.connectionState) {
              // overall format
              DateFormat format = new DateFormat("MMMM dd, yyyy");

              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                itemCount: snapshot.data.itemsList.items.length,
                itemBuilder: (context, index) {
                  // date times - start and end
                  DateTime dateTime = DateTime.parse(
                      snapshot.data.itemsList.items[index].createdOn);

                  // formatted strings
                  String formatDateTime = format.format(dateTime);
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
                          Image.network(
                            'https://pulsooth.az/' +
                                snapshot.data.itemsList.items[index].image,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height / 3.2,
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
                                      formatDateTime,
                                      style: TextStyle(
                                          color: Color(0xFF364DB9),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      snapshot.data.itemsList.items[index].name,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('Brought to you by ' +
                                        snapshot.data.itemsList.items[index]
                                            .brandName),
                                  ],
                                ),
                                Text(snapshot.data.itemsList.items[index].amount
                                        .toString() +
                                    ' pcs')
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
