class News {
  final List<Post> posts;

  News({
    required this.posts,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      posts: List<Post>.from(
        json["result"]["posts"].map(
          (x) => Post.fromJson(x),
        ),
      ),
    );
  }
}

class Post {
  final String userName;
  final String? caption;

  Post({
    required this.userName,
    required this.caption,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userName: json['user']['username'],
      caption: json['caption'],
    );
  }
}
