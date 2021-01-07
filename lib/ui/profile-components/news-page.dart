import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulsooth_mobile/ui/product-components/bag-page.dart';

class NewsPage extends StatelessWidget {
  final news = [
    {
      "title": "Pulsooth team gifts you plus one order to your quotas",
      "image": "https://source.unsplash.com/fIq0tET6llw",
      "label": "Important",
      "color": [Colors.red, Colors.orange]
    },
    {
      "title": "New Mobile App is out in 2021 and it's awesome!",
      "image": "https://source.unsplash.com/45xWrNPD7SE",
      "label": "Mobile",
      "color": [Colors.purple, Colors.deepPurple]
    },
    {
      "title": "Latest news are now available in your web dashboard",
      "image": "https://source.unsplash.com/FJ5e_2f96h4",
      "label": "Web",
      "color": [Colors.blue, Colors.indigo]
    },
    {
      "title": "Send your products feedback to earn new order quotas",
      "image": "https://source.unsplash.com/1mp7rF7_j2I",
      "label": "Products",
      "color": [Colors.green, Colors.teal]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Latest News',
          style: GoogleFonts.exo2(
            textStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
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
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 20),
        itemCount: news.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 7,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: news[index]['color'],
                            ),
                          ),
                          child: Text(
                            news[index]['label'].toString().toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          ),
                        ),
                        Text(
                          news[index]['title'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width / 3.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      news[index]['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
