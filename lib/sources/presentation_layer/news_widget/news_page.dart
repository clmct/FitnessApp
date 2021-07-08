import 'package:fitness_app/sources/presentation_layer/login_widget/login_page_state.dart';
import 'package:fitness_app/sources/presentation_layer/news_widget/news_state.dart';
import 'package:fitness_app/sources/presentation_layer/news_widget/post_widget.dart';
import 'package:fitness_app/sources/service_layer/network_service.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/sources/service_layer/news.dart';
import 'package:fitness_app/sources/service_layer/result.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class NewsPageWidget extends StatefulWidget {
  @override
  _NewsPageWidgetState createState() => _NewsPageWidgetState();
}

class _NewsPageWidgetState extends State<NewsPageWidget> {
  final NewsStore store = NewsStore();

  @override
  void initState() {
    store.getNews();
    super.initState();
  }

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
        body: Container(
          child: Observer(
            builder: (_) => ListView.builder(
              itemCount: store.posts.length,
              itemBuilder: (context, index) {
                return PostWidget(
                  username: store.posts[index].userName,
                  caption: store.posts[index].caption ?? "lol",
                );
              },
            ),
          ),
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
