import "./source.dart";

class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final String img;
  final String date;
  final String content;
  final Source source;

  Article({this.author, this.title, this.description, this.url, this.img, this.date, this.content, this.source});

  Article.fromJson(Map<String, dynamic> json)
      : author = json['author'],
        title = json['title'],
        description = json['description'],
        url = json['url'],
        img = json['urlToImage'],
        date = json['date'],
        content = json['content'],
        source = Source.fromJson(json['source']);
}
