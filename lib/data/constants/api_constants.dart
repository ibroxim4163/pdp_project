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

  Map<String, String> tokenHeader() => {
    "Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk3NzgyNjg1LCJpYXQiOjE2OTc3ODIzODUsImp0aSI6IjZjMzU2ZGNiY2UyYTQ5NzM4ZmIyZjE3YmI4Y2QwYjAwIiwidXNlcl9pZCI6MX0.p_6MieCnLEzeXCSbbtQ9H3jNH62cO4lcnZz5tH8c3As",
    "Postman-Token":"<calculated when request is sent>",
    "Content-Type":"",

  };
}
