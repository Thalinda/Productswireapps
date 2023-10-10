import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioInterceptor extends Interceptor {
  Logger logger = Logger(
    // Customize the printer
    printer: PrettyPrinter(
      methodCount: 0,
      printTime: false,
    ),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // should implement authorization in this level

    options.headers['Accept-Language'] =
        "en"; //Change this to -> "es" for spanish
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';

    final requestPath = '${options.baseUrl}${options.path}';
    logger.i('${options.method} request => $requestPath'); // I
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // logger.d('StatusCode: ${response.statusCode}, Data: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log(err.response!.data.toString());
    // logger.e('${options.method} request => $requestPath'); // Debug log
    // logger.d('Error: ${err.error}, Message: ${err.message}');
    super.onError(err, handler);
  }
}
