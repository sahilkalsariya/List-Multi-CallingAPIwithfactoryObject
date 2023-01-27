class Post {
  final int id;

  final int userid;

  final String title;

  final String body;

  Post({
    required this.id,
    required this.userid,
    required this.title,
    required this.body,
  });

  factory Post.fromJson({required Map json}) {
    return Post(
      id: json['id'],
      userid: json['userid'],
      title: json['title'],
      body: json['body'],
    );
  }
}
