import 'package:dio/dio.dart';
import 'package:tms_jotun/src/models/request/login.request.dart';

class UserService {
  final Dio _dio;

  UserService(this._dio);

  Future<Response> login(LoginRequest data) async {
    return _dio.post('/auth/login', data: data,options: Options(contentType: 'application/json'));
  }

   Future<Response>changePassword(Map<String,dynamic> data) async {
    return _dio.put('/myprofile/changePassword', data: data,options: Options(contentType: 'application/json'));
  }

  

}