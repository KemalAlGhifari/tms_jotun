import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_jotun/src/setting/settings_url.dart';

class ApiClientToken {
  final Dio dio;

  ApiClientToken({required this.dio});

  static Future<ApiClientToken> create() async {
    final dio = Dio(BaseOptions(baseUrl: Config.baseUrl,contentType: 'application/json'));

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token;

    String? jsonString = prefs.getString('login_data');
    if (jsonString != null) {
      Map<String, dynamic> jsonMap =
          jsonDecode(jsonString); 
      token = jsonMap['data']?['token'];
    }
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (token != null) {
          options.headers.addAll({
            'Accept': 'application/json' ,
            'Content-Type': 'application/json',
            'x-token': '$token',
            
          });
        }
        // print('Request: ${options.method} ${options.path}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // print('Response: ${response.statusCode} ${response.data}');
        return handler.next(response);
      },
      onError: (DioException e, handler) {
    debugPrint('Request Error: ${e.message}');
    debugPrint('Error data: ${e.response?.data}');
    return handler.next(e);
  },
      
    ));

    return ApiClientToken(dio: dio);
  }
}
