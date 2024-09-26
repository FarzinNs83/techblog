import 'package:techblog_app/component/constant/api_const.dart';

class PosterModel {
  String? id;
  String? title;
  String? image;

  PosterModel({
     this.id,
     this.title,
     this.image,
  });
  PosterModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image =ApiConst.hostDlUrl + element["image"];
  }
}
