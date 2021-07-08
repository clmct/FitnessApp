import 'package:fitness_app/sources/service_layer/network_service.dart';
import 'package:fitness_app/sources/service_layer/news.dart';
import 'package:fitness_app/sources/service_layer/result.dart';
import 'package:mobx/mobx.dart';
part 'news_state.g.dart';

class NewsStore = _NewsStore with _$NewsStore;

abstract class _NewsStore with Store {
  // Properties
  @observable
  List<Post> posts = [];

  final NetworkService networkService = NetworkService();

  @action
  void getNews() {
    Future<Result> access = networkService.postToken();
    access.then((value) {
      print(value.access);
      Future<News> news = networkService.getNews(value.access);
      news.then(
        (value) {
          posts = value.posts;
          print(posts);
        },
      );
    });
  }
}
