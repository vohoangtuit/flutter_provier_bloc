
import 'package:flutter_provider/network/base/response_model.dart';

class NewsModel {
  NewsModel._();
  String? newsId;
  String? title;
  String? titleen;
  String? description;
  String? descriptionen;
  String? content;
  String? contenten;
  String? image;
  String? createdate;

  NewsModel(
      {this.newsId,
      this.title,
      this.titleen,
      this.description,
      this.descriptionen,
      this.content,
      this.contenten,
      this.image,
      this.createdate
      });

  NewsModel.fromJson(Map<String, dynamic> json) {
    newsId = json['newsid'].toString();
    title = json['title'];
    titleen = json['titleen'];
    description = json['description'];
    descriptionen = json['descriptionen'];
    content = json['content'];
    contenten = json['contenten'];
    image = json['image'];
    createdate = json['createdate'];
  }
 static List<NewsModel> listNewsFromJson(ResponseModel parserModel){
    List<NewsModel> list =<NewsModel>[];
    if (parserModel.response != null) {
      parserModel.response.forEach((v) {
        list.add(NewsModel.fromJson(v));
      });
    }
    return list;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['newsid'] = newsId;
    data['title'] = title;
    data['titleen'] = titleen;
    data['description'] = description;
    data['descriptionen'] = descriptionen;
    data['content'] = content;
    data['contenten'] = contenten;
    data['image'] = image;
    data['createdate'] = createdate;
    return data;
  }

  @override
  String toString() {
    return '{newsid: $newsId, title: $title, titleen: $titleen, description: $description, descriptionen: $descriptionen, content: $content, contenten: $contenten, image: $image, createdate: $createdate}';
  }
}
