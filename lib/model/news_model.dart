class NewsModel {
  String? title;
  String? description;
  String? source;
  String? author;
  String? publishedAt;
  String? imageUrl;
  String? url;

  NewsModel({
    this.title,
    this.description,
    this.author,
    this.source,
    this.url,
    this.imageUrl,
    this.publishedAt,
  });

  factory NewsModel.fromJson(Map<String, dynamic> map) {
    return NewsModel(
      title: map['title'],
      description: map['description'],
      author: map['author'],
      source: map['source']['name'],
      url: map['url'],
      imageUrl: map['urlToImage'],
      publishedAt: map['publishedAt']
    );
  }
}
