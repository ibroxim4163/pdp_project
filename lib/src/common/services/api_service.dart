import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/api_constants.dart';
import '../models/token_model.dart';

enum Method {
  get,
  post,
  put,
  patch,
  delete,
}

// String username = "";
// String password = "";

class APIService {
  factory APIService() => _;

  APIService._instance();

  static Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConst.baseUrl,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token}",
      },
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  static final _ = APIService._instance();

  Future<String> request(
    String requestPath, {
    Method method = Method.get,
    String queryParametersAll = "",
    Map<String, String> headers = const {},
    Object body = "",
    // Map<String, String> body = const {},
  }) async {
    // final params = _queryToString(queryParametersAll);
    final uri = Uri.parse("$requestPath$queryParametersAll");

    // if

    try {
      Response response = await switch (method) {
        Method.get => _dio.get(requestPath, he: headers),
        Method.post => _dio.post(requestPath, headers: headers, body: body),
        Method.put => _dio.put(requestPath, headers: headers, body: body),
        Method.patch => _dio.patch(requestPath, headers: headers, body: body),
        Method.delete => _dio.delete(requestPath, headers: headers),
      };

      return switch (response.statusCode) {
        < 200 => throw Error.throwWithStackTrace(
            "${response.reasonPhrase}",
            StackTrace.current,
          ),
        >= 200 && < 300 => response.body,
        >= 300 && 400 => throw Error.throwWithStackTrace(
            "${response.reasonPhrase}",
            StackTrace.current,
          ),
        >= 400 && < 500 => await () async {
            if (response.statusCode == 401 || response.statusCode == 409) {
              final header = {
                "Content-Type": "application/json",
              };
              Map<String, String> bodyToken = {
                "username": "admin",
                "password": "1",
              };

              String response = await request(
                ApiConst.postToken,
                headers: header,
                body: jsonEncode(bodyToken),
                method: Method.post,
              );

              final TokenModel token = TokenModel.fromMap(jsonDecode(response));
              AndroidOptions getAndroidOptions() => const AndroidOptions(
                    encryptedSharedPreferences: true,
                  );
              final storage =
                  FlutterSecureStorage(aOptions: getAndroidOptions());
              storage.write(key: "access", value: token.access);
              storage.write(key: "refresh", value: token.refresh);
              print(storage.read(key: "access"));
              final headerToken = {
                "Content-Type": "application/json",
                "Authorization": "Bearer ${token.access}",
              };

              return await request(
                requestPath,
                method: method,
                queryParametersAll: queryParametersAll,
                headers: headerToken,
                body: body,
              );
            }

            return throw Error.throwWithStackTrace(
              "Token Error",
              StackTrace.current,
            );
          }(),
        >= 500 => throw Error.throwWithStackTrace(
            "Server Error",
            StackTrace.current,
          ),
        _ => throw Error.throwWithStackTrace(
            "Unexpected Error",
            StackTrace.current,
          ),
      };
    } on TimeoutException catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      throw Error.throwWithStackTrace(
        "Check Your network",
        StackTrace.current,
      );
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      rethrow;
    }
  }

  // String _queryToString(Map<String, List<String>> query) => query.isEmpty
  //     ? ""
  //     : "?search=${query.entries.map(
  //           (e) => e.value.map((v) => "${e.key}=$v").toList(),
  //         ).map<String>(
  //           (e) => e.join("&"),
  //         ).join("&")}";
}
