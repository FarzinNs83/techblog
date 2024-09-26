import 'package:flutter/foundation.dart';
import 'package:techblog_app/component/constant/api_const.dart';

class ArticleInfoModel {
  String? id;
  String? title;
  String? content;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  bool? isFavorite;

  ArticleInfoModel(
    this.title,
    this.content,
  );

  ArticleInfoModel.fromJson(Map<String, dynamic> element) {
    var info = element['info'];
    id = info['id'];
    title = info['title'];
    content = info['content'];
    var image = ApiConst.hostDlUrl + info['image'];
    if (kDebugMode) {
      print(image);
    }
    catId = info['cat_id'];
    catName = info['cat_name'];
    author = info['author'];
    view = info['view'];
    status = info['status'];
    createdAt = info['created_at'];
    isFavorite = element['isFavorite'];
  }
}
