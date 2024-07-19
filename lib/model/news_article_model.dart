// To parse this JSON data, do
//
//     final newsArticle = newsArticleFromJson(jsonString);

import 'dart:convert';

NewsArticle newsArticleFromJson(String str) =>
    NewsArticle.fromJson(json.decode(str));

String newsArticleToJson(NewsArticle data) => json.encode(data.toJson());

class NewsArticle {
  String status;
  int totalResults;
  List<Article> articles;

  NewsArticle({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) => NewsArticle(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Source source;
  String author;
  String title;
  dynamic description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  dynamic content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"] != null ? json["urlToImage"] : null,
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  String id;
  String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
