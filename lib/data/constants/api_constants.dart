abstract class ApiConst {
  static const baseUrl = "https://docs.bionix.uz/api";

  static const balancePath = "$baseUrl/balance";

  static const categoryPath = "$baseUrl/category";

  static String categoryIdPath(int id) => "$baseUrl/category/$id";

  static const inputGetPath = "$baseUrl/input";

  static const inputPostPath = "$baseUrl/input";

  static String deleteInputIdPath(int id) => "$baseUrl/input/$id";
  
  static String deleteOutputPath(int id) => "$baseUrl/output/$id";

  static const getOutputPath = "$baseUrl/output";

  static const postOutputPath = "$baseUrl/output";

  static const createProductPath = "$baseUrl/product";

  static const searchPath = "$baseUrl/search?search=";

  static const postToken = "$baseUrl/token/";

  static const postRefreshToken = "$baseUrl/token/refresh/";
}
