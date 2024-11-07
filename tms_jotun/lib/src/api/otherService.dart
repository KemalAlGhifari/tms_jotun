import 'package:dio/dio.dart';
import 'package:tms_jotun/src/models/request/login.request.dart';

class OtherService {
  final Dio _dio;

  OtherService(this._dio);

  Future<Response> getPhoneNumber() async {
    return _dio.get('/others/phonenumber',options: Options(contentType: 'application/json'));
  }

  Future<Response> getCheckPasscode(String code) async {
    return _dio.get('/passcode/check?code=$code',options: Options(contentType: 'application/json'));
  }
}