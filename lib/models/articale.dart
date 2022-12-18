
import 'package:news_paper/models/sources.dart';

class Articale{
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articale({this.source,this.author,this.title,this.description,this.url,this.urlToImage,this.publishedAt,this.content});

  factory Articale.fromJson(Map<String , dynamic>json){
    return Articale(
      source: Source.fromJson(json["source"]),
      author: json["author"] == null ? "" : json["author"],
      title: json["title"] == null ? "" : json["title"],
      description: json["description"] == null ? "" : json["description"],
      url: json["url"] == null ? "" : json["url"],
      urlToImage: json["urlToImage"] == null ? "" : json["urlToImage"],
      publishedAt: json["publishedAt"] == null ? "" : json["publishedAt"],
      content: json["content"] == null ? "" : json["content"],
    );
  }

}