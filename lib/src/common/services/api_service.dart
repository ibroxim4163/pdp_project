import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pdp_project/src/common/constants/custom_error.dart';

import '../constants/api_constants.dart';

enum Method {
  get,
  post,
  put,
  patch,
  delete,
}

class APIService {
  factory APIService() => _;

  const APIService._instance();

  static const _ = APIService._instance();

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConst.baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 10),
      headers: ApiConst.header(tokenAccess),
    ),
  )..interceptors.add(
      InterceptorsWrapper(
        onError: (e, handler) async {
          print("========================");
          print("${e.response?.statusCode}");
          print("========================");
          if (e.response?.statusCode == 403) {
            // final request = e.requestOptions;
            tokenAccess = await APIService.refToken();
            updateToken();
            handler.next(e);
          }
          handler.next(e);
        },
      ),
    );

  static void updateToken() {
    _dio.options.headers = ApiConst.header(tokenAccess);
  }

  Future<String> request(
    String requestPath, {
    Method method = Method.get,
    String queryParametersAll = "",
    Map<String, String> headers = const {},
    Object body = "",
  }) async {
    try {
      final response = await switch (method) {
        Method.get => _dio.get(requestPath),
        Method.post => _dio.post(requestPath, data: body),
        Method.put => _dio.put(requestPath, data: body),
        Method.patch => _dio.patch(requestPath, data: body),
        Method.delete => _dio.delete(requestPath),
      };

      return jsonDecode(response.data);
    } on TimeoutException catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      throw Error.throwWithStackTrace(
        "Check Your network",
        StackTrace.current,
      );
    } on DioException catch (e, stackTrace) {
      if (e.response?.statusCode == 403) {
        return await request(requestPath,
            body: body,
            headers: headers,
            method: method,
            queryParametersAll: queryParametersAll);
      } else if (e.response?.statusCode == 401) {
        throw Error.throwWithStackTrace(const AdminRegisterError("Admin not found"), stackTrace);
      } else {
        debugPrint("$e\n$stackTrace");
        rethrow;
      }
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      rethrow;
    }
  }

  static Future<String> refToken() async {
    final data = await Dio()
        .post(ApiConst.postRefreshToken, data: {"refresh": tokenRefresh});
    debugPrint(data.data["access"]);
    return data.data["access"];
  }
}
