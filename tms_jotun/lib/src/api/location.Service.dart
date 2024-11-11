import 'package:dio/dio.dart';
import 'package:tms_jotun/src/models/request/login.request.dart';

class LocationService {
  final Dio _dio;

  LocationService(this._dio);

  Future<Response> PostLocation(Map<dynamic, dynamic> data) async {
    return _dio.post('/driver1234x/tms_assignment_location',data: data,options: Options(contentType: 'application/json'));
  }
}