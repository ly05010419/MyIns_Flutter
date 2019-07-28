import 'package:flutter/material.dart';
import 'package:myins/NavigationBar.dart';
import 'package:myins/views/ApplePage.dart';
import 'package:myins/views/GooglePage.dart';
import 'package:myins/views/PlayStationPage.dart';
import 'package:myins/views/AmazonPage.dart';
import 'package:myins/views/InstagramPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  Widget home = new InstagramPage();

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
      bottomNavigationBar: NavigationBar(seletedIndex: 0,onTap:(int index) {
        currentIndex = index;
        switch (index) {
          case 0:
            home = new InstagramPage();
            break;
          case 1:
            home = new PlayStationPage();
            break;
          case 2:
            home = new ApplePage();
            break;
          case 3:
            home = new GooglePage();
            break;
          case 4:
            home = new AmazonPage();
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
            home = new InstagramPage();
            break;
          case 1:
            home = new PlayStationPage();
            break;
          case 2:
            home = new ApplePage();
            break;
          case 3:
            home = new GooglePage();
            break;
          case 4:
            home = new AmazonPage();
            break;
        }

        setState(() {});
      },
    );
  }
}
