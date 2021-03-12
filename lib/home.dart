import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'welcome.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  checkAuthentification() async {
    FirebaseAuth.instance.authStateChanges().listen((firebaseUser) {
      if (user == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Welcome()));
      }
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

  signOut() async {
    _auth.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
  }

  @override
  void initState() {
    super.initState();
    //this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar:
        BottomNavigationBar(
          backgroundColor: Colors.teal,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.grey,),
              label: 'Near Me',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search,color: Colors.grey,),
              label: 'Exploer',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school,color: Colors.grey,),
              label: 'Cart',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings,color: Colors.grey,),
              label: 'Account',

            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.teal,
          onTap: _onItemTapped,
        ),
        appBar: AppBar(

        ),
      ),
    );
  }
}
