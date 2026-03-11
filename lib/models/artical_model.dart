class ArticleModel {
  final String title;
  final String? image;
  final String? subTitle;
  final String? author;
  final String? publishedAt;
  final String? content;
  final String? url;

  ArticleModel({
    required this.image,
    required this.title,
    required this.subTitle,
    this.author,
    this.publishedAt,
    this.content,
    this.url,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      image: json['urlToImage'],
      title: json['title'],
      subTitle: json['description'],
      author: json['author'],
      publishedAt: json['publishedAt'],
      content: json['content'],
      url: json['url'],
    );
  }
}
