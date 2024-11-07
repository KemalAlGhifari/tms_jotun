import 'package:dio/dio.dart';
import 'package:tms_jotun/src/models/request/login.request.dart';
import 'package:tms_jotun/src/models/request/ship.request.dart';

class ShipService {
  final Dio _dio;

  ShipService(this._dio);

  Future<Response> postShip(MmsiRequest data) async {
    return _dio.get('/tms_assignment_location',data: data,options: Options(contentType: 'application/json'));
  }

  
}