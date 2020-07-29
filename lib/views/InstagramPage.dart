import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var headerImage =
    "http://img06file.tooopen.com/images/20171224/tooopen_sy_231021357463.jpg";
var landschaftImage =
    "http://img06file.tooopen.com/images/20171224/tooopen_sy_231021357463.jpg";

class InstagramPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[new HomeListView()],
    );
  }
}

class HomeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: new ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == 0) {
            return new StoryListView();
          } else {
            return new CellView();
          }
        },
      ),
    );
  }
}

class CellView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return new SizedBox(
      height: width + 100,
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Container(
                    height: 35,
                    width: 35,
                    margin: EdgeInsets.only(left: 10, bottom: 5),
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            image: new NetworkImage(headerImage))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: new Text(
                      "liyong",
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              new IconButton(
                icon: new Icon(Icons.more_vert),
                onPressed: () {
                  print("more_vert");
                },
              )
            ],
          ),
          new Flexible(
//            child:new FadeInImage.assetNetwork(
//              placeholder: 'images/logo.png',
//              image: headerImage,
//              width: width,
//              height: 400,
//              fit: BoxFit.fitWidth,
//            )

            child: CachedNetworkImage(
              width: width,
              fit: BoxFit.fitWidth,
              imageUrl: landschaftImage,
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: new Row(
                    children: <Widget>[
                      new Icon(FontAwesomeIcons.heart),
                      new SizedBox(
                        width: 10,
                      ),
                      new Icon(FontAwesomeIcons.comment),
                      new SizedBox(
                        width: 10,
                      ),
                      new Icon(FontAwesomeIcons.paperPlane)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: new Icon(FontAwesomeIcons.bookmark),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
            child: Row(
              children: <Widget>[
                new Text(
                  "yongli",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                new Text(
                  ",tom",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                new Text(
                  ",jack",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                new Text(
                  ",stefan",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                new Text(
                  ",otto",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              new Container(
                height: 20,
                width: 20,
                margin: EdgeInsets.only(left: 10, bottom: 5),
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        image: new NetworkImage(headerImage))),
              ),
              new Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: new TextField(
                  decoration: new InputDecoration(
                      border: InputBorder.none, hintText: "Add a comment..."),
                ),
              )),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: new Text(
                  "A Day Ago",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class StoryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.12;
    return new SizedBox(
      height: height,
      child: new Column(
        children: <Widget>[Padding(
          padding: const EdgeInsets.only(top: 10,left: 10),
          child: createTextVew(),
        ), createHeaderView(height)],
      ),
    );
  }

  Widget createTextVew() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Text(
          "Stories",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        new Row(
          children: <Widget>[
            new Icon(Icons.play_arrow),
            new Text(
              "All Watch",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    );
  }

  Widget createHeaderView(var height) {
    return new Expanded(
      child: new ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: new CircleAvatar(
                    radius: height - 70,
                    backgroundImage: NetworkImage(headerImage),
                  ),
                ),
                index == 0
                    ? new CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: new Icon(Icons.add),
                        radius: 12,
                      )
                    : new Container()
              ],
            );
          }),
    );
  }
}
