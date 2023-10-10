import 'package:wireapps/const/endpoint.dart';
import 'package:wireapps/api/error.dart';
import 'package:wireapps/api/interceptors.dart';
import 'package:dio/dio.dart';

class ApiBaseHelper {
  static String url = baseUrl;
  static BaseOptions opts = BaseOptions(
    baseUrl: url,
    responseType: ResponseType.json,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  );

  static Dio createDio() {
    return Dio(opts);
  }

  static Dio addInterceptors(Dio dio) {
    return dio..interceptors.add(DioInterceptor());
  }

  static final dio = createDio();
  static final baseAPI = addInterceptors(dio);

  Future<Object> getHTTP(String url) async {
    try {
      Response response = await baseAPI.get(url);
      return response;
    } on DioException catch (e) {
      return e;
    }
  }

  Future<Object> postHTTP(String url, dynamic data) async {
    try {
      Response response = await baseAPI.post(url, data: data);
      return response;
    } on DioException catch (e) {
      // Handle error
      print(e);
      return DioExceptionSub.fromDioError(e);
    }
  }

  Future<Object> putHTTP(String url, dynamic data) async {
    try {
      Response response = await baseAPI.put(url, data: data);
      return response;
    } on DioException catch (e) {
      // Handle error
      return DioExceptionSub.fromDioError(e);
    }
  }

  Future<Object> deleteHTTP(String url) async {
    try {
      Response response = await baseAPI.delete(url);
      return response;
    } on DioException catch (e) {
      // Handle er
      return DioExceptionSub.fromDioError(e);
    }
  }
}
