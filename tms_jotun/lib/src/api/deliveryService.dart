import 'package:dio/dio.dart';
import 'package:tms_jotun/src/models/request/login.request.dart';

class DeliveryService {
  final Dio _dio;

  DeliveryService(this._dio);

  Future<Response> getList(String version) async {
    
    return _dio.get('/driver1234x/delivery/deliveryList?version=$version',options: Options(contentType: 'application/json'));
  }

  Future<Response> getDetail(String cusNo,String schedule) async {
    return _dio.get('/driver1234x/delivery/customerDetail?customer_no=$cusNo&delivery_schedule=$schedule',options: Options(contentType: 'application/json'));
  }

  Future<Response> getDeliveryArrived(String cusNo,String schedule) async {
    return _dio.get('/driver1234x/delivery/arrived?delivery_schedule=$schedule&customer_no=$cusNo',options: Options(contentType: 'application/json'));
  }

    Future<Response> getDetailTicket(String cusNo,String schedule) async {
    return _dio.get('/driver1234x/delivery/deliveryTicket?delivery_schedule=$schedule&customer_no=$cusNo',options: Options(contentType: 'application/json'));
  }

  Future<Response> getUnload(String shipmentId,String cusNo,String schedule) async {
    return _dio.get('/driver1234x/unload/deliveryTicket?shipment_id=$shipmentId&delivery_schedule=$schedule&customer_no=$cusNo',options: Options(contentType: 'application/json'));
  }

    Future<Response> postPodImage(Map<String, dynamic> data) async {
    return _dio.post('/driver1234x/upload/orderMultiplePOD',data: data,options: Options(contentType: 'application/json'));
  }
}