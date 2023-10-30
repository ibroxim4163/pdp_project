

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/token_model.dart';

class SecureStorage {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  final String access = "access";
  final String refresh = "refresh";

  void writeSecureStore(TokenModel tokenModel) async {
    await storage.write(key: access, value: tokenModel.access);
    await storage.write(key: refresh, value: tokenModel.refresh);
  }

  Future<String?> getAccess() async {
    return await storage.read(key: access);
  }

   Future<String?> getRefresh() async {
    return await storage.read(key: refresh);
  }
}
