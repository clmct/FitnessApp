import 'package:fitness_app/sources/presentation_layer/news_widget/news_state.dart';
import 'package:fitness_app/sources/presentation_layer/news_widget/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          bottomNavigationBar: TabBar(
            labelColor: Colors.red,
            tabs: [
              Tab(
                icon: Image(image: AssetImage('lib/resources/images/1.png')),
                text: "News",
              ),
              Tab(
                icon: Image(image: AssetImage('lib/resources/images/2.png')),
                text: "",
              ),
              Tab(
                icon: Image(image: AssetImage('lib/resources/images/3.png')),
                text: "",
              ),
              Tab(
                icon: Image(image: AssetImage('lib/resources/images/4.png')),
                text: "",
              ),
              Tab(
                icon: Image(image: AssetImage('lib/resources/images/5.png')),
                text: "",
              ),
            ],
          ),
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
          body: TabBarView(
            children: [
              Container(
                child: Observer(
                  builder: (_) => ListView.builder(
                    itemCount: store.posts.length,
                    itemBuilder: (context, index) {
                      return PostWidget(
                        username: store.posts[index].userName,
                        caption: store.posts[index].caption ??
                            "The 75,000,000 great American Patriots who voted for me, AMERICA FIRST, and MAKE AMERICA GREAT AGAIN, will have a GIANT VOICE long into the future. They will not be disrespected or treated unfairly in any way, shape or form!!!",
                      );
                    },
                  ),
                ),
              ),
              Container(),
              Container(),
              Container(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
