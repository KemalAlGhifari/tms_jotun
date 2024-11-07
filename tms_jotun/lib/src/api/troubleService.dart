import 'package:dio/dio.dart';
import 'package:tms_jotun/src/models/request/login.request.dart';

class TroubleService {
  final Dio _dio;

  TroubleService(this._dio);

  Future<Response> getTrouble() async {
    return _dio.get('/obstacles/loadData',options: Options(contentType: 'application/json'));
  }

  
}