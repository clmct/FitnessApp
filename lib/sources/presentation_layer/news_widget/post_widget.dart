import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  String username = "1";
  String caption = "2";

  PostWidget({
    required this.username,
    required this.caption,
  });

  @override
  _PostState createState() => _PostState(username: username, caption: caption);
}

class _PostState extends State<PostWidget> {
  String username = "1";
  String caption = "2";

  _PostState({
    required this.username,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 15, right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image(image: AssetImage('lib/resources/images/avatar.png')),
              SizedBox(width: 18),
              Text(
                username,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(height: 13),
          Row(children: [
            SizedBox(width: 14),
            Text(caption),
          ]),
          SizedBox(height: 14),
          Row(children: [
            SizedBox(width: 14),
            Image(image: AssetImage('lib/resources/images/heart.png')),
            SizedBox(width: 10),
            Text("12"),
            SizedBox(width: 20),
            Image(image: AssetImage('lib/resources/images/comment.png')),
            SizedBox(width: 10),
            Text("28"),
          ]),
          SizedBox(height: 14),
        ],
      ),
    );
  }
}
