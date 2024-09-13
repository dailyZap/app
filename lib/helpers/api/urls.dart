import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:june/june.dart';

class CacheState extends JuneState {}

int myProfilePictureVersion = 0;

String getMyProfilePictureUrl() {
  return "${getApiBaseUrl()}/v1/profile/picture?v=$myProfilePictureVersion";
}
