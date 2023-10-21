import 'dart:convert';

import 'package:pdp_project/data/constants/api_constants.dart';
import 'package:pdp_project/presentation/input_screen/models/input_model.dart';
import 'package:pdp_project/presentation/input_screen/models/post_product_model.dart';
import 'package:pdp_project/presentation/output_screen/models/output_model.dart';
import 'package:pdp_project/presentation/output_screen/models/post_output_model.dart';
import 'package:pdp_project/presentation/input_screen/models/post_input_model.dart';
import 'package:pdp_project/data/models/product_model.dart';
import 'package:pdp_project/data/models/refresh_token_model.dart';
import 'package:pdp_project/data/models/token_model.dart';

import '../models/category_model.dart';
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
    Map<String, Object?> json,
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

    print(categories);

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

    print(products);

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

    print(inputs);

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

    print(outputs);

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

    print(response);
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

    print("response=$response");
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

    print("response=$response");
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
    print(refreshToken);

    return refreshToken.access;
  }

  @override
  Future<PostedInputModel> postInput(Map<String, Object?> json) async {
    final token = await getToken();
    final header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token.access}",
    };

    final response = await apiService.request(
      ApiConst.inputPostPath,
      method: Method.post,
      body: jsonEncode(json),
      headers: header,
    );

    final PostedInputModel postedProduct =
        PostedInputModel.fromJson(jsonDecode(response));
    print(postedProduct);

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
    print(postedProduct);

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

    print(product);

    return product;
  }
}
