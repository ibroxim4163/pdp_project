abstract class ApiConst {
  static const baseUrl = "docs.bionix.uz/api";

  static const balancePath = "$baseUrl/balance";

  static const categoryPath = "$baseUrl/category";

  static String categoryIdPath(int id) => "$baseUrl/category/$id";

  static const inputGetPath = "$baseUrl/input";

  static const inputPostPath = "$baseUrl/input";

  static String deleteInputIdPath(int id) => "$baseUrl/input/id";

  static const getOutputPath = "$baseUrl/output";

  static const postOutputPath = "$baseUrl/output";

  static const createProductPath = "$baseUrl/product";

  //TODO search

  static const postToken = "$baseUrl/token/";

  static const postRefreshToken = "$baseUrl/token/refresh/";
}
