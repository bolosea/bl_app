import 'package:bl_app/news/modal/category.dart';

class Article {
  int id;
  String title;
  String author;
  String content;
  int commentId;
  int createTime;
  int updateTime;
  int categoryId;
  String headImg;
  String totalComment;
  Map category;

  Article.fromJson(Map<String, dynamic> json)
      :title = json['title'],
        id = json['id'],
        author=json['author'],
        content=json['content'],
        commentId=json['commentId'],
        categoryId=json['categoryId'],
        headImg=json['headImg'],
        totalComment=json['totalComment'],
        createTime=json['createTime'],
        updateTime=json['updateTime'],
        category=json['category'];
}