import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                  "https://imgmedia.lbb.in/media/2019/12/5e098fae2335a92f5b3536f3_1577684910704.jpg",
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Restaurent",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Feed the Need",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      //Now let's Add the button for the Menu
      //and let's copy that and modify it
      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.home,
          color: Colors.black,
        ),
        title: Text("Home_page"),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.restaurant,
          color: Colors.black,
        ),
        title: Text("My Restaurent"),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.bookmark_border,
          color: Colors.black,
        ),
        title: Text("Orders"),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.fastfood,
          color: Colors.black,
        ),
        title: Text("Products"),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.logout,
          color: Colors.black,
        ),
        title: Text("Log Out"),
      ),
    ]);
  }
}
