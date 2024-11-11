import 'package:dio/dio.dart';
import 'package:tms_jotun/src/models/request/login.request.dart';

class VersionService {
  final Dio _dio;

  VersionService(this._dio);

  Future<Response> getVersion() async {
    return _dio.post('/driver1234x/others/version',options: Options(contentType: 'application/json'));
  }
}