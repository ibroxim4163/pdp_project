import 'dart:convert';

import 'package:flutter/material.dart';

import '../../feature/input/models/input_model.dart';
import '../../feature/input/models/post_input_model.dart';
import '../../feature/input/models/post_product_model.dart';
import '../../feature/input/models/posted_input_model.dart';
import '../../feature/output/models/output_model.dart';
import '../../feature/output/models/post_output_model.dart';
import '../constants/api_constants.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';
import '../models/refresh_token_model.dart';
import '../models/token_model.dart';
import '../services/api_service.dart';

abstract class ApiRepository {
  Future<TokenModel> getToken();

  Future<List<CategoryModel>> getCategories();

  Future<List<ProductModel>> getProducts(int id);

  Future<List<InputModel>> getInputs();

  Future<List<OutputModel>> getOutputs();

  Future<List<ProductModel>> search(String text);

  Future<void> postBalance(Map<String, String> dates);

  Future<void> deleteInput(int id);

  Future<PostedInputModel> postInput(
    PostInputModel inputModel,
  );

  Future<PostedOutputModel> postOutput(Map<String, Object?> json);

  Future<ProductModel> postProduct(PostProductModel productModel);
  Future<String> refreshToken();
  Future<void> deleteOutput(int id);
}

class ApiRepositoryImp implements ApiRepository {
  final APIService apiService;
  const ApiRepositoryImp(this.apiService);

  @override
  Future<TokenModel> getToken() async {
    final header = {
      "Content-Type": "application/json",
    };
    Map<String, String> body = {
      "username": "admin",
      "password": "1",
    };

    String response = await apiService.request(
      ApiConst.postToken,
      headers: header,
      body: jsonEncode(body),
      method: Method.post,
    );

    final TokenModel token = TokenModel.fromMap(jsonDecode(response));

    return token;
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final token = await getToken();
    final header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token.access}",
    };

    final response = await apiService.request(
      ApiConst.categoryPath,
      headers: header,
    );

    final categories = List<Map<String, Object?>>.from(jsonDecode(response))
        .map(CategoryModel.fromJson)
        .toList();

    return categories;
  }

  @override
  Future<List<ProductModel>> getProducts(int id) async {
    final token = await getToken();

    final header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token.access}",
    };

    final response = await apiService.request(
      ApiConst.categoryIdPath(id),
      headers: header,
    );
    final products = List<Map<String, Object?>>.from(jsonDecode(response))
        .map(ProductModel.fromJson)
        .toList();

    return products;
  }

  @override
  Future<List<InputModel>> getInputs() async {
    final token = await getToken();

    final header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token.access}",
    };

    final response = await apiService.request(
      ApiConst.inputGetPath,
      headers: header,
    );

    final List<InputModel> inputs =
        List<Map<String, Object?>>.from(jsonDecode(response))
            .map((InputModel.fromJson))
            .toList();

    return inputs;
  }

  @override
  Future<List<OutputModel>> getOutputs() async {
    final token = await getToken();

    final header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token.access}",
    };

    final response = await apiService.request(
      ApiConst.getOutputPath,
      headers: header,
    );

    final List<OutputModel> outputs =
        List<Map<String, Object?>>.from(jsonDecode(response))
            .map((OutputModel.fromJson))
            .toList();

    return outputs;
  }

  @override
  Future<List<ProductModel>> search(String text) async {
    final token = await getToken();

    final header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token.access}",
    };

    final response = await apiService.request(
      ApiConst.searchPath,
      queryParametersAll: text,
      headers: header,
    );

    final products = List<Map<String, Object?>>.from(jsonDecode(response))
        .map(ProductModel.fromJson)
        .toList();

    return products;
  }

  @override
  Future<void> postBalance(Map<String, String> dates) async {
    final token = await getToken();

    final header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token.access}",
    };

    final response = await apiService.request(
      ApiConst.balancePath,
      body: jsonEncode(dates),
      headers: header,
      method: Method.post,
    );

    debugPrint(response);
  }

  @override
  Future<void> deleteInput(int id) async {
    final token = await getToken();
    final header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token.access}",
    };
    final response = await apiService.request(
      ApiConst.deleteInputIdPath(id),
      headers: header,
      method: Method.delete,
    );
    debugPrint(response);
  }

  @override
  Future<void> deleteOutput(int id) async {
    final token = await getToken();
    final header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token.access}",
    };
    final response = await apiService.request(
      ApiConst.deleteOutputPath(id),
      headers: header,
      method: Method.delete,
    );

    debugPrint("response=$response");
  }

  @override
  Future<String> refreshToken() async {
    final token = await getToken();
    final header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token.access}",
    };
    final body = {
      "refresh": token.refresh,
    };

    final response = await apiService.request(
      ApiConst.postRefreshToken,
      method: Method.post,
      body: jsonEncode(body),
      headers: header,
    );
    RefreshTokenModel refreshToken =
        RefreshTokenModel.fromMap(jsonDecode(response));
    debugPrint(refreshToken.toString());

    return refreshToken.access;
  }

  @override
  Future<PostedInputModel> postInput(PostInputModel inputModel) async {
    final token = await getToken();
    final header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token.access}",
    };

    final response = await apiService.request(
      ApiConst.inputPostPath,
      method: Method.post,
      body: jsonEncode(inputModel.toJson()),
      headers: header,
    );

    final PostedInputModel postedProduct =
        PostedInputModel.fromJson(jsonDecode(response));
    debugPrint(postedProduct.toString());

    return postedProduct;
  }

  @override
  Future<PostedOutputModel> postOutput(Map<String, Object?> json) async {
    final token = await getToken();
    final header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token.access}",
    };

    final response = await apiService.request(
      ApiConst.postOutputPath,
      method: Method.post,
      body: jsonEncode(json),
      headers: header,
    );

    final PostedOutputModel postedProduct =
        PostedOutputModel.fromJson(jsonDecode(response));
    debugPrint(postedProduct.toString());

    return postedProduct;
  }

  @override
  Future<ProductModel> postProduct(PostProductModel productModel) async {
    final token = await getToken();
    final header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token.access}",
    };

    final response = await apiService.request(
      ApiConst.createProductPath,
      method: Method.post,
      body: jsonEncode(productModel.toJson()),
      headers: header,
    );

    final ProductModel product = ProductModel.fromJson(jsonDecode(response));

    debugPrint(product.toString());

    return product;
  }
}
