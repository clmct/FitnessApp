import 'package:fitness_app/sources/presentation_layer/news_widget/post_widget.dart';
import 'package:flutter/material.dart';

class NewsPageWidget extends StatelessWidget {
  final List<ListItem> items;

  NewsPageWidget({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTitle = 'News';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          title: Text(
            appTitle,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              title: item.buildTitle(context),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.orange,
          items: [
            BottomNavigationBarItem(
              icon: Image(image: AssetImage('lib/resources/images/1.png')),
              label: "News",
            ),
            BottomNavigationBarItem(
              icon: Image(image: AssetImage('lib/resources/images/2.png')),
              label: "Mail",
            ),
            BottomNavigationBarItem(
              icon: Image(image: AssetImage('lib/resources/images/3.png')),
              label: "Mail",
            ),
            BottomNavigationBarItem(
              icon: Image(image: AssetImage('lib/resources/images/4.png')),
              label: "People",
            ),
            BottomNavigationBarItem(
              icon: Image(image: AssetImage('lib/resources/images/5.png')),
              label: "Gym",
            ),
          ],
        ),
      ),
    );
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }
}

class MessageItem implements ListItem {
  final String body;

  MessageItem(this.body);

  @override
  Widget buildTitle(BuildContext context) => Post();
}
