import 'package:dailyzap/helpers/globals/navigator.dart';
import 'package:dailyzap_api/api.dart';

void navigate(String route, {Map<String, dynamic>? arguments}) {
  navigatorKey.currentState
      ?.pushNamedAndRemoveUntil(route, (route) => false, arguments: arguments);
}

void navigateNewSubPage(String route, {Map<String, dynamic>? arguments}) {
  navigatorKey.currentState?.pushNamed(route, arguments: arguments);
}

void openFriendPage(User friend) {
  navigateNewSubPage(
    '/friend',
    arguments: {'friend': friend},
  );
}

void openZapsPage(User user, List<Zap> zaps, int index) {
  navigateNewSubPage(
    '/zaps',
    arguments: {'zaps': zaps, 'user': user, 'index': index},
  );
}
