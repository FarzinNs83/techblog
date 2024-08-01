import 'package:flutter/material.dart';
import 'package:techblog_app/component/api_const.dart';

class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? publisher;
  String? view;
  String? createdAt;
  PodcastModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.publisher,
    required this.view,
    required this.createdAt,
  });


  factory PodcastModel.fromJson(Map<String, dynamic> json) {
    return PodcastModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      poster: ApiConst.hostDlUrl + (json['poster'] ?? ''),
      publisher: json['publisher'] ?? '',
      view: json['view'] ?? '',
      createdAt: json['created_at'] ?? '',
    );

  }
}
