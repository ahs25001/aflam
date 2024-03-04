import 'package:aflame/core/utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  Future<http.Response> getData(
      {required String endPoint,
      required Map<String, String> headers,
      Map<String, dynamic>? queryParameters}) async {
    var url = Uri.https(AppConstants.baseUrl, endPoint, queryParameters);
    http.Response response = await http.get(url, headers: headers);
    return response;
  }
}
