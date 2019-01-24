class Post{
  final String extract;

  Post({this.extract});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      extract: json['extract']
    );
  }
}