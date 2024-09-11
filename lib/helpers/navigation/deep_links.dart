import 'package:dailyzap/helpers/navigation/navigation.dart';

void handleDeepLink(Uri uri) async {
  switch (uri.host) {
    case 'invite':
      final server = uri.pathSegments[0];
      final token = uri.pathSegments[1];
      navigate('/auth/register', arguments: {'server': server, 'token': token});
      break;
  }
}
