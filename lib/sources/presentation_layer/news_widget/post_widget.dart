import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  Post({Key? key}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [Icon(Icons.approval), Text("Firstname Secondname")],
          ),
          Text(
              "Today was in the gym. He took a couple of dumbbells and fell. He poured hot tea on himself. Everyone started laughing. laughing. laughing. "),
          Row(children: [
            Image(image: AssetImage('lib/resources/images/heart.png')),
            Text("12"),
            Image(image: AssetImage('lib/resources/images/comment.png')),
            Text("28"),
          ])
        ],
      ),
    );
  }
}
