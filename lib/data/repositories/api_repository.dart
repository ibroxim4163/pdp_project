import 'package:pdp_project/data/models/category_model.dart';
import 'package:pdp_project/data/services/api_service.dart';

abstract class ApiRepository {
  Future<List<CategoryModel>> getCategories();
}

class ApiRepositoryImp implements ApiRepository {

  final APIService apiService;
  const ApiRepositoryImp(this.apiService);
  
  @override
  Future<List<CategoryModel>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  
}
