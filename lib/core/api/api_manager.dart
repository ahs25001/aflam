import 'package:aflame/core/utils/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  Dio dio = Dio();
  //
  // Future<Response> getData(
  //     {required String endPoint,
  //     Map<String, dynamic>? data,
  //     Map<String, dynamic>? headers}) async {
  //   return dio.get(AppConstants.baseUrl + EndPoints.getPopular,
  //       options: Options(headers: headers));
  // }

  Future<http.Response> getData(
      {required String endPoint,
      required Map<String, String> headers,
      Map<String, dynamic>? queryParameters}) async {
    var url = Uri.https(AppConstants.baseUrl, endPoint, queryParameters);
    http.Response response = await http.get(url, headers: headers);
    return response;
  }
}
