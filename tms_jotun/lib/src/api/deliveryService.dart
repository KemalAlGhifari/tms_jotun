import 'package:dio/dio.dart';
import 'package:tms_jotun/src/models/request/login.request.dart';

class DeliveryService {
  final Dio _dio;

  DeliveryService(this._dio);

  Future<Response> getList(String version) async {
    
    return _dio.get('/delivery/deliveryList?version=$version',options: Options(contentType: 'application/json'));
  }

  Future<Response> getDetail(String cusNo,String schedule) async {
    return _dio.get('/delivery/customerDetail?customer_no=$cusNo&delivery_schedule=$schedule',options: Options(contentType: 'application/json'));
  }

  Future<Response> getDeliveryArrived(String cusNo,String schedule) async {
    return _dio.get('/delivery/arrived?delivery_schedule=$schedule&customer_no=$cusNo',options: Options(contentType: 'application/json'));
  }
}