import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap_api/api.dart';
import 'package:http/http.dart';

import '../navigation/navigation.dart';

class MyApiClient extends ApiClient {
  MyApiClient({
    super.basePath,
    super.authentication,
  });

  @override
  Future<Response> invokeAPI(
    String path,
    String method,
    List<QueryParam> queryParams,
    Object? body,
    Map<String, String> headerParams,
    Map<String, String> formParams,
    String? contentType,
  ) async {
    final response = await super.invokeAPI(
      path,
      method,
      queryParams,
      body,
      headerParams,
      formParams,
      contentType,
    );
    if (response.statusCode == 401) {
      await logout();
      navigate("/");
    }
    return response;
  }
}
