import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "http://ugp.ileadcloud.com/ugprealestate/api/Property/",
        receiveDataWhenStatusError: true,
        headers: {
          "Content-Type": "application/json",
        }));
  }
}
