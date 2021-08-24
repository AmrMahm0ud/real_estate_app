import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:real_estate_app/network/remote/dio_helper.dart';

class HomeApi {
  static Future<Response> getHomeData({
    @required String path,
    @required Map<String, dynamic> data,
  }) async {
    DioHelper.dio.options.headers = {'Content-Type': 'application/json'};
    return DioHelper.dio.post(path, data: data);
  }
}
