import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;
import 'package:flutter/material.dart';

class DioService {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((response) {
      return response;
    });
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    return await dio
        .post(url,
            data: dio_service.FormData.fromMap(map),
            options: Options(responseType: ResponseType.json, method: 'POST'))
        .then(
      (response) {
        debugPrint(response.headers.toString());
        debugPrint(response.data.toString());
        debugPrint(response.statusCode.toString());
        return response;
      },
    );
  }
}
