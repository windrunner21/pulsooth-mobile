import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulsooth_mobile/models/data-model.dart';
import 'package:pulsooth_mobile/ui/auth-components/signup-page.dart';
import 'package:pulsooth_mobile/ui/home-components/dashboard-page.dart';
import 'package:pulsooth_mobile/ui/home-components/products-page.dart';
import 'package:pulsooth_mobile/ui/home-components/profile-page.dart';
import 'package:pulsooth_mobile/ui/product-components/bag-page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var _future;
  // icons
  Icon homeIcon = Icon(SimpleLineIcons.grid);
  Icon samplesIcon = Icon(SimpleLineIcons.basket);
  Icon profileIcon = Icon(SimpleLineIcons.user);

  // boolean for extending body behind appbar
  bool _shouldBeExtended = true;
  String _title = '';
  Color titleColor = Colors.white;
  Color bagColor = Colors.white;
  Color backgroundColor = Colors.transparent;

  // controlling tabs on pressing
  TabController _tabController;

  // initializing the controller
  @override
  void initState() {
    super.initState();
    _future = getData();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(_handleTabSelection);
  }

  // handle on tab selection
  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      switch (_tabController.index) {
        case 0:
          setState(() {
            _shouldBeExtended = true;
            bagColor = Colors.black;
            _title = '';
            backgroundColor = Colors.transparent;
            homeIcon = Icon(SimpleLineIcons.grid);
            samplesIcon = Icon(SimpleLineIcons.basket);
            profileIcon = Icon(SimpleLineIcons.user);
          });
          break;
        case 1:
          setState(() {
            _shouldBeExtended = false;
            bagColor = Colors.black;
            _title = 'Products in Pulsooth';
            titleColor = Colors.black;
            backgroundColor = Colors.white;
            homeIcon = Icon(SimpleLineIcons.layers);
            samplesIcon = Icon(SimpleLineIcons.basket_loaded);
            profileIcon = Icon(SimpleLineIcons.user);
          });
          break;
        case 2:
          setState(() {
            _shouldBeExtended = true;
            bagColor = _auth.currentUser != null ? Colors.white : Colors.black;
            _title = _auth.currentUser != null
                ? _auth.currentUser.displayName
                : 'My Profile';
            titleColor =
                _auth.currentUser != null ? Colors.white : Colors.black;
            backgroundColor = Colors.transparent;
            homeIcon = Icon(SimpleLineIcons.layers);
            samplesIcon = Icon(SimpleLineIcons.basket);
            profileIcon = Icon(SimpleLineIcons.user_following);
          });
          break;
      }
    }
  }

  // disposing of controller
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: _shouldBeExtended,
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            _title,
            style: GoogleFonts.exo2(
              textStyle:
                  TextStyle(color: titleColor, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: backgroundColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => _auth.currentUser == null
                          ? SignUpPage(toSignUp: true)
                          : BagPage(),
                    ),
                  );
                },
                icon: Icon(
                  SimpleLineIcons.bag,
                  color: bagColor,
                ),
              ),
            ),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            DashboardPage(
              authObject: _auth.currentUser,
              future: _future,
            ),
            ProductsPage(
              authObject: _auth.currentUser,
              future: _future,
            ),
            _auth.currentUser != null
                ? ProfilePage(
                    authObject: _auth,
                  )
                : SignUpPage(toSignUp: false)
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelPadding: EdgeInsets.fromLTRB(10, 0, 10, 25),
            indicator: BoxDecoration(),
            tabs: [
              Tab(
                icon: homeIcon,
                text: 'Home',
              ),
              Tab(
                icon: samplesIcon,
                text: 'Samples',
              ),
              Tab(
                icon: profileIcon,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<DataModel> getData() async {
    var url = 'https://pulsooth.az/api/home/getData';

    Map data = {'lang': 'en', 'fid': _auth.currentUser.uid};

    var body = json.encode(data);
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    Map dataMap = jsonDecode(response.body);
    var datamodel = DataModel.fromJson(dataMap);

    return datamodel;
  }
}
