import 'package:dailyzap/helpers/constants/storage_keys.dart';
import 'package:dailyzap_api/api.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

AuthApi? authApi;
ProfileApi? profileApi;

Future<bool> initHomeServerApi() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final basePath = sharedPreferences.getString(StorageKeys.homeServer);
  final sessionToken = sharedPreferences.getString(StorageKeys.sessionToken);
  authApi = AuthApi(basePath != null
      ? ApiClient(
          basePath: basePath,
        )
      : null);
  final loggedIn = basePath != null && sessionToken != null;
  if (loggedIn) {
    final authenticatedApiClient = ApiClient(
        basePath: basePath,
        authentication: HttpBearerAuth()..accessToken = sessionToken);
    profileApi = ProfileApi(authenticatedApiClient);
  }

  return loggedIn;
}

Future<void> setServerUrl(String url) async {
  if (!url.startsWith("http")) {
    url = "http${kDebugMode ? "" : "s"}://$url";
  }
  if (url.endsWith("/")) {
    url = url.substring(0, url.length - 1);
  }
  final sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setString(StorageKeys.homeServer, url);
  await initHomeServerApi();
}

Future<void> setSessionToken(String token) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setString(StorageKeys.sessionToken, token);
  await initHomeServerApi();
}

Future<void> logout() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.remove(StorageKeys.sessionToken);
  await sharedPreferences.remove(StorageKeys.homeServer);
  authApi = null;
  await initHomeServerApi();
}

String getApiBaseUrl() {
  return authApi?.apiClient.basePath ?? "";
}

String getSessionToken() {
  return (profileApi?.apiClient.authentication as HttpBearerAuth?)
          ?.accessToken ??
      "";
}

Map<String, String> getAuthHeader() {
  return {"Authorization": "Bearer ${getSessionToken()}"};
}
