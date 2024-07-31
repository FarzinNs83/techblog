import 'package:techblog_app/component/api_const.dart';

class PodCastsModel {
  String? id;
  String? title;
  String? poster;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  PodCastsModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.catName,
    required this.author,
    required this.view,
    required this.status,
    required this.createdAt,
  });
  PodCastsModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    id = ApiConst.hostDlUrl + element["title"];
    id = element["poster"];
    id = element["cat_name"];
    id = element["author"];
    id = element["view"];
    id = element["status"];
    id = element["created_at"];
  }
}
