class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  PodcastModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.catName,
    required this.author,
    required this.view,
    required this.status,
    required this.createdAt,
  });
  PodcastModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    id = element["title"];
    id = element["poster"];
    id = element["cat_name"];
    id = element["author"];
    id = element["view"];
    id = element["status"];
    id = element["created_at"];
  }
}
