import 'package:dailyzap/helpers/constants/storage_keys.dart';
import 'package:dailyzap_api/api.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

AuthApi? homeServerApi;

Future<bool> initHomeServerApi() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final basePath = sharedPreferences.getString(StorageKeys.homeServer);
  final sessionToken = sharedPreferences.getString(StorageKeys.sessionToken);
  homeServerApi = AuthApi(basePath != null
      ? ApiClient(
          basePath: basePath,
        )
      : null);
  return basePath != null && sessionToken != null;
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
  initHomeServerApi();
}

Future<void> setSessionToken(String token) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setString(StorageKeys.sessionToken, token);
  initHomeServerApi();
}

Future<void> logout() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.remove(StorageKeys.sessionToken);
  await sharedPreferences.remove(StorageKeys.homeServer);
  homeServerApi = null;
  await initHomeServerApi();
}
