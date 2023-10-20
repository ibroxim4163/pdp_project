import 'dart:convert';
import 'package:pdp_project/data/models/category_model.dart';
import 'package:pdp_project/data/services/api_service.dart';

abstract class ApiRepository {
  Future<List<CategoryModel>> getCategories();
}

class ApiRepositoryImp implements ApiRepository {
  final APIService apiService;
  const ApiRepositoryImp(this.apiService);

  @override
  Future<List<CategoryModel>> getCategories() async {
    const token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk3Nzg0NjI3LCJpYXQiOjE2OTc3ODQzMjcsImp0aSI6ImE0MzQ4ZmMzMWQxODQ4OWJhMzM5M2E1MGRmZjZjY2ZkIiwidXNlcl9pZCI6MX0.Umlq5Uoyl0ND_VQLbhQhWfBLoKq6KFWtXYwItBIILCE.Umlq5Uoyl0ND_VQLbhQhWfBLoKq6KFWtXYwItBIILCE";
    final header = {
      "Authorization": "$token",
      "Content-Type": "application/json",
    };
    String response =
        await apiService.request("https://docs.bionix.uz/api/category", headers: header);
    List<CategoryModel> categories =
        List<Map<String, Object?>>.from(jsonDecode(response))
            .map(CategoryModel.fromJson)
            .toList();
    print(categories);
    return categories;
  }
}
