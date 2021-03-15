import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'welcome.dart';
import 'near_me.dart';
import 'explore.dart';
import 'account.dart';
import 'cart.dart';

String userLoc;
class HomePage extends StatefulWidget {
  String location;
  HomePage  ({Key key,@required this.location }) : super(key: key) {
    userLoc=location;
  }
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;
  int _selectedIndex = 0;
  PageController _pageController=PageController();
  List<Widget> _screen=[
    NearMe(),Explore(),Cart(),Account()
  ];

  void _onItemTaped(int SelectedIndex){
    _pageController.jumpToPage(SelectedIndex);
  }
  void _onPageChanged(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

  getUser() async {
    User firebaseUser = await _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = await _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }


  @override
  void initState() {
    super.initState();
    this.getUser();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar:
        BottomNavigationBar(
          fixedColor: Colors.grey,
          onTap: _onItemTaped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,color: Colors.blueGrey,),
              label: 'Near Me',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search,color: Colors.blueGrey,),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined,color: Colors.blueGrey,),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined,color: Colors.blueGrey,),
              label: 'Account',
            ),
          ],
          selectedLabelStyle: TextStyle(fontFamily: 'Sans'),
          currentIndex: _selectedIndex,
        ),
        body: PageView(
          controller: _pageController,
          children: _screen,
          onPageChanged: _onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        )
      ),
    );
  }


}
