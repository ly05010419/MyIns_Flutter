import 'package:flutter/material.dart';
import 'package:myins/NavigationBar.dart';
import 'package:myins/views/account.dart';
import 'package:myins/views/add.dart';
import 'package:myins/views/favorite.dart';
import 'package:myins/views/home.dart';
import 'package:myins/views/search.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  Widget home = new HomePage();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(
            child: Text(
          "Instagram",
        )),
        leading: new Icon(
          Icons.camera_alt,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: new Icon(Icons.send),
          )
        ],
      ),
      body: home,
      bottomNavigationBar: NavigationBar((int index) {
        currentIndex = index;
        switch (index) {
          case 0:
            home = new HomePage();
            break;
          case 1:
            home = new SearchPage();
            break;
          case 2:
            home = new AddPage();
            break;
          case 3:
            home = new FavoritePage();
            break;
          case 4:
            home = new AccountPage();
            break;
        }

        setState(() {});
      }),
    );
  }

  Widget createNavigationBar() {
    return new BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: currentIndex,
      selectedIconTheme: new IconThemeData(color: Colors.blue),
      unselectedIconTheme: new IconThemeData(color: Colors.black),
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
          title: new Text("Home"),
          icon: new Icon(Icons.home),
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.search),
          title: new Text("Search"),
        ),
        new BottomNavigationBarItem(
          title: new Text("Add"),
          icon: new Icon(Icons.add),
        ),
        new BottomNavigationBarItem(
          title: new Text("Search"),
          icon: new Icon(Icons.favorite_border),
        ),
        new BottomNavigationBarItem(
          title: new Text("Search"),
          icon: new Icon(Icons.account_box),
        )
      ],
      onTap: (int index) {
        currentIndex = index;
        switch (index) {
          case 0:
            home = new HomePage();
            break;
          case 1:
            home = new SearchPage();
            break;
          case 2:
            home = new AddPage();
            break;
          case 3:
            home = new FavoritePage();
            break;
          case 4:
            home = new AccountPage();
            break;
        }

        setState(() {});
      },
    );
  }
}
