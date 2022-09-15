import 'package:dio/dio.dart';
class Request {

  static final Request _instance = Request._internal();

  factory Request() => _instance;

  Request._internal();

  Future<dynamic> get({required String url, Map<String, dynamic>? params,
    Options? options}) async {
    //Response apiResponse ;
    try {
     final response = await Dio().get(url, options: options, queryParameters: params);

      if (response.statusCode == 200) {
        return response;
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
      //  throw response.statusCode;
      }
    } catch (e) {
      e as DioError;

      print(e);
    }


  }

  // Future<ApiResponse> post({required String url, dynamic? data, Map<String,dynamic>? params,
  //   Options? options}) async {
  //   ApiResponse apiResponse = ApiResponse();
  //
  //   try {
  //     apiResponse.response = await Dio().post(_resolveUrl(url), data: data,
  //         options: options, queryParameters: params);
  //   } catch (e) {
  //     print(e);
  //   }
  //   return apiResponse;
  // }

  // String _resolveUrl(String path) {
  //   if(!path.startsWith('/')) path = '/$path';
  //   path = ApiConfig.BASE_URL + path;
  //   return path;
  // }

  // static Future<Options> buildRequestJsonOptions() async {
  //   Map<String,dynamic> headers = {};
  //   headers["accept"] = "application/ld+json";
  //   headers["Authorization"] = "Bearer ${ApiConfig.ACCESS_TOKEN}".trim();
  //
  //   return Options(headers: headers);
  // }

  static Future<Options> buildRequestContentTypeOptions() async {
    Map<String,dynamic> headers = {};
    headers["accept"] = "application/ld+json";
    headers["Content-Type"] = "application/ld+json";

    return Options(headers: headers);
  }

  static Future<Options> buildRequestLoginOptions() async {
    Map<String,dynamic> headers = {};
    headers["accept"] = "application/json";
    headers["Content-Type"] = "application/json";

    return Options(headers: headers);
  }

}