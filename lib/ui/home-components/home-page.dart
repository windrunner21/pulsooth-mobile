import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pulsooth_mobile/ui/home-components/dashboard-page.dart';
import 'package:pulsooth_mobile/ui/home-components/products-page.dart';
import 'package:pulsooth_mobile/ui/home-components/profile-page.dart';
import 'package:pulsooth_mobile/ui/product-components/bag-page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // icons
  Icon homeIcon = Icon(SimpleLineIcons.layers);
  Icon samplesIcon = Icon(SimpleLineIcons.basket);
  Icon profileIcon = Icon(SimpleLineIcons.user);

  // boolean for extending body behind appbar
  bool _shouldBeExtended = true;
  String _title = '';
  Color bagColor = Colors.white;
  Color backgroundColor = Colors.transparent;

  // controlling tabs on pressing
  TabController _tabController;

  // initializing the controller
  @override
  void initState() {
    super.initState();
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
            backgroundColor = Colors.white;
            homeIcon = Icon(SimpleLineIcons.layers);
            samplesIcon = Icon(SimpleLineIcons.basket_loaded);
            profileIcon = Icon(SimpleLineIcons.user);
          });
          break;
        case 2:
          setState(() {
            _shouldBeExtended = true;
            bagColor = Colors.white;
            _title = '';
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
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                      builder: (context) => BagPage(),
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
          children: [DashboardPage(), ProductsPage(), ProfilePage()],
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
}
