import 'package:dio/dio.dart';
import 'package:tms_jotun/src/setting/settings_url.dart';

class ApiClient {
  final Dio dio;

  ApiClient({required this.dio});

  factory ApiClient.create() {
    final dio = Dio(BaseOptions(
      baseUrl: Config.baseUrlLogin,
      contentType: Headers.jsonContentType,
      
      ));

    dio.interceptors.add(
      
      InterceptorsWrapper(
      
      onRequest: (options, handler) {
        
        options.headers.addAll({
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        });
        // print('Request: ${options.method} ${options.path}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        
        // print('Response: ${response.statusCode} ${response.data}');
        return handler.next(response);
      },
      
    ));

    return ApiClient(dio: dio);
  }
}
