class News {
  final List<Post> posts;

  News({
    required this.posts,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      posts: json['result']['posts'],
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
      userName: json['result']['posts']['user']['username'],
      caption: json['result']['posts']['caption'],
    );
  }
}
