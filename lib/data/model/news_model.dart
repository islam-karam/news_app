class NewsModel {
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsModel(
      {this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  NewsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

}
